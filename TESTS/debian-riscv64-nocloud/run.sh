#!/usr/bin/env sh

OVMF_CODE="RISCV_VIRT_CODE.fd"
OVMF_VARS="RISCV_VIRT_VARS.fd"

qemu-system-riscv64 \
    -M virt,pflash0=pflash0,pflash1=pflash1 -accel tcg \
    -m 2048M -smp 2 \
    -blockdev node-name=pflash0,driver=file,read-only=on,filename="$OVMF_CODE" \
    -blockdev node-name=pflash1,driver=file,filename="$OVMF_VARS" \
    -device virtio-scsi-pci,id=scsi0 \
    -drive file="nocloud.qcow2",format=qcow2,id=hd0,if=none \
    -device virtio-blk-device,drive=hd0 \
    -netdev user,id=net0 \
    -device virtio-net-device,netdev=net0 \
    -nographic

