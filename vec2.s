	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_vector2_print                  ; -- Begin function vector2_print
	.p2align	2
_vector2_print:                         ; @vector2_print
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x21, #0
	add	x22, x0, #40
	mov	w25, #3
	mov	w26, #4
	mov	w27, #5
	mov	w28, #6
	mov	w19, #7
	mov	w23, #8
	mov	w24, #9
Lloh0:
	adrp	x20, l_.str.1@PAGE
Lloh1:
	add	x20, x20, l_.str.1@PAGEOFF
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	str	x21, [sp]
Lloh2:
	adrp	x0, l_.str@PAGE
Lloh3:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldur	d0, [x22, #-40]
	str	d0, [sp, #8]
	str	xzr, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-32]
	str	d0, [sp, #8]
	mov	w8, #1
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-24]
	str	d0, [sp, #8]
	mov	w8, #2
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-16]
	str	d0, [sp, #8]
	str	x25, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-8]
	str	d0, [sp, #8]
	str	x26, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22]
	str	d0, [sp, #8]
	str	x27, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #8]
	str	d0, [sp, #8]
	str	x28, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #16]
	str	d0, [sp, #8]
	str	x19, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #24]
	str	d0, [sp, #8]
	str	x23, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #32]
	str	d0, [sp, #8]
	str	x24, [sp]
	mov	x0, x20
	bl	_printf
	mov	w0, #10
	bl	_putchar
	add	x21, x21, #1
	add	x22, x22, #80
	cmp	x21, #10
	b.ne	LBB0_1
; %bb.2:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_rand_init              ; -- Begin function vector2_rand_init
	.p2align	2
_vector2_rand_init:                     ; @vector2_rand_init
	.cfi_startproc
; %bb.0:
	stp	d11, d10, [sp, #-80]!           ; 16-byte Folded Spill
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	.cfi_offset b10, -72
	.cfi_offset b11, -80
	fmov	d8, d1
	fmov	d9, d0
	mov	x19, x0
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	x20, #0
	mov	x8, #2097152
	movk	x8, #15872, lsl #48
	fmov	d0, x8
	fmul	d9, d9, d0
	fmul	d8, d8, d0
	add	x19, x19, #40
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	add	x21, x19, x20
	stur	d0, [x21, #-40]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	stur	d0, [x21, #-32]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	stur	d0, [x21, #-24]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	stur	d0, [x21, #-16]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	stur	d0, [x21, #-8]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #8]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #16]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #24]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #32]
	add	x20, x20, #80
	cmp	x20, #800
	b.ne	LBB1_1
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #80             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"[%d] => "

l_.str.1:                               ; @.str.1
	.asciz	"[%d] = %.4f, "

.subsections_via_symbols
