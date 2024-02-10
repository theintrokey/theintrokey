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

. ./tools/efi_legacy_grub.sh

if [ -e /lib/dracut/dracut-install ]; then
    vtmodpath=/lib/dracut/modules.d/99ventoy
else
    vtmodpath=/usr/lib/dracut/modules.d/99ventoy
fi

if [ -d /etc/dracut.conf.d ]; then
    dracutConfPath=/etc/dracut.conf.d
else
    dracutConfPath=/usr/lib/dracut/dracut.conf.d
fi


rm -f /bin/vtoydump /bin/vtoypartx /bin/vtoytool /bin/vtoydmpatch
rm -f $dracutConfPath/ventoy.conf
rm -rf $vtmodpath
mkdir -p $vtmodpath

cp -a $vtdumpcmd /bin/vtoydump
cp -a $partxcmd /bin/vtoypartx
cp -a $vtoytool /bin/vtoytool
cat /bin/vtoydump $dmpatchko > /bin/vtoydmpatch
cp -a ./distros/$initrdtool/module-setup.sh $vtmodpath/
cp -a ./distros/$initrdtool/ventoy-settled.sh $vtmodpath/

#early centos release doesn't have require_binaries
if [ -e $vtmodpath/../../dracut-functions ]; then
    if grep -q require_binaries $vtmodpath/../../dracut-functions; then
        :
    else
        sed "/require_binaries/d" -i $vtmodpath/module-setup.sh
    fi
fi


for md in $(cat ./tools/vtoydrivers); do
    if [ -n "$md" ]; then
        if modinfo -n $md 2>/dev/null | grep -q '\.ko'; then
            extdrivers="$extdrivers $md"
        fi
    fi
done


#generate dracut conf file
cat >$dracutConfPath/ventoy.conf <<EOF
add_dracutmodules+=" ventoy "
force_drivers+=" $extdrivers "
EOF


echo "updating the initramfs, please wait ..."
dracut -f --no-hostonly

kv=$(uname -r)
for k in $(ls /lib/modules); do
    if [ "$k" != "$kv" ]; then
        echo "updating initramfs for $k please wait ..."
        dracut -f --no-hostonly --kver $k
    fi
done


disable_grub_os_probe

#wrapper grub-probe
echo "grub mkconfig ..."
PROBE_PATH=$(find_grub_probe_path)
EDITENV_PATH=$(find_grub_editenv_path)
MKCONFIG_PATH=$(find_grub_mkconfig_path)
echo "PROBE_PATH=$PROBE_PATH EDITENV_PATH=$EDITENV_PATH MKCONFIG_PATH=$MKCONFIG_PATH"

if [ -e "$PROBE_PATH" -a -e "$MKCONFIG_PATH" ]; then
    wrapper_grub_probe $PROBE_PATH
    if [ -e "$EDITENV_PATH" ]; then
        wrapper_grub_editenv $EDITENV_PATH
    fi

    GRUB_CFG_PATH=$(find_grub_config_path)
    if [ -f "$GRUB_CFG_PATH" ]; then
        echo "$MKCONFIG_PATH -o $GRUB_CFG_PATH"
        $MKCONFIG_PATH -o $GRUB_CFG_PATH
    else
        echo "$MKCONFIG_PATH null"
        $MKCONFIG_PATH > /dev/null 2>&1
    fi
fi


if [ -e /sys/firmware/efi ]; then
    if [ -e /dev/mapper/ventoy ]; then
        echo "This is ventoy enviroment"
    else
        update_grub_config
        install_legacy_bios_grub
    fi
    
    if [ "$1" = "-s" ]; then
        recover_shim_efi
    else
        replace_shim_efi
    fi
    
    if [ -d /boot/EFI/EFI/mageia ]; then
        if ! [ -d /boot/EFI/EFI/boot ]; then
            mkdir -p /boot/EFI/EFI/boot
            if [ -f /boot/EFI/EFI/mageia/grubx64.efi ]; then
                cp -a /boot/EFI/EFI/mageia/grubx64.efi /boot/EFI/EFI/boot/bootx64.efi
            fi
        fi
    fi
    
fi
