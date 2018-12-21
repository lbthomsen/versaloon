#!/bin/bash
DEVICE="/dev/ttyUSB0"
FILE="Versaloon-STM32F103C8_BluePill.bin"
docker run --privileged -v $DEVICE:$DEVICE -v $PWD:/mnt zoobab/stm32flash-docker -w /mnt/$FILE -v -g 0x8000000 $DEVICE
EXITCODE="$?"
if [ $EXITCODE -eq 0 ]; then
	echo "OK, flashing is successful!"
else
	echo "ERROR, there was a flashing error :-("
fi
