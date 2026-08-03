#!/usr/bin/env sh

# ~/QEMU/RUN/right.sh
# runs the r-variant FreeBSD virtual machine


qemu-system-x86_64 -monitor none \
    -cpu host \
    -accel kvm \
    -vga std \
    -m 4096 \
    -smp 4 \
    -cdrom /home/kj/QEMU/ISO/fbsd.iso \
    -boot order=cd,menu=on \
    -drive if=none,id=drive0,cache=writeback,aio=threads,format=qcow2,discard=unmap,file=/home/kj/QEMU/VM/right.qcow2 \
    -device virtio-blk-pci,drive=drive0,bootindex=1 \
    -netdev user,id=nd0,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=nd0,mac=08:08:80:80:08:08 \
