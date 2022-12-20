	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
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
Lloh0:
	adrp	x19, _particles@GOTPAGE
Lloh1:
	ldr	x19, [x19, _particles@GOTPAGEOFF]
	mov	x0, x19
	bl	_particle3_rand_init
	mov	x0, x19
	bl	_particle3_print
	bl	_clock
	mov	x20, x0
	mov	x8, #1610612736
	movk	x8, #16783, lsl #32
	movk	x8, #16559, lsl #48
	fmov	d0, x8
	mov	x0, x19
	bl	_particle3_gravitational_force
	bl	_clock
	sub	x8, x0, x20
	ucvtf	d0, x8
	mov	x8, #60813
	movk	x8, #41141, lsl #16
	movk	x8, #50935, lsl #32
	movk	x8, #16048, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	str	d0, [sp]
Lloh2:
	adrp	x0, l_.str@PAGE
Lloh3:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.comm	_particles,147456,2             ; @particles
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Elapsed = %.20f\n"

.subsections_via_symbols
