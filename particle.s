	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_particle3_print_float3_info    ; -- Begin function particle3_print_float3_info
	.p2align	2
_particle3_print_float3_info:           ; @particle3_print_float3_info
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #12
	str	x8, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w8, #4
	str	x8, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_print_particle3_info ; -- Begin function particle3_print_particle3_info
	.p2align	2
_particle3_print_particle3_info:        ; @particle3_print_particle3_info
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #36
	str	x8, [sp]
Lloh4:
	adrp	x0, l_.str.2@PAGE
Lloh5:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #4
	str	x8, [sp]
Lloh6:
	adrp	x0, l_.str.3@PAGE
Lloh7:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_gravitational_force  ; -- Begin function particle3_gravitational_force
	.p2align	2
_particle3_gravitational_force:         ; @particle3_gravitational_force
	.cfi_startproc
; %bb.0:
                                        ; kill: def $s0 killed $s0 def $q0
	mov	x8, #0
	dup.4s	v1, v0[0]
	add	x9, x0, #144
	mov	w10, #36
	fmov.4s	v2, #1.00000000
LBB2_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_2 Depth 2
	mov	x11, #0
	madd	x12, x8, x10, x0
	add	x13, x12, #8
	ld1r.4s	{ v4 }, [x12], #4
	ld1r.4s	{ v5 }, [x12]
	ld1r.4s	{ v6 }, [x13]
	movi	d3, #0000000000000000
	movi	d7, #0000000000000000
	movi	d16, #0000000000000000
