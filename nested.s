	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	__loop_cache_line_analysis      ; -- Begin function _loop_cache_line_analysis
	.p2align	2
__loop_cache_line_analysis:             ; @_loop_cache_line_analysis
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	mov	x19, x0
	mov	w21, #32
	udiv	x8, x21, x0
	lsr	x9, x0, #5
	and	w10, w19, #0x1f
	msub	w11, w8, w19, w21
	sub	w12, w19, #33
	cmp	w12, #0
	csel	w22, w10, w11, ge
	csel	x23, x9, x8, ge
	ucvtf	s0, w22
	ucvtf	s1, x0
	fdiv	s0, s0, s1
	mov	w8, #1120403456
	fmov	s1, w8
	fmul	s8, s0, s1
Lloh0:
	adrp	x20, l_str.7@PAGE
Lloh1:
	add	x20, x20, l_str.7@PAGEOFF
	mov	x0, x20
	bl	_puts
	str	x19, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	str	x21, [sp]
Lloh4:
	adrp	x0, l_.str.2@PAGE
Lloh5:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	str	x23, [sp]
Lloh6:
	adrp	x0, l_.str.3@PAGE
Lloh7:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	str	x22, [sp]
Lloh8:
	adrp	x0, l_.str.4@PAGE
Lloh9:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	fcvt	d0, s8
	str	d0, [sp]
Lloh10:
	adrp	x0, l_.str.5@PAGE
Lloh11:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	mov	x0, x20
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	add	sp, sp, #96
	b	_puts
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	__loop_rowise_optim             ; -- Begin function _loop_rowise_optim
	.p2align	2
__loop_rowise_optim:                    ; @_loop_rowise_optim
	.cfi_startproc
; %bb.0:
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
Lloh12:
	adrp	x20, l_str.7@PAGE
Lloh13:
	add	x20, x20, l_str.7@PAGEOFF
	mov	x0, x20
	bl	_puts
	mov	w8, #10000
	str	x8, [sp]
Lloh14:
	adrp	x0, l_.str.1@PAGE
Lloh15:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	w8, #32
	str	x8, [sp]
Lloh16:
	adrp	x0, l_.str.2@PAGE
Lloh17:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #312
	str	x8, [sp]
Lloh18:
	adrp	x0, l_.str.3@PAGE
Lloh19:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	mov	w8, #16
	str	x8, [sp]
Lloh20:
	adrp	x0, l_.str.4@PAGE
Lloh21:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	mov	x8, #1073741824
	movk	x8, #31457, lsl #32
	movk	x8, #16324, lsl #48
	str	x8, [sp]
Lloh22:
	adrp	x0, l_.str.5@PAGE
Lloh23:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	mov	x0, x20
	bl	_puts
	bl	_clock
	sub	x8, x0, x19
	ucvtf	d0, x8
	mov	x8, #145685290680320
	movk	x8, #16686, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	str	d0, [sp]
Lloh24:
	adrp	x0, l_.str.6@PAGE
Lloh25:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"ncols\t\t\t= %zu\n"

l_.str.2:                               ; @.str.2
	.asciz	"elem x cache line\t= %d\n"

l_.str.3:                               ; @.str.3
	.asciz	"Max rows x cache line\t= %u\n"

l_.str.4:                               ; @.str.4
	.asciz	"Empty spots x row\t= %u\n"

l_.str.5:                               ; @.str.5
	.asciz	"Percentage waste x row\t= %.4f\n"

l_.str.6:                               ; @.str.6
	.asciz	"Elapsed = %.20lf\n"

	.comm	_ia,400000000,2                 ; @ia
l_str.7:                                ; @str.7
	.asciz	"================================="

.subsections_via_symbols
