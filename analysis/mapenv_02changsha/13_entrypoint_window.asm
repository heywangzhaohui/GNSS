
mapenv_02changsha.bin:     file format elf64-littleaarch64


Disassembly of section .text:

000000000059cf00 <_GLOBAL__sub_I_utilities.cc+0x98>:
  59cf00:	bl	593ee0 <getenv@plt>
  59cf04:	cbz	x0, 59cf1c <_GLOBAL__sub_I_utilities.cc+0xb4>
  59cf08:	mov	x1, x0
  59cf0c:	mov	x0, x19
  59cf10:	ldr	x19, [sp, #16]
  59cf14:	ldp	x29, x30, [sp], #32
  59cf18:	b	5933b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@plt>
  59cf1c:	mov	x0, x19
  59cf20:	ldr	x19, [sp, #16]
  59cf24:	ldp	x29, x30, [sp], #32
  59cf28:	adrp	x1, a0b000 <grpc_chttp2_huffsyms+0x260>
  59cf2c:	add	x1, x1, #0xb40
  59cf30:	b	5933b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@plt>

000000000059cf34 <_start>:
  59cf34:	mov	x29, #0x0                   	// #0
  59cf38:	mov	x30, #0x0                   	// #0
  59cf3c:	mov	x5, x0
  59cf40:	ldr	x1, [sp]
  59cf44:	add	x2, sp, #0x8
  59cf48:	mov	x6, sp
  59cf4c:	movz	x0, #0x0, lsl #48
  59cf50:	movk	x0, #0x0, lsl #32
  59cf54:	movk	x0, #0x59, lsl #16
  59cf58:	movk	x0, #0x7078
  59cf5c:	movz	x3, #0x0, lsl #48
  59cf60:	movk	x3, #0x0, lsl #32
  59cf64:	movk	x3, #0x9a, lsl #16
  59cf68:	movk	x3, #0xdfc8
  59cf6c:	movz	x4, #0x0, lsl #48
  59cf70:	movk	x4, #0x0, lsl #32
  59cf74:	movk	x4, #0x9a, lsl #16
  59cf78:	movk	x4, #0xe048
  59cf7c:	bl	594ab0 <__libc_start_main@plt>
  59cf80:	bl	594a10 <abort@plt>

000000000059cf84 <call_weak_fn>:
  59cf84:	adrp	x0, b12000 <google::protobuf::util::Status::OK@@Base-0x14920>
  59cf88:	ldr	x0, [x0, #1840]
  59cf8c:	cbz	x0, 59cf94 <call_weak_fn+0x10>
  59cf90:	b	594610 <__gmon_start__@plt>
  59cf94:	ret

000000000059cf98 <deregister_tm_clones>:
  59cf98:	adrp	x0, b21000 <casm_elev+0xa1d0>
  59cf9c:	add	x0, x0, #0x658
  59cfa0:	adrp	x1, b21000 <casm_elev+0xa1d0>
  59cfa4:	add	x1, x1, #0x658
  59cfa8:	cmp	x1, x0
  59cfac:	b.eq	59cfc4 <deregister_tm_clones+0x2c>  // b.none
  59cfb0:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  59cfb4:	ldr	x1, [x1, #120]
  59cfb8:	cbz	x1, 59cfc4 <deregister_tm_clones+0x2c>
  59cfbc:	mov	x16, x1
  59cfc0:	br	x16
  59cfc4:	ret

000000000059cfc8 <register_tm_clones>:
  59cfc8:	adrp	x0, b21000 <casm_elev+0xa1d0>
  59cfcc:	add	x0, x0, #0x658
  59cfd0:	adrp	x1, b21000 <casm_elev+0xa1d0>
  59cfd4:	add	x1, x1, #0x658
  59cfd8:	sub	x1, x1, x0
  59cfdc:	lsr	x2, x1, #63
  59cfe0:	add	x1, x2, x1, asr #3
  59cfe4:	cmp	xzr, x1, asr #1
  59cfe8:	asr	x1, x1, #1
  59cfec:	b.eq	59d004 <register_tm_clones+0x3c>  // b.none
  59cff0:	adrp	x2, 9ae000 <__libc_csu_init+0x38>
  59cff4:	ldr	x2, [x2, #128]
  59cff8:	cbz	x2, 59d004 <register_tm_clones+0x3c>
  59cffc:	mov	x16, x2
  59d000:	br	x16
  59d004:	ret

000000000059d008 <__do_global_dtors_aux>:
  59d008:	stp	x29, x30, [sp, #-32]!
  59d00c:	mov	x29, sp
  59d010:	str	x19, [sp, #16]
  59d014:	adrp	x19, b21000 <casm_elev+0xa1d0>
  59d018:	ldrb	w0, [x19, #1664]
  59d01c:	cbnz	w0, 59d02c <__do_global_dtors_aux+0x24>
  59d020:	bl	59cf98 <deregister_tm_clones>
  59d024:	mov	w0, #0x1                   	// #1
  59d028:	strb	w0, [x19, #1664]
  59d02c:	ldr	x19, [sp, #16]
  59d030:	ldp	x29, x30, [sp], #32
  59d034:	ret

000000000059d038 <frame_dummy>:
  59d038:	b	59cfc8 <register_tm_clones>
  59d03c:	nop

000000000059d040 <my_exit_handler(int)>:
  59d040:	stp	x29, x30, [sp, #-64]!
  59d044:	adrp	x4, b12000 <google::protobuf::util::Status::OK@@Base-0x14920>
  59d048:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  59d04c:	mov	x29, sp
  59d050:	ldr	x4, [x4, #3688]
  59d054:	add	x1, x1, #0x110
  59d058:	mov	w3, #0x2                   	// #2
  59d05c:	mov	w2, #0x17                  	// #23
  59d060:	stp	x19, x20, [sp, #16]
  59d064:	add	x19, sp, #0x28
  59d068:	mov	w20, w0
  59d06c:	ldr	x0, [x4]
  59d070:	str	x0, [sp, #56]
  59d074:	mov	x0, #0x0                   	// #0
  59d078:	mov	x0, x19
  59d07c:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
