#!/bin/sh
#************************************************************************************
# Copyright (c) 2020, longpanda <admin@ventoy.net>
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.
# 
#************************************************************************************

type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh

###########################
###########################
#AUTO_INSERT_COMMON_FUNC

ventoy_check_efivars() {
    if [ -e /sys/firmware/efi ]; then
        if grep -q efivar /proc/mounts; then
            :
        else
            if [ -e /sys/firmware/efi/efivars ]; then
                mount -t efivarfs efivarfs /sys/firmware/efi/efivars  >/dev/null 2>&1
            fi
        fi
    fi
}

ventoy_log() {
    echo "$@" >> /tmp/vtoy.log
}

ventoy_need_dm_patch() {
    if vtoydump -R > /dev/null 2>&1; then
        [ 1 -eq 1 ]; return
    fi
    
    if grep -q "VTOY_LINUX_REMOUNT=1" /proc/cmdline; then
        [ 1 -eq 1 ]; return
    fi
    
    [ 1 -eq 0 ]
}

ventoy_check_insmod() {
    if [ -f /bin/kmod ]; then
        [ -f /bin/insmod ] || ln -s /bin/kmod /bin/insmod
        [ -f /bin/lsmod ]  || ln -s /bin/kmod /bin/lsmod
    fi
}

ventoy_need_proc_ibt() {
    vtKv=$(uname -r)
    vtMajor=$(echo $vtKv | awk -F. '{print $1}')
    vtMinor=$(echo $vtKv | awk -F. '{print $2}')
    
    #ibt was supported since linux kernel 5.18
    if [ $vtMajor -lt 5 ]; then
        false; return
    elif [ $vtMajor -eq 5 ]; then
        if [ $vtMajor -lt 18 ]; then
            false; return
        fi
    fi
    
    if grep -q ' ibt=off' /proc/cmdline; then
        false; return
    fi

    #hardware CPU doesn't support IBT
    if vtoytool vtoykmod -I; then
        :
    else
        false; return
    fi
    
    #dot.CONFIG not enabled
    if grep -q ' ibt_restore$' /proc/kallsyms; then
        :
    else
        false; return
    fi
    
    true
}


