About
=====

JTAG Versaloon firmware for the STM32 Bluepill board.

Build
=====

Just a matter of `make -j` in the root folder if you have an ARM GCC toolchain installed on your computer. If you have docker, you can just run ```./build.sh```, it will build the firmware for you.

The produced binaries are the following :

```
Versaloon-STM32F103C8_BluePill.hex
Versaloon-STM32F103C8_BluePill.bin
Versaloon-STM32F103C8_BluePill.elf
```

Flashing
========

```
st-flash write Versaloon-STM32F103C8_BluePill.bin 0x8000000
```

lsusb
=====

```
ID 0483:a038 STMicroelectronics
```

/!\ This is not a Versaloon reserved VID/PID, disconnect any STM32 dev board from your computer before trying to use OpenOCD /!\

Pin map
=======

BluePill pin mapping is the same as MiniRelease1.h

```
TDI => GPIO B15
TDO => GPIO B14
TCK => GPIO B13
TMS => GPIO B4
```


OpenOCD config file
===================

Create somewhere a file called my_vsllink.cfg with this content :

```
interface vsllink
adapter_khz 100
transport select jtag
```

Then you can launch OpenOCD with `openocd -f my_vsllink.cfg` :

```
Open On-Chip Debugger 0.10.0
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
adapter speed: 100 kHz
jtag
Info : Versaloon(0x15)by Simon(compiled on Dec 20 2018)
Info : USB_TO_XXX abilities: 0x0000176E:0x010001EF:0xC0000007
Info : clock speed 100 kHz
Warn : There are no enabled taps.  AUTO PROBING MIGHT NOT WORK!!
Info : JTAG tap: auto0.tap tap/device found: 0x44002093 (mfg: 0x049 (Xilinx), part: 0x4002, ver: 0x4)
Warn : AUTO auto0.tap - use "jtag newtap auto0 tap -irlen 2 -expected-id 0x44002093"
Error: IR capture error at bit 2, saw 0x3FFFFFFFFFFFFFF5 not 0x...3
Warn : Bypassing JTAG setup events due to errors
Warn : gdb services need one or more targets defined
```

If you get the `Error: Can't find USB JTAG Interface!Please check connection and permissions.` error message, you may try to run OpenOCD as sudo.

Todo
====

* Does not build under ubuntu 16.04: https://github.com/zoobab/versaloon/commit/83dfb9bb8b72a99d491f8e34930afa46ff94adde
* Try it out on a discovery board: http://takenapart.com/?p=82
* Try it out on a maple board
* Try it out on a blackpill board
* Add some wiring/fritzing documention with some MIPS targets

Links
=====

* Similar firmware: https://github.com/x893/CMSIS-DAP
* Alan Acassis, Getting STLink with Versalon firmware working with OpenOCD: https://acassis.wordpress.com/2012/02/21/getting-stlink-with-versalon-firmware-working-with-openocd/
