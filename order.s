	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_order_alloc                    ; -- Begin function order_alloc
	.p2align	2
_order_alloc:                           ; @order_alloc
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
	mov	x19, x0
	lsl	x0, x1, #2
	bl	_malloc
	cmp	x0, #0
	cset	w8, eq
	str	x0, [x19]
	lsl	w0, w8, #7
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_order_free                     ; -- Begin function order_free
	.p2align	2
_order_free:                            ; @order_free
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x0, [x0]
	cbz	x0, LBB1_2
; %bb.1:
	bl	_free
	mov	w0, #1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB1_2:
	mov	w0, #129
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_order_head_alloc               ; -- Begin function order_head_alloc
	.p2align	2
_order_head_alloc:                      ; @order_head_alloc
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
	mov	x19, x0
	lsl	x0, x1, #3
	bl	_malloc
	cmp	x0, #0
	cset	w8, eq
	str	x0, [x19]
	lsl	w0, w8, #7
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_order_head_free                ; -- Begin function order_head_free
	.p2align	2
_order_head_free:                       ; @order_head_free
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
	ldr	x19, [x0]
	cbnz	x19, LBB3_3
; %bb.1:
	mov	w0, #129
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB3_2:                                 ;   in Loop: Header=BB3_3 Depth=1
	add	x19, x19, #8
LBB3_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x19]
	cbz	x0, LBB3_2
; %bb.4:                                ;   in Loop: Header=BB3_3 Depth=1
	bl	_free
	b	LBB3_2
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
