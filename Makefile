# options and settings
PROJECT	= Versaloon

HW_BOARD = STM32F103C8_BluePill
include	board_defs.mk

# directory define
PRJDIR	    = .
SRCDIR      = firmware
VSFDIR      = vsf
VSPROGDIR	= src
VSFCFGDIR   = firmware/Projects/Versaloon/vsf_cfg
OBJ_DIR     = release
APP_IFACES_DIR = $(SRCDIR)/Interfaces/APP
STM32_IFACES_DIR = $(VSFDIR)/interfaces/cpu/stm32
STM32_LIB_DIR = $(STM32_IFACES_DIR)/hw/STM32F10x_Lib

USR_INCS+= -I $(SRCDIR)/Projects/Versaloon -I $(SRCDIR)/Projects

USR_SRCS+= $(SRCDIR)/main.c $(SRCDIR)/usb_protocol_Versaloon.c $(SRCDIR)/versaloon_usb/vsfusbd_Versaloon.c
USR_INCS+= -I $(SRCDIR)/versaloon_usb
USR_INCS+= -I $(STM32_IFACES_DIR)/hw
USR_INCS+= -I $(VSFDIR)/compiler/ARMGCC

#APP interfaces
USR_SRCS+= $(SRCDIR)/Interfaces/app_interfaces.c
USR_INCS+= -I $(SRCDIR)/Interfaces

USR_SRCS+= $(APP_IFACES_DIR)/GPIO/GPIO.c \
  $(APP_IFACES_DIR)/CLKO/CLKO.c \
  $(APP_IFACES_DIR)/USART/USART.c \
  $(APP_IFACES_DIR)/SPI/SPI.c \
  $(APP_IFACES_DIR)/SDIO/SDIO.c \
  $(APP_IFACES_DIR)/JTAG/JTAG_TAP.c \
  $(APP_IFACES_DIR)/SWD/SWD.c \
  $(APP_IFACES_DIR)/SWIM/SWIM.c \
  $(APP_IFACES_DIR)/DUSI/DUSI.c \
  $(APP_IFACES_DIR)/MicroWire/MicroWire.c \
  $(APP_IFACES_DIR)/PowerExt/PowerExt.c \
  $(APP_IFACES_DIR)/IIC/IIC.c \
  $(APP_IFACES_DIR)/C2/C2.c \
  $(APP_IFACES_DIR)/ISSP/ISSP.c \
  $(APP_IFACES_DIR)/LPC_ICP/LPC_ICP.c \
  $(APP_IFACES_DIR)/MSP430_JTAG/MSP430_JTAG.c \
  $(APP_IFACES_DIR)/BDM/BDM.c \
  $(APP_IFACES_DIR)/PWM/PWM.c \
  $(APP_IFACES_DIR)/EBI/EBI.c \
  $(APP_IFACES_DIR)/ADC/ADC.c
USR_INCS+= -I $(APP_IFACES_DIR) \
  -I $(APP_IFACES_DIR)/GPIO \
  -I $(APP_IFACES_DIR)/USART \
  -I $(APP_IFACES_DIR)/SPI \
  -I $(APP_IFACES_DIR)/JTAG \
  -I $(APP_IFACES_DIR)/SWD \
  -I $(APP_IFACES_DIR)/SWIM \
  -I $(APP_IFACES_DIR)/DUSI \
  -I $(APP_IFACES_DIR)/MicroWire \
  -I $(APP_IFACES_DIR)/PowerExt \
  -I $(APP_IFACES_DIR)/IIC \
  -I $(APP_IFACES_DIR)/C2 \
  -I $(APP_IFACES_DIR)/ISSP \
  -I $(APP_IFACES_DIR)/LPC_ICP \
  -I $(APP_IFACES_DIR)/MSP430_JTAG \
  -I $(APP_IFACES_DIR)/BDM \
  -I $(APP_IFACES_DIR)/PWM \
  -I $(APP_IFACES_DIR)/EBI \
  -I $(APP_IFACES_DIR)/ADC

#VSF config
USR_INCS+= -I $(VSFCFGDIR)

#VSF interfaces
USR_SRCS+= $(VSFDIR)/interfaces/interfaces.c
USR_INCS+= -I $(VSFDIR) -I $(VSFDIR)/interfaces

USR_SRCS+= $(STM32_IFACES_DIR)/core.c \
  $(STM32_IFACES_DIR)/clko/STM32_CLKO.c \
  $(STM32_IFACES_DIR)/gpio/STM32_GPIO.c \
  $(STM32_IFACES_DIR)/usbd/STM32_USBD.c \
  $(STM32_IFACES_DIR)/spi/STM32_SPI.c \
  $(STM32_IFACES_DIR)/timer/STM32_TIM.c \
  $(STM32_IFACES_DIR)/eint/STM32_EINT.c \
  $(STM32_IFACES_DIR)/adc/STM32_ADC.c \
  $(STM32_IFACES_DIR)/usart/STM32_USART.c \
  $(STM32_IFACES_DIR)/ebi/STM32_EBI.c \
  $(STM32_IFACES_DIR)/flash/STM32_FLASH.c \
  $(STM32_IFACES_DIR)/sdio/STM32_SDIO.c
USR_INCS+= -I $(STM32_IFACES_DIR) \
  -I $(STM32_IFACES_DIR)/gpio \
  -I $(STM32_IFACES_DIR)/usbd \
  -I $(STM32_IFACES_DIR)/spi \
  -I $(STM32_IFACES_DIR)/timer \
  -I $(STM32_IFACES_DIR)/eint \
  -I $(STM32_IFACES_DIR)/adc \
  -I $(STM32_IFACES_DIR)/usart \
  -I $(STM32_IFACES_DIR)/ebi \
  -I $(STM32_IFACES_DIR)/flash \
  -I $(STM32_IFACES_DIR)/sdio

