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
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function _loop_test1
lCPI1_0:
	.quad	2                               ; 0x2
	.quad	3                               ; 0x3
lCPI1_1:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__loop_test1
	.p2align	2
__loop_test1:                           ; @_loop_test1
	.cfi_startproc
; %bb.0:
	cbz	x1, LBB1_10
; %bb.1:
	mov	x8, #0
	and	x9, x2, #0xfffffffffffffff0
	add	x10, x0, #32
	fmov	d0, #3.00000000
Lloh12:
	adrp	x11, lCPI1_0@PAGE
Lloh13:
	ldr	q1, [x11, lCPI1_0@PAGEOFF]
Lloh14:
	adrp	x11, lCPI1_1@PAGE
Lloh15:
	ldr	q2, [x11, lCPI1_1@PAGEOFF]
	fmov.2d	v3, #3.00000000
	mov	w11, #16
	dup.2d	v4, x11
	b	LBB1_3
LBB1_2:                                 ;   in Loop: Header=BB1_3 Depth=1
	add	x8, x8, #1
	add	x10, x10, #8, lsl #12           ; =32768
	add	x0, x0, #8, lsl #12             ; =32768
	cmp	x8, x1
	b.eq	LBB1_10
LBB1_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_7 Depth 2
                                        ;     Child Loop BB1_9 Depth 2
	cbz	x2, LBB1_2
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	cmp	x2, #16
	b.hs	LBB1_6
; %bb.5:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x11, #0
	b	LBB1_9
LBB1_6:                                 ;   in Loop: Header=BB1_3 Depth=1
	dup.2d	v5, x8
	add	x11, x8, #4
	dup.2d	v6, x11
	add	x11, x8, #8
	dup.2d	v7, x11
	add	x11, x8, #12
	dup.2d	v16, x11
	mov	x11, x9
	mov	x12, x10
	mov.16b	v17, v2
	mov.16b	v18, v1
