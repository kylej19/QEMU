#!/usr/bin/env sh

curl -L "https://cloud.debian.org/images/cloud/trixie/daily/latest/debian-13-nocloud-riscv64-daily.qcow2" -o debian-13-nocloud-riscv64-daily.qcow2
mv debian-13-nocloud-riscv64-daily.qcow2 nocloud.qcow2
qemu-img resize nocloud.qcow2 24G