LBB2_2:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x12, x9, x11
	sub	x13, x12, #108
	sub	x14, x12, #72
	sub	x15, x12, #36
	add	x16, x12, #36
	add	x17, x12, #72
	add	x1, x12, #108
	ldp	s17, s18, [x12, #-144]
	ld1.s	{ v17 }[1], [x13]
	sub	x13, x12, #104
	sub	x2, x12, #68
	ldp	s19, s20, [x12]
	ld1.s	{ v19 }[1], [x16]
	sub	x16, x12, #32
	ld1.s	{ v18 }[1], [x13]
	add	x13, x12, #40
	ld1.s	{ v17 }[2], [x14]
	add	x14, x12, #76
	ld1.s	{ v18 }[2], [x2]
	add	x2, x12, #112
	ld1.s	{ v17 }[3], [x15]
	ld1.s	{ v20 }[1], [x13]
	sub	x13, x12, #100
	sub	x15, x12, #64
	ld1.s	{ v18 }[3], [x16]
	ldur	s21, [x12, #-136]
	ld1.s	{ v21 }[1], [x13]
	sub	x13, x12, #28
	ld1.s	{ v19 }[2], [x17]
	add	x16, x12, #44
	ld1.s	{ v21 }[2], [x15]
	add	x15, x12, #80
	ld1.s	{ v20 }[2], [x14]
	add	x14, x12, #116
	ld1.s	{ v21 }[3], [x13]
	ldr	s22, [x12, #8]
	ld1.s	{ v19 }[3], [x1]
	ld1.s	{ v22 }[1], [x16]
	ld1.s	{ v22 }[2], [x15]
	ld1.s	{ v20 }[3], [x2]
	ld1.s	{ v22 }[3], [x14]
	fsub.4s	v17, v17, v4
	fsub.4s	v19, v19, v4
	fsub.4s	v18, v18, v5
	fsub.4s	v20, v20, v5
	fsub.4s	v21, v21, v6
	fsub.4s	v22, v22, v6
	fmul.4s	v23, v17, v17
	fmul.4s	v24, v18, v18
	fadd.4s	v23, v23, v24
	fmul.4s	v24, v19, v19
	fmul.4s	v25, v20, v20
	fadd.4s	v24, v24, v25
	fmul.4s	v25, v21, v21
	fadd.4s	v23, v23, v25
	fmul.4s	v25, v22, v22
	fadd.4s	v24, v24, v25
	fsqrt.4s	v23, v23
	fsqrt.4s	v24, v24
	fdiv.4s	v23, v2, v23
	fmul.4s	v25, v23, v23
	fmul.4s	v23, v23, v1
	fdiv.4s	v24, v2, v24
	fmul.4s	v23, v23, v25
	fmul.4s	v25, v24, v24
	fmul.4s	v24, v24, v0[0]
	fmul.4s	v24, v24, v25
	fmul.4s	v17, v17, v23
	fmul.4s	v18, v18, v23
	fmul.4s	v21, v21, v23
	fmul.4s	v19, v19, v24
	fmul.4s	v20, v20, v24
	fmul.4s	v22, v22, v24
	mov	s23, v17[1]
	fadd	s16, s16, s17
	fadd	s16, s16, s23
	mov	s23, v17[2]
	fadd	s16, s16, s23
	mov	s17, v17[3]
	fadd	s16, s16, s17
	mov	s17, v19[1]
	fadd	s16, s16, s19
	fadd	s16, s16, s17
	mov	s17, v19[2]
	fadd	s16, s16, s17
	mov	s17, v18[1]
	fadd	s7, s7, s18
	fadd	s7, s7, s17
	mov	s17, v18[2]
	fadd	s7, s7, s17
	mov	s17, v18[3]
	fadd	s7, s7, s17
	mov	s17, v20[1]
	fadd	s7, s7, s20
	fadd	s7, s7, s17
	mov	s17, v20[2]
	fadd	s7, s7, s17
	mov	s17, v19[3]
	fadd	s16, s16, s17
	mov	s17, v21[1]
	fadd	s3, s3, s21
	fadd	s3, s3, s17
	mov	s17, v21[2]
	fadd	s3, s3, s17
	mov	s17, v21[3]
	fadd	s3, s3, s17
	mov	s17, v22[1]
	fadd	s3, s3, s22
	fadd	s3, s3, s17
	mov	s17, v20[3]
	fadd	s7, s7, s17
	mov	s17, v22[2]
	fadd	s3, s3, s17
	mov	s17, v22[3]
	fadd	s3, s3, s17
	add	x11, x11, #288
	cmp	x11, #36, lsl #12               ; =147456
	b.ne	LBB2_2
; %bb.3:                                ;   in Loop: Header=BB2_1 Depth=1
	madd	x11, x8, x10, x0
	ldr	d4, [x11, #24]
	mov.s	v16[1], v7[0]
	fadd.2s	v4, v16, v4
	str	d4, [x11, #24]
	ldr	s4, [x11, #32]
	fadd	s3, s3, s4
	str	s3, [x11, #32]
	add	x8, x8, #1
	cmp	x8, #1, lsl #12                 ; =4096
	b.ne	LBB2_1
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
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
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
	b.ne	LBB3_1
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
Lloh8:
	adrp	x21, l_.str.6@PAGE
Lloh9:
	add	x21, x21, l_.str.6@PAGEOFF
Lloh10:
	adrp	x22, l_.str.7@PAGE
Lloh11:
	add	x22, x22, l_.str.7@PAGEOFF
Lloh12:
	adrp	x23, l_.str.8@PAGE
Lloh13:
	add	x23, x23, l_.str.8@PAGEOFF
Lloh14:
	adrp	x24, l_.str.9@PAGE
Lloh15:
	add	x24, x24, l_.str.9@PAGEOFF
Lloh16:
	adrp	x25, l_.str.10@PAGE
Lloh17:
	add	x25, x25, l_.str.10@PAGEOFF
Lloh18:
	adrp	x26, l_.str.11@PAGE
Lloh19:
	add	x26, x26, l_.str.11@PAGEOFF
Lloh20:
	adrp	x27, l_.str.12@PAGE
Lloh21:
	add	x27, x27, l_.str.12@PAGEOFF
Lloh22:
	adrp	x28, l_.str.13@PAGE
Lloh23:
	add	x28, x28, l_.str.13@PAGEOFF
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	s8, s9, [x20, #-16]
	ldp	s10, s11, [x20, #-8]
	ldp	s12, s13, [x20]
	ldp	s14, s15, [x20, #8]
	ldr	s0, [x20, #16]
	str	s0, [sp, #12]                   ; 4-byte Folded Spill
	str	x19, [sp]
Lloh24:
	adrp	x0, l_.str.4@PAGE
Lloh25:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	fcvt	d0, s8
	str	d0, [sp]
Lloh26:
	adrp	x0, l_.str.5@PAGE
Lloh27:
	add	x0, x0, l_.str.5@PAGEOFF
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
	b.ne	LBB4_1
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
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"sizeof(float3_t) = %zu\n"

l_.str.1:                               ; @.str.1
	.asciz	"alignof(float3_t) = %zu\n"

l_.str.2:                               ; @.str.2
	.asciz	"sizeof(particle3_t) = %zu\n"

l_.str.3:                               ; @.str.3
	.asciz	"alignof(particle3_t) = %zu\n"

l_.str.4:                               ; @.str.4
	.asciz	"particle %d: "

l_.str.5:                               ; @.str.5
	.asciz	"pos.x = %.4f, "

l_.str.6:                               ; @.str.6
	.asciz	"pos.y = %.4f, "

l_.str.7:                               ; @.str.7
	.asciz	"pos.z = %.4f, "

l_.str.8:                               ; @.str.8
	.asciz	"vel.x = %.4f, "

l_.str.9:                               ; @.str.9
	.asciz	"vel.y = %.4f, "

l_.str.10:                              ; @.str.10
	.asciz	"vel.z = %.4f, "

l_.str.11:                              ; @.str.11
	.asciz	"acc.x = %.4f, "

l_.str.12:                              ; @.str.12
	.asciz	"acc.y = %.4f, "

l_.str.13:                              ; @.str.13
	.asciz	"acc.z = %.4f\n"

.subsections_via_symbols
