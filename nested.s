	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	__loop_rowise_optim             ; -- Begin function _loop_rowise_optim
	.p2align	2
__loop_rowise_optim:                    ; @_loop_rowise_optim
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	ldur	x8, [x29, #-16]
	subs	x8, x8, #32
	b.hs	LBB0_3
	b	LBB0_1
LBB0_1:
	ldur	x8, [x29, #-24]
	subs	x8, x8, #32
	b.hs	LBB0_3
	b	LBB0_2
LBB0_2:
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-24]
	mul	x8, x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-24]
	mul	x8, x8, x9
	lsr	x8, x8, #5
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-24]
	mul	x8, x8, x9
	and	x8, x8, #0x1f
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	b	LBB0_4
LBB0_3:
	ldur	x8, [x29, #-24]
	lsr	x8, x8, #5
	stur	x8, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-16]
	mul	x8, x8, x9
	str	x8, [sp, #40]
	ldur	x8, [x29, #-24]
	and	x8, x8, #0x1f
                                        ; kill: def $w8 killed $w8 killed $x8
	strb	w8, [sp, #39]
	ldrb	w8, [sp, #39]
                                        ; kill: def $x8 killed $w8
	ldur	x9, [x29, #-16]
	mul	x8, x8, x9
	str	x8, [sp, #24]
	ldr	x8, [sp, #24]
	lsr	x8, x8, #5
	str	x8, [sp, #16]
	ldr	x8, [sp, #24]
	and	x8, x8, #0x1f
                                        ; kill: def $w8 killed $w8 killed $x8
	strb	w8, [sp, #15]
	ldur	x8, [x29, #-32]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldrb	w10, [sp, #39]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #40]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #16]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	ldrb	w10, [sp, #15]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	b	LBB0_4
LBB0_4:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI1_0:
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
	mov	x0, #0
	mov	x1, #10000
	mov	x2, #17
	bl	__loop_rowise_optim
	bl	_clock
	str	x0, [sp, #32]
	ldr	x8, [sp, #32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	ucvtf	d0, x8
	adrp	x8, lCPI1_0@PAGE
	ldr	d1, [x8, lCPI1_0@PAGEOFF]
	fdiv	d0, d0, d1
	str	d0, [sp, #24]
	ldr	d0, [sp, #24]
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Undersized matrix\n"

l_.str.1:                               ; @.str.1
	.asciz	"Total items = %lu\n"

l_.str.2:                               ; @.str.2
	.asciz	"Total cache lines = %lu\n"

l_.str.3:                               ; @.str.3
	.asciz	"Extra items = %lu\n"

l_.str.4:                               ; @.str.4
	.asciz	"Full cache lines x Row = %zu\n"

l_.str.5:                               ; @.str.5
	.asciz	"Extra items x Row = %d\n"

l_.str.6:                               ; @.str.6
	.asciz	"Total cache lines = %zu\n"

l_.str.7:                               ; @.str.7
	.asciz	"Extra full cache lines = %zu\n"

l_.str.8:                               ; @.str.8
	.asciz	"Tot extra items = %d\n"

l_.str.9:                               ; @.str.9
	.asciz	"Elapsed = %.20lf\n"

	.comm	_ia,400000000,2                 ; @ia
.subsections_via_symbols