ventoy_do_dm_patch() {
    vtDmPatchDebug=0
    ventoy_log 'ventoy_do_dm_patch'
    if [ -f /tmp/dm_patch.ko ]; then
        if grep -q 'dm_patch' /proc/modules; then
            ventoy_log "dm_patch already exist"
        else
            ventoy_log "dm_patch reinstall"
            insmod /tmp/dm_patch.ko >>/tmp/vtoy.log 2>&1    
            if grep -q 'dm_patch' /proc/modules; then
                ventoy_log "dm_patch reinstall success"
            else
                ventoy_log "dm_patch reinstall failed"
            fi
        fi
        return 
    fi

    if [ -f /bin/vtoydump ]; then
        vtHeadSize=$(stat -c '%s' /bin/vtoydump)
        dd if=/bin/vtoydmpatch of=/tmp/dm_patch.ko bs=1 skip=$vtHeadSize >/dev/null 2>&1
    elif [ -f /sbin/vtoydump ]; then
        vtHeadSize=$(stat -c '%s' /sbin/vtoydump)
        dd if=/sbin/vtoydmpatch of=/tmp/dm_patch.ko bs=1 skip=$vtHeadSize >/dev/null 2>&1
    else
        ventoy_log 'vtoydump not found'
        return
    fi
    
    if ! grep -m1 -q dm_get_table_device /proc/kallsyms; then
        ventoy_log "modprobe dm_mod"
        modprobe dm_mod >>/tmp/vtoy.log 2>&1
    fi
    
    cat /proc/kallsyms | sort > /tmp/kallsyms

    if grep -m1 -q 'open_table_device.isra' /tmp/kallsyms; then
        vtLine=$(vtoytool vtoyksym open_table_device.isra /tmp/kallsyms)
    else
        vtLine=$(vtoytool vtoyksym dm_get_table_device /tmp/kallsyms)
    fi    
    get_addr=$(echo $vtLine | awk '{print $1}')
    get_size=$(echo $vtLine | awk '{print $2}')

    vtLine=$(vtoytool vtoyksym blkdev_get_by_dev /tmp/kallsyms) 
    blkdev_get_addr=$(echo $vtLine | awk '{print $1}')
    
    vtLine=$(vtoytool vtoyksym blkdev_put /tmp/kallsyms)        
    blkdev_put_addr=$(echo $vtLine | awk '{print $1}')
    
    if grep -m1 -q 'close_table_device.isra' /tmp/kallsyms; then
        vtLine=$(vtoytool vtoyksym close_table_device.isra /tmp/kallsyms)
    else
        vtLine=$(vtoytool vtoyksym dm_put_table_device /tmp/kallsyms)
    fi
    put_addr=$(echo $vtLine | awk '{print $1}')
    put_size=$(echo $vtLine | awk '{print $2}')
    
    ro_addr=$(grep ' set_memory_ro$' /proc/kallsyms | awk '{print $1}')
    rw_addr=$(grep ' set_memory_rw$' /proc/kallsyms | awk '{print $1}')
    kprobe_reg_addr=$(grep ' register_kprobe$' /proc/kallsyms | awk '{print $1}')
    kprobe_unreg_addr=$(grep ' unregister_kprobe$' /proc/kallsyms | awk '{print $1}')
    
    if [ "$VTOY_DEBUG_LEVEL" = "01" ]; then
        vtDmPatchDebug=1
    fi
    
    if grep -q 'dmpatch_debug' /proc/cmdline; then
        vtDmPatchDebug=1
    fi
    
    if [ $vtDmPatchDebug -eq 1 ]; then
        printk_addr=$(grep ' printk$' /proc/kallsyms | awk '{print $1}')
        vtDebug="-v"
    elif grep -q "vtdebug" /proc/cmdline; then
        printk_addr=$(grep ' printk$' /proc/kallsyms | awk '{print $1}')
        vtDebug="-v"
    else
        printk_addr=0
    fi
    
    if [ -z "$printk_addr" ]; then
        printk_addr=$($GREP ' _printk$' /proc/kallsyms | awk '{print $1}')
    fi
    
    if ventoy_need_proc_ibt; then
        ventoy_log "need to proc IBT"
        vtIBT='0x8888'
    else
        ventoy_log "NO need to proc IBT"
        vtIBT='0'
    fi 
    
    #printk_addr=$(grep ' printk$' /proc/kallsyms | awk '{print $1}')
    #vtDebug="-v"

    ventoy_log get_addr=$get_addr  get_size=$get_size
    ventoy_log put_addr=$put_addr  put_size=$put_size
    ventoy_log blkdev_get_addr=$blkdev_get_addr blkdev_put_addr=$blkdev_put_addr
    ventoy_log kprobe_reg_addr=$kprobe_reg_addr  kprobe_unreg_addr=$kprobe_unreg_addr
    ventoy_log ro_addr=$ro_addr  rw_addr=$rw_addr  printk_addr=$printk_addr

    if [ "$get_addr" = "0" -o "$put_addr" = "0" ]; then
        ventoy_log "Invalid symbol address"
        return
    fi
    if [ "$ro_addr" = "0" -o "$rw_addr" = "0" ]; then
        ventoy_log "Invalid symbol address"
        return
    fi

    vtKv=$(uname -r)
    vtKVMajor=$(echo $vtKv | awk -F. '{print $1}')
    vtKVMinor=$(echo $vtKv | awk -F. '{print $2}')
    
    if [ ! -d /lib/modules/$vtKv ]; then
        ventoy_log "No modules directory found"
        return
    elif [ -d /lib/modules/$vtKv/kernel/fs ]; then
        vtModPath=$(find /lib/modules/$vtKv/kernel/fs/ -name "*.ko*" | head -n1)
    else
        vtModPath=$(find /lib/modules/$vtKv/kernel/ -name "xfs.ko*" | head -n1)
    fi
    
    if [ -z "$vtModPath" ]; then
        vtModPath=$(find /lib/modules/$vtKv/kernel/ -name "*.ko*" | head -n1)
    fi
    
    vtModName=$(basename $vtModPath)
    [ -f /tmp/$vtModName ] && rm -f /tmp/$vtModName
    
    ventoy_log "template module is $vtModPath $vtModName"
    
    if [ -z "$vtModPath" ]; then
        ventoy_log "No template module found"
        return
    elif echo $vtModPath | grep -q "[.]ko$"; then
        cp -a $vtModPath  /tmp/$vtModName
    elif echo $vtModPath | grep -q "[.]ko[.]xz$"; then
        xzcat $vtModPath > /tmp/$vtModName
    elif echo $vtModPath | grep -q "[.]ko[.]gz$"; then
        zcat $vtModPath > /tmp/$vtModName
    elif echo $vtModPath | grep -q "[.]ko[.]zst$"; then
        zstdcat $vtModPath > /tmp/$vtModName
    else
        ventoy_log "unsupport module type"
        return
    fi

    
    #step1: modify vermagic/mod crc/relocation
    vtoytool vtoykmod -u $vtKVMajor $vtKVMinor /tmp/dm_patch.ko /tmp/$vtModName $vtDebug >>/tmp/vtoy.log 2>&1
    
    #step2: fill parameters
    vtPgsize=$(vtoytool vtoyksym -p)
    vtoytool vtoykmod -f /tmp/dm_patch.ko $vtPgsize 0x$printk_addr 0x$ro_addr 0x$rw_addr $get_addr $get_size $put_addr $put_size 0x$kprobe_reg_addr 0x$kprobe_unreg_addr $vtKVMajor $vtIBT $vtKVMinor $blkdev_get_addr $blkdev_put_addr $vtDebug >>/tmp/vtoy.log 2>&1

    ventoy_check_insmod
    insmod /tmp/dm_patch.ko >>/tmp/vtoy.log 2>&1
    
    if grep -q 'dm_patch' /proc/modules; then
        ventoy_log "dm_patch success"
    else
        ventoy_log "dm_patch failed"
    fi
}


