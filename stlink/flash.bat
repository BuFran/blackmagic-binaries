@echo BlackMagic Probe discovery automatic flasher
@echo "Author: Frantisek Burian <BuFran@seznam.cz>"

@echo **************************************************************************
@echo Resolder the jumpers from DEFAULT to RESERVED state,
@echo Connect SWD programmer to the jumper pinheader with name DISCOVERY
@echo Remove any supply-enabling jumper of the discovery
@echo .

@pause

@echo **************************************************************************
@echo * STEP 1/3 Erasing read-out protection ....
@echo .

@arm-none-eabi-gdb --batch -x black_magic_probe_clearoption.scr blackmagic_dfu.elf

@echo done.
@echo **************************************************************************
@echo * Please disconnect and connect power supply to the board and press enter.
@echo .

@pause

@echo **************************************************************************
@echo * STEP 2/3 Programming DFU bootloader ...
@echo .

@arm-none-eabi-gdb --batch -x black_magic_probe_program.scr blackmagic_dfu.elf

@echo done.

@echo **************************************************************************
@echo * STEP 3/3 Programming BlackMagic firmware ..."

@arm-none-eabi-gdb --batch -x black_magic_probe_program.scr blackmagic.elf 

@echo done.

@echo **************************************************************************
@echo Disconnect the programmer and push back the jumpers to DISCOVERY header
@echo Resolder jumpers back to DEFAULT from RESERVED state
@echo .

@pause