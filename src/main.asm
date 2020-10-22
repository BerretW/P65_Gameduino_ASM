				.setcpu "65C02"
				.include "io.inc65"
				.import _GD_Init
				.import _GD_ascii
				.import _GD_putstr
				.import _GD_putchar

				.autoimport	on
				.case		on
				.debuginfo	off
				.importzp	sp, sreg, regsave, regbank
				.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
				.macpack	longbranch


				.import _lcd_init
				.import _lcd_putc
				.import _lcd_puts
				.import _acia_init
				.import _acia_putc
				.import _acia_getc
				.import _acia_puts
				.import _lcd_w_reg
				.import _acia_put_newline
				.import _print_help
				.import _write_to_ram
				.import _read_ram
				.import _bootloader_

				.export _main
				.export _delay


                .segment "CODE"


reset:          JMP _main

nmi:            LDA #34
								JSR _acia_putc
								JMP (RAMDISK_NMI_VECTOR)
								RTI

irq:            SEI
								LDA #33
								JSR _acia_putc
								JMP (RAMDISK_IRQ_VECTOR)
								RTI


_main:						CLI
								JSR _GD_Init
								JSR _acia_init
								JMP _bootloader_


_delay:					LDX #$FF
_delay1:				DEX
								BNE _delay1
								RTS
