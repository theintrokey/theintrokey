#!/bin/sh

if which grub-editenv-bk >/dev/null 2>&1; then
    grub_editenv_cmd=grub-editenv-bk
elif which grub2-editenv-bk >/dev/null 2>&1; then
    grub_editenv_cmd=grub2-editenv-bk
else
    grub_editenv_cmd=grub-editenv-bk
fi

curdate=$(date)
if [ -e /dev/mapper/ventoy -a -d /etc/vtoyboot/editenv ]; then
    $grub_editenv_cmd $* > /etc/vtoyboot/editenv/tmp_stdout 2>/etc/vtoyboot/editenv/tmp_stderr
    code=$?
    if [ $code -eq 0 ]; then
        cat /etc/vtoyboot/editenv/tmp_stdout
        exit 0
    fi

    newpara=$(echo $* | sed "s#/dev/mapper/ventoy#/dev/sda#")
    echo "[$curdate] oldpara=$* newpara=$newpara" >> /etc/vtoyboot/editenv/match.log

    id=1
    while [ -n "1" ]; do
        if [ -d /etc/vtoyboot/editenv/$id ]; then
            para=$(head -n1 /etc/vtoyboot/editenv/$id/param)
            if [ "$para" = "$newpara" ]; then
                code=$(cat /etc/vtoyboot/editenv/$id/errcode)
                cat /etc/vtoyboot/editenv/$id/stdout
                if [ $code -ne 0 ]; then
                    cat /etc/vtoyboot/editenv/$id/stderr >&2
                fi
                
                echo "[$curdate] grub-editenv match history id=$id code=$code" >> /etc/vtoyboot/editenv/match.log
                exit $code
            fi
        else
            break
        fi
        id=$(expr $id + 1)
    done

    echo "[$curdate] grub-editenv NO match $*" >> /etc/vtoyboot/editenv/match.log
    cat /etc/vtoyboot/editenv/tmp_stdout
    cat /etc/vtoyboot/editenv/tmp_stderr >&2
    exit $code
else
    [ -d /etc/vtoyboot/editenv ] || mkdir -p /etc/vtoyboot/editenv
    
    id=1
    override=0
    while [ -d /etc/vtoyboot/editenv/$id ]; do
        para=$(head -n1 /etc/vtoyboot/editenv/$id/param)
        if [ "$para" = "$*" ]; then
            echo "[$curdate] override $id $*" >> /etc/vtoyboot/editenv/history.log
            override=1
            break
        fi
        id=$(expr $id + 1)
    done

    if [ $override -eq 0 ]; then
        echo "[$curdate] $*" >> /etc/vtoyboot/editenv/history.log
    fi

    mkdir -p /etc/vtoyboot/editenv/$id
    echo "$*" > /etc/vtoyboot/editenv/$id/param
    $grub_editenv_cmd $* > /etc/vtoyboot/editenv/$id/stdout 2>/etc/vtoyboot/editenv/$id/stderr
    code=$?
    echo $code > /etc/vtoyboot/editenv/$id/errcode
    
    cat /etc/vtoyboot/editenv/$id/stdout
    cat /etc/vtoyboot/editenv/$id/stderr >&2
    exit $code
fi