ventoy_dm_patch_proc_begin() {
    if ventoy_need_dm_patch; then
        export vtLevel1=$(cat /proc/sys/kernel/printk | awk '{print $1}')
        export vtLevel2=$(cat /proc/sys/kernel/printk | awk '{print $2}')
        export vtLevel3=$(cat /proc/sys/kernel/printk | awk '{print $3}')
        export vtLevel4=$(cat /proc/sys/kernel/printk | awk '{print $4}')
        
        #suppress printk message
        echo 0 $vtLevel2 0 $vtLevel4 > /proc/sys/kernel/printk
    fi
}

ventoy_dm_patch_install() {
    if ventoy_need_dm_patch; then
        ventoy_do_dm_patch
    fi
}

ventoy_dm_patch_remove() {
    if ventoy_need_dm_patch; then  
        if grep -q 'dm_patch' /proc/modules; then
            ventoy_log "remove dm_patch"
            rmmod dm_patch
        fi
    fi
}

ventoy_dm_create_ventoy() {
    ventoy_dm_patch_install
    dmsetup create ventoy /ventoy_table
    vret=$?
    ventoy_dm_patch_remove
    return $vret
}

ventoy_dm_patch_proc_end() {
    if ventoy_need_dm_patch; then    
        #recover printk level
        echo $vtLevel1 $vtLevel2 $vtLevel3 $vtLevel4 > /proc/sys/kernel/printk
    fi
}

#check for efivarfs
ventoy_check_efivars

if ! vtoydump > /dev/null 2>&1; then
    info 'vtoydump failed'
    return
fi

#already done
if dmsetup ls | grep -q ventoy; then
    info 'ventoy already exist'
    return
fi

ventoy_dm_patch_proc_begin

#flush multipath before dmsetup
multipath -F > /dev/null 2>&1

vtoydump -L > /ventoy_table
if ventoy_dm_create_ventoy; then
    :
else
    sleep 3
    multipath -F > /dev/null 2>&1
    ventoy_dm_create_ventoy
fi

DEVDM=/dev/mapper/ventoy

loop=0
while ! [ -e $DEVDM ]; do
    sleep 0.5
    let loop+=1
    if [ $loop -gt 10 ]; then
        echo "Waiting for ventoy device ..." > /dev/console
    fi

    if [ $loop -gt 10 -a $loop -lt 15 ]; then
        multipath -F > /dev/null 2>&1
        ventoy_dm_create_ventoy
    fi
done

for ID in $(vtoypartx $DEVDM -oNR | grep -v NR); do
    PART_START=$(vtoypartx  $DEVDM -n$ID -oSTART,SECTORS | grep -v START | awk '{print $1}')
    PART_SECTOR=$(vtoypartx $DEVDM -n$ID -oSTART,SECTORS | grep -v START | awk '{print $2}')
    
    echo "0 $PART_SECTOR linear $DEVDM $PART_START" > /ventoy_part_table    
    dmsetup create ventoy$ID /ventoy_part_table
done

rm -f /ventoy_table
rm -f /ventoy_part_table

ventoy_dm_patch_proc_end
