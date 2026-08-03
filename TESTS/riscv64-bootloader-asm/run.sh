#!/usr/bin/env sh

qemu-system-riscv64 \
    -M virt \
    -m 128M \
    -nographic \
    -bios none \
    -kernel baremetal.elf \
    -s -S
