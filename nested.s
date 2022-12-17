	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function _loop_cache_line_analysis
lCPI0_0:
	.quad	0x4059000000000000              ; double 100
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__loop_cache_line_analysis
	.p2align	2
__loop_cache_line_analysis:             ; @_loop_cache_line_analysis
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x9, [x29, #-8]
	mov	x8, #32
	subs	x8, x8, x9
                                        ; kill: def $w8 killed $w8 killed $x8
	stur	w8, [x29, #-12]
	ldur	w8, [x29, #-12]
	asr	w8, w8, #31
	stur	w8, [x29, #-16]
	ldur	w8, [x29, #-16]
	cbz	w8, LBB0_2
	b	LBB0_1
LBB0_1:
	mov	x8, #1
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	b	LBB0_3
LBB0_2:
	ldur	x9, [x29, #-8]
	mov	x8, #32
	udiv	x8, x8, x9
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	b	LBB0_3
LBB0_3:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
                                        ; kill: def $w8 killed $w8 killed $x8
	stur	w8, [x29, #-20]
	ldur	x8, [x29, #-8]
	ldur	w9, [x29, #-20]
                                        ; kill: def $x9 killed $w9
	mul	x8, x8, x9
                                        ; kill: def $w8 killed $w8 killed $x8
	stur	w8, [x29, #-24]
	ldur	w8, [x29, #-16]
	cbz	w8, LBB0_5
	b	LBB0_4
LBB0_4:
	ldur	x8, [x29, #-8]
	and	x8, x8, #0x1f
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB0_6
LBB0_5:
	ldur	w9, [x29, #-24]
	mov	w8, #32
	subs	w8, w8, w9
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB0_6
LBB0_6:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
                                        ; kill: def $w8 killed $w8 killed $x8
	stur	w8, [x29, #-28]
	ldur	s0, [x29, #-28]
	ucvtf	s0, s0
	ldur	d1, [x29, #-8]
	fmov	x8, d1
	ucvtf	s1, x8
	fdiv	s0, s0, s1
	fcvt	d0, s0
	adrp	x8, lCPI0_0@PAGE
	ldr	d1, [x8, lCPI0_0@PAGEOFF]
	fmul	d0, d0, d1
	fcvt	s0, d0
	str	s0, [sp, #32]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	_printf
	ldur	x8, [x29, #-8]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	x9, sp
	mov	x8, #32
	str	x8, [x9]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-20]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-24]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-28]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	ldr	s0, [sp, #32]
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	_printf
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__loop_rowise_optim             ; -- Begin function _loop_rowise_optim
	.p2align	2
__loop_rowise_optim:                    ; @_loop_rowise_optim
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI2_0:
	.quad	0x412e848000000000              ; double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	bl	_clock
	stur	x0, [x29, #-24]
	mov	x0, #8
	bl	__loop_cache_line_analysis
	bl	_clock
	str	x0, [sp, #32]
	ldr	x8, [sp, #32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	ucvtf	d0, x8
	adrp	x8, lCPI2_0@PAGE
	ldr	d1, [x8, lCPI2_0@PAGEOFF]
	fdiv	d0, d0, d1
	str	d0, [sp, #24]
	ldr	d0, [sp, #24]
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"=================================\n"

l_.str.1:                               ; @.str.1
	.asciz	"ncols\t\t\t= %zu\n"

l_.str.2:                               ; @.str.2
	.asciz	"elem x cache line\t= %d\n"

l_.str.3:                               ; @.str.3
	.asciz	"Max rows x cache line\t= %u\n"

l_.str.4:                               ; @.str.4
	.asciz	"Max items x cache line\t= %u\n"

l_.str.5:                               ; @.str.5
	.asciz	"Empty spots x row\t= %u\n"

l_.str.6:                               ; @.str.6
	.asciz	"Percentage waste x row\t= %.4f\n"

l_.str.7:                               ; @.str.7
	.asciz	"Elapsed = %.20lf\n"

	.comm	_ia,400000000,2                 ; @ia
.subsections_via_symbols
