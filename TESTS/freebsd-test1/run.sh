#!/usr/bin/env sh

qemu-system-x86_64 \
    -cpu host -accel kvm \
    -M q35 -m 1024M -smp 1 \
    -hda vda-33G.qcow2 \
    -nic user \
    -vga std \
    -display gtk \
#   -cdrom FreeBSD-15.1-RELEASE-amd64-dvd1.iso
