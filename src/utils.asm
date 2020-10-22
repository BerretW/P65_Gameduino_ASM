.export _radek
.export _print_f


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
