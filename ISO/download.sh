#!/usr/bin/env sh

set -e

# $HOME QEMU/ISO/download.sh

data=$HOME/QEMU/ISO/
url=$1

if curl -fsSL --output-dir $data -O "$url"; then
    echo "\n\nsuccess :)\n"
    echo "you still need to link the downloaded file manually"
else
    echo "download failed :("
    exit 1
fi