USR_SRCS+= $(VSFDIR)/dal/usart_stream/usart_stream.c $(VSFDIR)/dal/stream/stream.c
USR_SRCS+= $(VSFDIR)/dal/mal/mal.c

#VSF stack
USR_SRCS+= $(VSFDIR)/stack/usb_device/vsf_usbd.c \
  $(VSFDIR)/stack/usb_device/class/CDC/vsfusbd_CDC.c \
  $(VSFDIR)/stack/usb_device/class/CDC/vsfusbd_CDCACM.c \
  $(VSFDIR)/stack/usb_device/class/HID/vsfusbd_HID.c \
  $(VSFDIR)/stack/usb_device/class/MSC/vsfusbd_MSC_BOT.c \
  $(VSFDIR)/stack/usb_device/class/MSC/SCSI.c

#VSF tool
USR_SRCS+= $(VSFDIR)/tool/buffer/buffer.c $(VSFDIR)/tool/fakefat32/fakefat32.c
USR_SRCS+= $(VSFDIR)/tool/crc/crc.c
USR_INCS+= -I$(VSFDIR)/tool/list

# USB_TO_XXX
USR_SRCS+= $(SRCDIR)/USB_TO_XXX/USB_TO_XXX.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_CLKO.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_USART.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_SPI.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_IIC.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_GPIO.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_PWM.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_ADC.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_DAC.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_POWER.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_C2.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_ISSP.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_LPCICP.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_MSP430_JTAG.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_JTAG_HL.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_SWD.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_JTAG_LL.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_SWIM.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_JTAG_RAW.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_BDM.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_DUSI.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_MICROWIRE.c \
  $(SRCDIR)/USB_TO_XXX/USB_TO_EBI.c \
  $(SRCDIR)/USB_TO_XXX/CommandProcessor.c

# LIBSTM32_LIB
LIBSTM32_ASM_SRCS = $(STM32_LIB_DIR)/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/startup/gcc_ride7/startup_stm32f10x_xl.s
LIBSTM32_DEFS = -DUSE_STDPERIPH_DRIVER -DSTM32F10X_XL

LIBSTM32_SRCS = $(STM32_LIB_DIR)/Libraries/CMSIS/CM3/CoreSupport/core_cm3.c \
  $(STM32_LIB_DIR)/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/system_stm32f10x.c \
  $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/src/misc.c \
  $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_dma.c \
  $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_gpio.c \
  $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_rcc.c \
  $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_spi.c \
  $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_tim.c \
  $(STM32_LIB_DIR)/Libraries/STM32_USB-FS-Device_Driver/src/usb_mem.c \
  $(STM32_LIB_DIR)/Libraries/STM32_USB-FS-Device_Driver/src/usb_regs.c
LIBSTM32_INCS = \
  -I$(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/inc \
  -I$(STM32_LIB_DIR)/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x \
  -I$(STM32_LIB_DIR)/Libraries/CMSIS/CM3/CoreSupport \
  -I$(STM32_LIB_DIR)/Libraries/STM32_USB-FS-Device_Driver/inc

LIBSTM32_OBJS = $(LIBSTM32_SRCS:.c=.o)
USR_OBJS = $(USR_SRCS:.c=.o)
ASM_SRCS = $(LIBSTM32_ASM_SRCS)
ASM_OBJS = $(LIBSTM32_ASM_SRCS:.s=.o)

TCHAIN = arm-none-eabi

INCLUDE_DIRS = -I$(SRCDIR) $(LIBSTM32_INCS) $(USR_INCS)
COMPILE_OPTS = -mcpu=cortex-m3 -mthumb -mfpu=vfp
COMPILE_OPTS += -nostartfiles -fno-common -fomit-frame-pointer -Wall -g -Os

CC = $(TCHAIN)-gcc
CFLAGS = $(COMPILE_OPTS) $(INCLUDE_DIRS) $(LIBSTM32_DEFS) $(USR_DEFS)

AS = $(TCHAIN)-gcc
ASFLAGS = $(COMPILE_OPTS)

LD = $(TCHAIN)-gcc
LDFLAGS = -Lld -Wl,--gc-sections,-u,Reset_Handler -T$(LD_FILE)

OBJCOPY = $(TCHAIN)-objcopy

AR = $(TCHAIN)-ar
ARFLAGS = cr

MAIN_OUT = $(PROJECT)-$(HW_BOARD)
MAIN_OUT_ELF = $(MAIN_OUT).elf
MAIN_OUT_BIN = $(MAIN_OUT).bin
MAIN_OUT_HEX = $(MAIN_OUT).hex

all: $(MAIN_OUT_ELF) $(MAIN_OUT_HEX) $(MAIN_OUT_BIN) size

$(MAIN_OUT_ELF): $(ASM_OBJS) $(USR_OBJS) $(LIBSTM32_OBJS)
	$(LD) $(ASM_OBJS) $(LIBSTM32_OBJS) $(USR_OBJS) $(LDFLAGS) -o $@

$(MAIN_OUT_BIN): $(MAIN_OUT_ELF)
	$(OBJCOPY) -O binary $< $@

$(MAIN_OUT_HEX): $(MAIN_OUT_ELF)
	$(OBJCOPY) -O ihex $< $@

size: $(MAIN_OUT_ELF)
	size $(MAIN_OUT_ELF)

%.o: %.s
	$(CC) $(ASFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(USR_OBJS) $(MAIN_OUT).map $(ASM_OBJS) $(LIBSTM32_OBJS) $(MAIN_OUT_ELF) $(MAIN_OUT_HEX) $(MAIN_OUT_BIN)
