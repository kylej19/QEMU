#!/usr/bin/env sh

# ~/QEMU/RUN/boot.sh
# runs one of a few qemu systems
# first argument (required) selects the machine, the second is the optional port for ssh on the localhost 

set -e
cdrom=$HOME/QEMU/ISO/
disk=$HOME/QEMU/VM/
machine=$1

if [ -z "$machine" ]; then
    echo "Error! usage requires machine argument"
    exit 1
fi

qemu-system-x86_64 -monitor none \
    -cpu host \
    -accel kvm \
    -vga std \
    -m 4096 \
    -smp 4 \
    -cdrom $cdrom$machine.iso \
    -boot order=cd,menu=on \
    -drive if=none,id=drive0,cache=writeback,aio=threads,format=qcow2,discard=unmap,file=$disk$machine.qcow2 \
    -device virtio-blk-pci,drive=drive0,bootindex=1 \
    -netdev user,id=nd0,hostfwd=tcp::${2:-2222}-:22 \
    -device virtio-net-pci,netdev=nd0,mac=08:08:80:80:08:08 \
