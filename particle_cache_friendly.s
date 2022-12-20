	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_particle3_cache_friendly_grav_force ; -- Begin function particle3_cache_friendly_grav_force
	.p2align	2
_particle3_cache_friendly_grav_force:   ; @particle3_cache_friendly_grav_force
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_cache_friendly_rand_init_pos3 ; -- Begin function particle3_cache_friendly_rand_init_pos3
	.p2align	2
_particle3_cache_friendly_rand_init_pos3: ; @particle3_cache_friendly_rand_init_pos3
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-96]!           ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
	.cfi_offset b12, -72
	.cfi_offset b13, -80
	.cfi_offset b14, -88
	.cfi_offset b15, -96
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
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d11, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d12, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d13, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d14, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d1, d10, d13
	fcvt	s1, d1
	add	x8, x19, x20
	fadd	d2, d11, d14
	fcvt	s2, d2
	stp	s1, s2, [x8]
	fadd	d0, d12, d0
	fcvt	s0, d0
	str	s0, [x8, #8]
	add	x20, x20, #12
	cmp	x20, #12, lsl #12               ; =49152
	b.ne	LBB1_1
; %bb.2:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #96             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_cache_friendly_rand_init_acc3 ; -- Begin function particle3_cache_friendly_rand_init_acc3
	.p2align	2
_particle3_cache_friendly_rand_init_acc3: ; @particle3_cache_friendly_rand_init_acc3
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-96]!           ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
	.cfi_offset b12, -72
	.cfi_offset b13, -80
	.cfi_offset b14, -88
	.cfi_offset b15, -96
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
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d11, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d12, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d13, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d14, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d1, d10, d13
	fcvt	s1, d1
	add	x8, x19, x20
	fadd	d2, d11, d14
	fcvt	s2, d2
	stp	s1, s2, [x8]
	fadd	d0, d12, d0
	fcvt	s0, d0
	str	s0, [x8, #8]
	add	x20, x20, #12
	cmp	x20, #12, lsl #12               ; =49152
	b.ne	LBB2_1
; %bb.2:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #96             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_cache_friendly_print_pos3 ; -- Begin function particle3_cache_friendly_print_pos3
	.p2align	2
_particle3_cache_friendly_print_pos3:   ; @particle3_cache_friendly_print_pos3
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
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
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	.cfi_offset b10, -88
	.cfi_offset b11, -96
	mov	x23, #0
	add	x24, x0, #4
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
Lloh2:
	adrp	x20, l_.str.1@PAGE
Lloh3:
	add	x20, x20, l_.str.1@PAGEOFF
Lloh4:
	adrp	x21, l_.str.2@PAGE
Lloh5:
	add	x21, x21, l_.str.2@PAGEOFF
Lloh6:
	adrp	x22, l_.str.3@PAGE
Lloh7:
	add	x22, x22, l_.str.3@PAGEOFF
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	s8, s9, [x24, #-4]
	ldr	s10, [x24, #4]
	str	x23, [sp]
	mov	x0, x19
	bl	_printf
	fcvt	d0, s8
	str	d0, [sp]
	mov	x0, x20
	bl	_printf
	fcvt	d0, s9
	str	d0, [sp]
	mov	x0, x21
	bl	_printf
	fcvt	d0, s10
	str	d0, [sp]
	mov	x0, x22
	bl	_printf
	add	x23, x23, #1
	add	x24, x24, #12
	cmp	x23, #1, lsl #12                ; =4096
	b.ne	LBB3_1
; %bb.2:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"particle %d, "

l_.str.1:                               ; @.str.1
	.asciz	"x = %.4f, "

l_.str.2:                               ; @.str.2
	.asciz	"y = %.4f, "

l_.str.3:                               ; @.str.3
	.asciz	"z = %.4f, "

.subsections_via_symbols
