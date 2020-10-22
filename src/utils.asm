.export _radek
.export _print_f
.setcpu		"6502"
.smart		on
.autoimport	on
.case		on
.debuginfo	off
.importzp	sp, sreg, regsave, regbank
.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
.macpack	longbranch
.forceimport	__STARTUP__
.import		_acia_putc
.import		_acia_puts
.import		_acia_put_newline
.import		_acia_getc
.import		_GD_Init
.import		_GD_fill
.import		_GD_wr16
.import		_GD_putstr
.import		_GD_putchar
.import		_GD_copy

.segment	"DATA"
_radek:
	.word	$0000

; ---------------------------------------------------------------
; void __near__ print_f (const char *s)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_print_f: near

.segment	"CODE"

	jsr     pushax
	lda     #$00
	jsr     pusha
	lda     _radek
	jsr     pusha
	ldy     #$03
	jsr     ldaxysp
	jsr     _GD_putstr
	inc     _radek
	bne     L0002
	inc     _radek+1
L0002:	jsr     _acia_put_newline
	jsr     ldax0sp
	jsr     _acia_puts
	jmp     incsp2

.endproc
