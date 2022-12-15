	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_for1_inc                       ; -- Begin function for1_inc
	.p2align	2
_for1_inc:                              ; @for1_inc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	xzr, [sp, #8]
	str	xzr, [sp]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	mov	x9, #57600
	movk	x9, #1525, lsl #16
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB0_1
LBB0_4:
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_do1_inc                        ; -- Begin function do1_inc
	.p2align	2
_do1_inc:                               ; @do1_inc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	xzr, [sp, #8]
	str	xzr, [sp]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp]
	mov	x9, #57600
	movk	x9, #1525, lsl #16
	subs	x8, x8, x9
	b.lo	LBB1_1
	b	LBB1_3
LBB1_3:
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_inf_plus_if1_inc               ; -- Begin function inf_plus_if1_inc
	.p2align	2
_inf_plus_if1_inc:                      ; @inf_plus_if1_inc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	xzr, [sp, #8]
	str	xzr, [sp]
	b	LBB2_1
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	ldr	x8, [sp]
	mov	x9, #57600
	movk	x9, #1525, lsl #16
	subs	x8, x8, x9
	b.ne	LBB2_3
	b	LBB2_2
LBB2_2:
	b	LBB2_4
LBB2_3:                                 ;   in Loop: Header=BB2_1 Depth=1
	b	LBB2_1
LBB2_4:
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_for2_inc                       ; -- Begin function for2_inc
	.p2align	2
_for2_inc:                              ; @for2_inc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	xzr, [sp, #40]
	str	xzr, [sp, #32]
	str	xzr, [sp, #24]
	str	xzr, [sp, #16]
	str	xzr, [sp, #8]
	b	LBB3_1
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	mov	x9, #57600
	movk	x9, #1525, lsl #16
	subs	x8, x8, x9
	b.hs	LBB3_4
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldr	x8, [sp, #40]
	add	x8, x8, #1
	str	x8, [sp, #40]
	ldr	x8, [sp, #32]
	add	x8, x8, #1
	str	x8, [sp, #32]
	ldr	x8, [sp, #24]
	add	x8, x8, #1
	str	x8, [sp, #24]
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	str	x8, [sp, #16]
	b	LBB3_3
LBB3_3:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #4
	str	x8, [sp, #8]
	b	LBB3_1
LBB3_4:
	ldr	x8, [sp, #40]
	ldr	x9, [sp, #32]
	add	x8, x8, x9
	ldr	x9, [sp, #24]
	ldr	x10, [sp, #16]
	add	x9, x9, x10
	add	x0, x8, x9
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_do2_inc                        ; -- Begin function do2_inc
	.p2align	2
_do2_inc:                               ; @do2_inc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	xzr, [sp, #40]
	str	xzr, [sp, #32]
	str	xzr, [sp, #24]
	str	xzr, [sp, #16]
	str	xzr, [sp, #8]
	b	LBB4_1
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]
	add	x8, x8, #1
	str	x8, [sp, #40]
	ldr	x8, [sp, #32]
	add	x8, x8, #1
	str	x8, [sp, #32]
	ldr	x8, [sp, #24]
	add	x8, x8, #1
	str	x8, [sp, #24]
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	str	x8, [sp, #16]
	ldr	x8, [sp, #8]
	add	x8, x8, #4
	str	x8, [sp, #8]
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	x8, [sp, #8]
	mov	x9, #57600
	movk	x9, #1525, lsl #16
	subs	x8, x8, x9
	b.lo	LBB4_1
	b	LBB4_3
LBB4_3:
	ldr	x8, [sp, #40]
	ldr	x9, [sp, #32]
	add	x8, x8, x9
	ldr	x9, [sp, #24]
	ldr	x10, [sp, #16]
	add	x9, x9, x10
	add	x0, x8, x9
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_inf_plus_if2_inc               ; -- Begin function inf_plus_if2_inc
	.p2align	2
_inf_plus_if2_inc:                      ; @inf_plus_if2_inc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	xzr, [sp, #40]
	str	xzr, [sp, #32]
	str	xzr, [sp, #24]
	str	xzr, [sp, #16]
	str	xzr, [sp, #8]
	b	LBB5_1
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]
	add	x8, x8, #1
	str	x8, [sp, #40]
	ldr	x8, [sp, #32]
	add	x8, x8, #1
	str	x8, [sp, #32]
	ldr	x8, [sp, #24]
	add	x8, x8, #1
	str	x8, [sp, #24]
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	str	x8, [sp, #16]
	ldr	x8, [sp, #8]
	add	x8, x8, #4
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	mov	x9, #57600
	movk	x9, #1525, lsl #16
	subs	x8, x8, x9
	b.ne	LBB5_3
	b	LBB5_2
LBB5_2:
	b	LBB5_4
LBB5_3:                                 ;   in Loop: Header=BB5_1 Depth=1
	b	LBB5_1
LBB5_4:
	ldr	x8, [sp, #40]
	ldr	x9, [sp, #32]
	add	x8, x8, x9
	ldr	x9, [sp, #24]
	ldr	x10, [sp, #16]
	add	x9, x9, x10
	add	x0, x8, x9
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI6_0:
	.quad	0x412e848000000000              ; double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	bl	_clock
	str	x0, [sp, #24]
	bl	_inf_plus_if1_inc
	bl	_clock
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #24]
	subs	x8, x8, x9
	ucvtf	d0, x8
	adrp	x8, lCPI6_0@PAGE
	ldr	d1, [x8, lCPI6_0@PAGEOFF]
	fdiv	d0, d0, d1
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #12]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Elapsed: %.20lf\n"

.subsections_via_symbols
