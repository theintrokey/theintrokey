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

vtoy_false() {
    [ -z "1" ]
}

vtoy_true() {
    [ -n "1" ]
}


vtoy_check_initramfs_tool() {
    if which update-initramfs >/dev/null 2>&1; then
        
        if ! [ -f /usr/share/initramfs-tools/hook-functions ]; then
            vtoy_false; return
        fi
        
        if ! [ -f /usr/share/initramfs-tools/hooks/dmsetup ]; then
            vtoy_false; return
        fi
        
        if ! [ -d /etc/initramfs-tools/scripts/local-top ]; then
            vtoy_false; return
        fi
        
        vtoy_true
    else
        vtoy_false
    fi
}