LBB1_7:                                 ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add.2d	v19, v18, v5
	add.2d	v20, v17, v5
	add.2d	v21, v6, v18
	add.2d	v22, v6, v17
	add.2d	v23, v7, v18
	add.2d	v24, v7, v17
	add.2d	v25, v16, v18
	add.2d	v26, v16, v17
	ucvtf.2d	v20, v20
	ucvtf.2d	v19, v19
	ucvtf.2d	v22, v22
	ucvtf.2d	v21, v21
	ucvtf.2d	v24, v24
	ucvtf.2d	v23, v23
	ucvtf.2d	v26, v26
	ucvtf.2d	v25, v25
	fdiv.2d	v19, v19, v3
	fdiv.2d	v20, v20, v3
	fdiv.2d	v21, v21, v3
	fdiv.2d	v22, v22, v3
	fdiv.2d	v23, v23, v3
	fdiv.2d	v24, v24, v3
	fdiv.2d	v25, v25, v3
	fdiv.2d	v26, v26, v3
	fcvtzs.2d	v20, v20
	xtn.2s	v20, v20
	fcvtzs.2d	v19, v19
	xtn2.4s	v20, v19
	fcvtzs.2d	v19, v22
	xtn.2s	v19, v19
	fcvtzs.2d	v21, v21
	xtn2.4s	v19, v21
	fcvtzs.2d	v21, v24
	xtn.2s	v21, v21
	fcvtzs.2d	v22, v23
	xtn2.4s	v21, v22
	fcvtzs.2d	v22, v26
	xtn.2s	v22, v22
	fcvtzs.2d	v23, v25
	stp	q20, q19, [x12, #-32]
	xtn2.4s	v22, v23
	stp	q21, q22, [x12], #64
	add.2d	v18, v18, v4
	add.2d	v17, v17, v4
	subs	x11, x11, #16
	b.ne	LBB1_7
; %bb.8:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x11, x9
	cmp	x9, x2
	b.eq	LBB1_2
LBB1_9:                                 ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x12, x8, x11
	ucvtf	d5, x12
	fdiv	d5, d5, d0
	fcvtzs	w12, d5
	str	w12, [x0, x11, lsl #2]
	add	x11, x11, #1
	cmp	x2, x11
	b.ne	LBB1_9
	b	LBB1_2
LBB1_10:
	ret
	.loh AdrpLdr	Lloh14, Lloh15
	.loh AdrpAdrp	Lloh12, Lloh14
	.loh AdrpLdr	Lloh12, Lloh13
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function _loop_test2
lCPI2_0:
	.quad	2                               ; 0x2
	.quad	3                               ; 0x3
lCPI2_1:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__loop_test2
	.p2align	2
__loop_test2:                           ; @_loop_test2
	.cfi_startproc
; %bb.0:
	cbz	x1, LBB2_9
; %bb.1:
	mov	x8, #0
	cmp	x2, #1
	csinc	x9, x2, xzr, hi
	and	x10, x9, #0xfffffffffffffff0
	add	x11, x0, #32
	fmov	d0, #3.00000000
Lloh16:
	adrp	x12, lCPI2_0@PAGE
Lloh17:
	ldr	q1, [x12, lCPI2_0@PAGEOFF]
Lloh18:
	adrp	x12, lCPI2_1@PAGE
Lloh19:
	ldr	q2, [x12, lCPI2_1@PAGEOFF]
	fmov.2d	v3, #3.00000000
	mov	w12, #16
	dup.2d	v4, x12
	b	LBB2_3
LBB2_2:                                 ;   in Loop: Header=BB2_3 Depth=1
	add	x8, x8, #1
	add	x11, x11, #8, lsl #12           ; =32768
	add	x0, x0, #8, lsl #12             ; =32768
	cmp	x8, x1
	b.eq	LBB2_9
LBB2_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_6 Depth 2
                                        ;     Child Loop BB2_8 Depth 2
	cmp	x9, #16
	b.hs	LBB2_5
; %bb.4:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	x12, #0
	b	LBB2_8
LBB2_5:                                 ;   in Loop: Header=BB2_3 Depth=1
	dup.2d	v5, x8
	add	x12, x8, #4
	dup.2d	v6, x12
	add	x12, x8, #8
	dup.2d	v7, x12
	add	x12, x8, #12
	dup.2d	v16, x12
	mov	x12, x10
	mov	x13, x11
	mov.16b	v17, v2
	mov.16b	v18, v1
LBB2_6:                                 ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add.2d	v19, v18, v5
	add.2d	v20, v17, v5
	add.2d	v21, v6, v18
	add.2d	v22, v6, v17
	add.2d	v23, v7, v18
	add.2d	v24, v7, v17
	add.2d	v25, v16, v18
	add.2d	v26, v16, v17
	ucvtf.2d	v20, v20
	ucvtf.2d	v19, v19
	ucvtf.2d	v22, v22
	ucvtf.2d	v21, v21
	ucvtf.2d	v24, v24
	ucvtf.2d	v23, v23
	ucvtf.2d	v26, v26
	ucvtf.2d	v25, v25
	fdiv.2d	v19, v19, v3
	fdiv.2d	v20, v20, v3
	fdiv.2d	v21, v21, v3
	fdiv.2d	v22, v22, v3
	fdiv.2d	v23, v23, v3
	fdiv.2d	v24, v24, v3
	fdiv.2d	v25, v25, v3
	fdiv.2d	v26, v26, v3
	fcvtzs.2d	v20, v20
	xtn.2s	v20, v20
	fcvtzs.2d	v19, v19
	xtn2.4s	v20, v19
	fcvtzs.2d	v19, v22
	xtn.2s	v19, v19
	fcvtzs.2d	v21, v21
	xtn2.4s	v19, v21
	fcvtzs.2d	v21, v24
	xtn.2s	v21, v21
	fcvtzs.2d	v22, v23
	xtn2.4s	v21, v22
	fcvtzs.2d	v22, v26
	xtn.2s	v22, v22
	fcvtzs.2d	v23, v25
	stp	q20, q19, [x13, #-32]
	xtn2.4s	v22, v23
	stp	q21, q22, [x13], #64
	add.2d	v18, v18, v4
	add.2d	v17, v17, v4
	subs	x12, x12, #16
	b.ne	LBB2_6
; %bb.7:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	x12, x10
	cmp	x9, x10
	b.eq	LBB2_2
LBB2_8:                                 ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x13, x8, x12
	ucvtf	d5, x13
	fdiv	d5, d5, d0
	fcvtzs	w13, d5
	str	w13, [x0, x12, lsl #2]
	add	x12, x12, #1
	cmp	x9, x12
	b.ne	LBB2_8
	b	LBB2_2
LBB2_9:
	ret
	.loh AdrpLdr	Lloh18, Lloh19
	.loh AdrpAdrp	Lloh16, Lloh18
	.loh AdrpLdr	Lloh16, Lloh17
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function main
lCPI3_0:
	.quad	2                               ; 0x2
	.quad	3                               ; 0x3
lCPI3_1:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
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
Lloh20:
	adrp	x19, l_str.7@PAGE
Lloh21:
	add	x19, x19, l_str.7@PAGEOFF
	mov	x0, x19
	bl	_puts
	mov	w8, #8192
	str	x8, [sp]
Lloh22:
	adrp	x0, l_.str.1@PAGE
Lloh23:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	w8, #32
	str	x8, [sp]
Lloh24:
	adrp	x0, l_.str.2@PAGE
Lloh25:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #256
	str	x8, [sp]
Lloh26:
	adrp	x0, l_.str.3@PAGE
Lloh27:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	str	xzr, [sp]
Lloh28:
	adrp	x0, l_.str.4@PAGE
Lloh29:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	str	xzr, [sp]
Lloh30:
	adrp	x0, l_.str.5@PAGE
Lloh31:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	mov	x0, x19
	bl	_puts
Lloh32:
	adrp	x8, _ia@GOTPAGE
Lloh33:
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	add	x20, x8, #32
	bl	_clock
	mov	x19, x0
	mov	x8, #0
Lloh34:
	adrp	x9, lCPI3_0@PAGE
Lloh35:
	ldr	q0, [x9, lCPI3_0@PAGEOFF]
Lloh36:
	adrp	x9, lCPI3_1@PAGE
Lloh37:
	ldr	q1, [x9, lCPI3_1@PAGEOFF]
	fmov.2d	v2, #3.00000000
	mov	w9, #16
	dup.2d	v3, x9
LBB3_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_2 Depth 2
	mov	x9, #0
	dup.2d	v4, x8
	add	x10, x8, #4
	dup.2d	v5, x10
	add	x10, x8, #8
	dup.2d	v6, x10
	add	x10, x8, #12
	dup.2d	v7, x10
	mov.16b	v16, v1
	mov.16b	v17, v0
LBB3_2:                                 ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add.2d	v18, v17, v4
	add.2d	v19, v16, v4
	add.2d	v20, v5, v17
	add.2d	v21, v5, v16
	add.2d	v22, v6, v17
	add.2d	v23, v6, v16
	add.2d	v24, v7, v17
	add.2d	v25, v7, v16
	ucvtf.2d	v19, v19
	ucvtf.2d	v18, v18
	ucvtf.2d	v21, v21
	ucvtf.2d	v20, v20
	ucvtf.2d	v23, v23
	ucvtf.2d	v22, v22
	ucvtf.2d	v25, v25
	ucvtf.2d	v24, v24
	fdiv.2d	v18, v18, v2
	fdiv.2d	v19, v19, v2
	fdiv.2d	v20, v20, v2
	fdiv.2d	v21, v21, v2
	fdiv.2d	v22, v22, v2
	fdiv.2d	v23, v23, v2
	fdiv.2d	v24, v24, v2
	fdiv.2d	v25, v25, v2
	fcvtzs.2d	v19, v19
	xtn.2s	v19, v19
	fcvtzs.2d	v18, v18
	xtn2.4s	v19, v18
	fcvtzs.2d	v18, v21
	xtn.2s	v18, v18
	fcvtzs.2d	v20, v20
	xtn2.4s	v18, v20
	fcvtzs.2d	v20, v23
	xtn.2s	v20, v20
	fcvtzs.2d	v21, v22
	xtn2.4s	v20, v21
	fcvtzs.2d	v21, v25
	xtn.2s	v21, v21
	fcvtzs.2d	v22, v24
	add	x10, x20, x9
	stp	q19, q18, [x10, #-32]
	xtn2.4s	v21, v22
	stp	q20, q21, [x10]
	add.2d	v17, v17, v3
	add	x9, x9, #64
	add.2d	v16, v16, v3
	cmp	x9, #8, lsl #12                 ; =32768
	b.ne	LBB3_2
; %bb.3:                                ;   in Loop: Header=BB3_1 Depth=1
	add	x8, x8, #1
	add	x20, x20, #8, lsl #12           ; =32768
	cmp	x8, #2, lsl #12                 ; =8192
	b.ne	LBB3_1
; %bb.4:
	bl	_clock
	sub	x8, x0, x19
	ucvtf	d0, x8
	mov	x8, #145685290680320
	movk	x8, #16686, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	str	d0, [sp]
Lloh38:
	adrp	x0, l_.str.6@PAGE
Lloh39:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpLdr	Lloh36, Lloh37
	.loh AdrpAdrp	Lloh34, Lloh36
	.loh AdrpLdr	Lloh34, Lloh35
	.loh AdrpLdrGot	Lloh32, Lloh33
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh38, Lloh39
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

	.comm	_ia,268435456,2                 ; @ia
l_.str.6:                               ; @.str.6
	.asciz	"Elapsed = %.20lf\n"

l_str.7:                                ; @str.7
	.asciz	"================================="

.subsections_via_symbols
