#!/bin/bash

set -e
set -x

echo Creating Device Node
if ! [ -e /host/dev/nr_cdev0 ]
then
    mknod /host/dev/nr_cdev0 c 200 0
fi
if ! [ -e /host/dev/nr_cdev1 ]
then
    mknod /host/dev/nr_cdev1 c 201 0
fi
if ! [ -d /host/etc/nr ]
then
    mkdir /host/etc/nr
fi

if  chroot /host lsmod  | grep nr_drv > /dev/null 2>&1
then
    echo NR Driver Module had loaded!
else
    echo Inserting NR Driver Module
    # chroot /host rmmod nr_drv > /dev/null 2>&1

    if [ $(uname -r) == "4.18.0-305.19.1.rt7.91.el8_4.x86_64" ];
    then
        echo insmod nr_drv_wr.ko ...
        /bin/cp -f nr_drv_wr.ko /host/tmp/nr_drv_wr.ko
        # chroot /host semanage boolean --list | grep domain_kernel_load_modules
        # chroot /host semanage boolean --modify --on domain_kernel_load_modules
        # chroot /host restorecon /tmp/nr_drv_wr.ko
        chroot /host chcon -t modules_object_t /tmp/nr_drv_wr.ko
        chroot /host insmod /tmp/nr_drv_wr.ko load_xeth=1
        /bin/rm -f /host/tmp/nr_drv_wr.ko
        # chroot /host semanage boolean --modify --off domain_kernel_load_modules

        CON_NAME=`chroot /host nmcli -g GENERAL.CONNECTION dev show xeth`

        chroot /host nmcli connection modify "$CON_NAME" con-name xeth
        chroot /host nmcli connection modify xeth ipv4.method disabled ipv6.method disabled
        chroot /host nmcli dev conn xeth
    else
        echo insmod nr_drv_ko Failed!
    fi

fi