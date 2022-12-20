	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_particle3_gravitational_force  ; -- Begin function particle3_gravitational_force
	.p2align	2
_particle3_gravitational_force:         ; @particle3_gravitational_force
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	mov	w9, #36
	fmov	d1, #1.00000000
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
	mov	x10, #0
	madd	x11, x8, x9, x0
	ldr	d4, [x11]
	ldr	s5, [x11, #8]
	movi	d3, #0000000000000000
	movi	d2, #0000000000000000
LBB0_2:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x11, x0, x10
	ldr	d6, [x11]
	ldr	s7, [x11, #8]
	fsub.2s	v6, v6, v4
	fsub	s7, s7, s5
	fmul.2s	v16, v6, v6
	fcvtl	v16.2d, v16.2s
	fmul	s17, s7, s7
	faddp.2d	d16, v16
	fcvt	d17, s17
	fadd	d16, d16, d17
	fsqrt	d16, d16
	fdiv	d16, d1, d16
	fmul	d17, d16, d16
	fmul	d16, d16, d0
	fmul	d16, d16, d17
	fcvtl	v6.2d, v6.2s
	fmul.2d	v6, v6, v16[0]
	fcvt	d7, s7
	fmul	d7, d16, d7
	fcvtl	v3.2d, v3.2s
	fadd.2d	v3, v6, v3
	fcvtn	v3.2s, v3.2d
	fcvt	d2, s2
	fadd	d2, d7, d2
	fcvt	s2, d2
	add	x10, x10, #36
	cmp	x10, #36, lsl #12               ; =147456
	b.ne	LBB0_2
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	madd	x10, x8, x9, x0
	ldr	d4, [x10, #24]
	fadd.2s	v3, v4, v3
	str	d3, [x10, #24]
	ldr	s3, [x10, #32]
	fadd	s2, s3, s2
	str	s2, [x10, #32]
	add	x8, x8, #1
	cmp	x8, #1, lsl #12                 ; =4096
	b.ne	LBB0_1
; %bb.4:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_rand_init            ; -- Begin function particle3_rand_init
	.p2align	2
_particle3_rand_init:                   ; @particle3_rand_init
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-112]!          ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	.cfi_offset b10, -72
	.cfi_offset b11, -80
	.cfi_offset b12, -88
	.cfi_offset b13, -96
	.cfi_offset b14, -104
	.cfi_offset b15, -112
	mov	x19, x0
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	x20, #0
	add	x19, x19, #16
	mov	x21, #13107
	movk	x21, #40995, lsl #16
	movk	x21, #39321, lsl #32
	movk	x21, #15873, lsl #48
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d8, w0
	bl	_rand
	scvtf	d9, w0
	bl	_rand
	scvtf	d10, w0
	bl	_rand
	scvtf	d11, w0
	bl	_rand
	scvtf	d12, w0
	bl	_rand
	scvtf	d13, w0
	bl	_rand
	scvtf	d14, w0
	bl	_rand
	scvtf	d15, w0
	bl	_rand
	scvtf	d0, w0
	fmov	d1, x21
	fmul	d2, d8, d1
	fcvt	s2, d2
	add	x8, x19, x20
	fmul	d3, d9, d1
	fcvt	s3, d3
	stp	s2, s3, [x8, #-16]
	fmul	d2, d10, d1
	fcvt	s2, d2
	fmul	d3, d11, d1
	fcvt	s3, d3
	stp	s2, s3, [x8, #-8]
	fmul	d2, d12, d1
	fcvt	s2, d2
	fmul	d3, d13, d1
	fcvt	s3, d3
	stp	s2, s3, [x8]
	fmul	d2, d14, d1
	fcvt	s2, d2
	fmul	d3, d15, d1
	fcvt	s3, d3
	stp	s2, s3, [x8, #8]
	fmul	d0, d0, d1
	fcvt	s0, d0
	str	s0, [x8, #16]
	add	x20, x20, #36
	cmp	x20, #36, lsl #12               ; =147456
	b.ne	LBB1_1
; %bb.2:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #112            ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_print                ; -- Begin function particle3_print
	.p2align	2
_particle3_print:                       ; @particle3_print
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #176
	stp	d15, d14, [sp, #16]             ; 16-byte Folded Spill
	stp	d13, d12, [sp, #32]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #48]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #64]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #80]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
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
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	mov	x19, #0
	add	x20, x0, #16
Lloh0:
	adrp	x21, l_.str.2@PAGE
Lloh1:
	add	x21, x21, l_.str.2@PAGEOFF
Lloh2:
	adrp	x22, l_.str.3@PAGE
Lloh3:
	add	x22, x22, l_.str.3@PAGEOFF
Lloh4:
	adrp	x23, l_.str.4@PAGE
Lloh5:
	add	x23, x23, l_.str.4@PAGEOFF
Lloh6:
	adrp	x24, l_.str.5@PAGE
Lloh7:
	add	x24, x24, l_.str.5@PAGEOFF
Lloh8:
	adrp	x25, l_.str.6@PAGE
Lloh9:
	add	x25, x25, l_.str.6@PAGEOFF
Lloh10:
	adrp	x26, l_.str.7@PAGE
Lloh11:
	add	x26, x26, l_.str.7@PAGEOFF
Lloh12:
	adrp	x27, l_.str.8@PAGE
Lloh13:
	add	x27, x27, l_.str.8@PAGEOFF
Lloh14:
	adrp	x28, l_.str.9@PAGE
Lloh15:
	add	x28, x28, l_.str.9@PAGEOFF
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	s8, s9, [x20, #-16]
	ldp	s10, s11, [x20, #-8]
	ldp	s12, s13, [x20]
	ldp	s14, s15, [x20, #8]
	ldr	s0, [x20, #16]
	str	s0, [sp, #12]                   ; 4-byte Folded Spill
	str	x19, [sp]
Lloh16:
	adrp	x0, l_.str@PAGE
Lloh17:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	fcvt	d0, s8
	str	d0, [sp]
Lloh18:
	adrp	x0, l_.str.1@PAGE
Lloh19:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	fcvt	d0, s9
	str	d0, [sp]
	mov	x0, x21
	bl	_printf
	fcvt	d0, s10
	str	d0, [sp]
	mov	x0, x22
	bl	_printf
	fcvt	d0, s11
	str	d0, [sp]
	mov	x0, x23
	bl	_printf
	fcvt	d0, s12
	str	d0, [sp]
	mov	x0, x24
	bl	_printf
	fcvt	d0, s13
	str	d0, [sp]
	mov	x0, x25
	bl	_printf
	fcvt	d0, s14
	str	d0, [sp]
	mov	x0, x26
	bl	_printf
	fcvt	d0, s15
	str	d0, [sp]
	mov	x0, x27
	bl	_printf
	ldr	s0, [sp, #12]                   ; 4-byte Folded Reload
	fcvt	d0, s0
	str	d0, [sp]
	mov	x0, x28
	bl	_printf
	add	x19, x19, #1
	add	x20, x20, #36
	cmp	x19, #1, lsl #12                ; =4096
	b.ne	LBB2_1
; %bb.2:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #64]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #48]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #32]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"particle %d: "

l_.str.1:                               ; @.str.1
	.asciz	"pos.x = %.4f, "

l_.str.2:                               ; @.str.2
	.asciz	"pos.y = %.4f, "

l_.str.3:                               ; @.str.3
	.asciz	"pos.z = %.4f, "

l_.str.4:                               ; @.str.4
	.asciz	"vel.x = %.4f, "

l_.str.5:                               ; @.str.5
	.asciz	"vel.y = %.4f, "

l_.str.6:                               ; @.str.6
	.asciz	"vel.z = %.4f, "

l_.str.7:                               ; @.str.7
	.asciz	"acc.x = %.4f, "

l_.str.8:                               ; @.str.8
	.asciz	"acc.y = %.4f, "

l_.str.9:                               ; @.str.9
	.asciz	"acc.z = %.4f\n"

.subsections_via_symbols
