#!/bin/bash
set -e

WORKDIR="$PWD/release/firmware/STM32F103C8_BluePill"
LOGFILE="$WORKDIR/build.log"
rm -f $LOGFILE
exec &> >(tee -a "$LOGFILE")
docker build -t versaloon:latest .
docker run -v $WORKDIR:/mnt versaloon:latest bash -c "sudo cp -v /home/versaloon/code/dongle/firmware/Projects/Versaloon/GCC/* /mnt"
