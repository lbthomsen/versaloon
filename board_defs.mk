########################################################################
ifeq ($(HW_BOARD),STM32F103C8_BluePill)
########################################################################
_HARDWARE_VER		= 0x15
FLASH_LOAD_OFFSET	= 0x0
HSE_VALUE		= 8000000
LD_FILE			= ld/versaloonSTM32.ld
TARGET_CHIP		= stm32
TARGET_STM32	= XLDensity
USR_DEFS += -DCORE_DEBUG=STM32_DBG_NONE
endif

USR_DEFS += -DHSE_VALUE=$(HSE_VALUE)UL -DHW_BOARD=$(HW_BOARDà) -D_HARDWARE_VER=$(_HARDWARE_VER)
USR_DEFS += -DFLASH_LOAD_OFFSET=$(FLASH_LOAD_OFFSET)
USR_DEFS += -D__TARGET_CHIP__=$(TARGET_CHIP)
