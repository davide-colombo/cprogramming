	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_for1_inc                       ; -- Begin function for1_inc
	.p2align	2
_for1_inc:                              ; @for1_inc
	.cfi_startproc
; %bb.0:
	mov	w0, #57600
	movk	w0, #1525, lsl #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_do1_inc                        ; -- Begin function do1_inc
	.p2align	2
_do1_inc:                               ; @do1_inc
	.cfi_startproc
; %bb.0:
	mov	w0, #57600
	movk	w0, #1525, lsl #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_inf_plus_if1_inc               ; -- Begin function inf_plus_if1_inc
	.p2align	2
_inf_plus_if1_inc:                      ; @inf_plus_if1_inc
	.cfi_startproc
; %bb.0:
	mov	w0, #57600
	movk	w0, #1525, lsl #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_clock
	mov	x19, x0
	bl	_clock
	sub	x8, x0, x19
	ucvtf	d0, x8
	mov	x8, #145685290680320
	movk	x8, #16686, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	str	d0, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Elapsed: %.20lf\n"

.subsections_via_symbols
