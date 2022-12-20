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
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	w19, #4096
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	bl	_rand
	bl	_rand
	bl	_rand
	bl	_rand
	bl	_rand
	subs	w19, w19, #1
	b.ne	LBB1_1
; %bb.2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_cache_friendly_rand_init_acc3 ; -- Begin function particle3_cache_friendly_rand_init_acc3
	.p2align	2
_particle3_cache_friendly_rand_init_acc3: ; @particle3_cache_friendly_rand_init_acc3
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	w19, #4096
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	bl	_rand
	bl	_rand
	bl	_rand
	bl	_rand
	bl	_rand
	subs	w19, w19, #1
	b.ne	LBB2_1
; %bb.2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
