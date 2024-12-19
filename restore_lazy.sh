#!/bin/bash

RESTORE_POINT="./checkpoint/lazy"
PROCSES_NAME="./simple_loop.out"
PAGE_SERVER="192.168.196.20"
echo "Restoring process"

sudo criu restore --images-dir $RESTORE_POINT --shell-job
