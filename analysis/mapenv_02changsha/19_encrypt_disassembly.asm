
mapenv_02changsha.bin:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000710b80 <getZJValue+0x30>:
  710b80:	ret
  710b84:	nop

0000000000710b88 <EncryptHX>:
  710b88:	stp	x29, x30, [sp, #-48]!
  710b8c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710b90:	mov	x29, sp
  710b94:	stp	d8, d9, [sp, #16]
  710b98:	fmov	d8, d1
  710b9c:	ldr	d9, [x0, #3360]
  710ba0:	str	d10, [sp, #32]
  710ba4:	fmul	d9, d0, d9
  710ba8:	fmov	d0, d9
  710bac:	bl	710730 <encrpytTL>
  710bb0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710bb4:	fmov	d1, #1.000000000000000000e+00
  710bb8:	ldr	d2, [x0, #3368]
  710bbc:	fmul	d2, d0, d2
  710bc0:	fmsub	d0, d0, d2, d1
  710bc4:	fsqrt	d10, d0
  710bc8:	fcmp	d0, #0.0
  710bcc:	b.mi	710c18 <EncryptHX+0x90>  // b.first
  710bd0:	fmov	d0, d9
  710bd4:	bl	594770 <cos@plt>
  710bd8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710bdc:	ldr	d2, [x0, #3376]
  710be0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710be4:	ldr	d3, [x0, #1960]
  710be8:	mov	x0, #0x800000000000        	// #140737488355328
  710bec:	fdiv	d2, d2, d10
  710bf0:	movk	x0, #0x4066, lsl #48
  710bf4:	fmov	d1, x0
  710bf8:	ldr	d10, [sp, #32]
  710bfc:	fmul	d8, d8, d1
  710c00:	fmul	d2, d2, d0
  710c04:	fmul	d2, d2, d3
  710c08:	fdiv	d0, d8, d2
  710c0c:	ldp	d8, d9, [sp, #16]
  710c10:	ldp	x29, x30, [sp], #48
  710c14:	ret
  710c18:	bl	593cc0 <sqrt@plt>
  710c1c:	b	710bd0 <EncryptHX+0x48>

0000000000710c20 <EncryptHY>:
  710c20:	stp	x29, x30, [sp, #-48]!
  710c24:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710c28:	fmov	d18, d1
  710c2c:	mov	x29, sp
  710c30:	ldr	d2, [x0, #3360]
  710c34:	str	d8, [sp, #16]
  710c38:	fmul	d0, d0, d2
  710c3c:	bl	710730 <encrpytTL>
  710c40:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710c44:	fmov	d2, #1.000000000000000000e+00
  710c48:	ldr	d3, [x0, #3368]
  710c4c:	mov	x0, #0x800000000000        	// #140737488355328
  710c50:	movk	x0, #0x4066, lsl #48
  710c54:	fmov	d1, x0
  710c58:	fmul	d3, d0, d3
  710c5c:	fmul	d1, d18, d1
  710c60:	fmsub	d0, d0, d3, d2
  710c64:	fcmp	d0, #0.0
  710c68:	fmul	d1, d1, d0
  710c6c:	fsqrt	d8, d0
  710c70:	b.mi	710c90 <EncryptHY+0x70>  // b.first
  710c74:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710c78:	fmul	d1, d1, d8
  710c7c:	ldr	d8, [sp, #16]
  710c80:	ldr	d0, [x0, #3384]
  710c84:	ldp	x29, x30, [sp], #48
  710c88:	fdiv	d0, d1, d0
  710c8c:	ret
  710c90:	str	d1, [sp, #40]
  710c94:	bl	593cc0 <sqrt@plt>
  710c98:	ldr	d1, [sp, #40]
  710c9c:	b	710c74 <EncryptHY+0x54>

0000000000710ca0 <JudgeSD>:
  710ca0:	stp	x29, x30, [sp, #-48]!
  710ca4:	mov	x0, #0x400000000000        	// #70368744177664
  710ca8:	movk	x0, #0x408f, lsl #48
  710cac:	mov	x29, sp
  710cb0:	str	x19, [sp, #16]
  710cb4:	adrp	x19, b27000 <google::protobuf::_EnumOptions_default_instance_+0x8>
  710cb8:	add	x1, x19, #0x8a8
  710cbc:	fmov	d2, x0
  710cc0:	ldr	w2, [x19, #2216]
  710cc4:	stp	d8, d9, [sp, #32]
  710cc8:	ldr	w0, [x1, #4]
  710ccc:	sub	w0, w2, w0
  710cd0:	ucvtf	d8, w0
  710cd4:	fdiv	d8, d8, d2
  710cd8:	fcmpe	d8, #0.0
  710cdc:	b.ls	710d3c <JudgeSD+0x9c>  // b.plast
  710ce0:	mov	x0, #0x405e000000000000    	// #4638144666238189568
  710ce4:	fmov	d2, x0
  710ce8:	mov	w0, #0x0                   	// #0
  710cec:	fcmpe	d8, d2
  710cf0:	b.le	710d2c <JudgeSD+0x8c>
  710cf4:	ldr	d2, [x1, #40]
  710cf8:	fmov	d3, #3.000000000000000000e+00
  710cfc:	fcmp	d2, d3
  710d00:	b.eq	710d70 <JudgeSD+0xd0>  // b.none
  710d04:	add	x19, x19, #0x8a8
  710d08:	fmov	d0, #3.000000000000000000e+00
  710d0c:	mov	w0, #0x0                   	// #0
  710d10:	fadd	d2, d2, d0
  710d14:	ldr	d1, [x19, #16]
  710d18:	ldr	d0, [x19, #32]
  710d1c:	str	w2, [x19, #4]
  710d20:	str	d1, [x19, #8]
  710d24:	str	d0, [x19, #24]
  710d28:	str	d2, [x19, #40]
  710d2c:	ldr	x19, [sp, #16]
  710d30:	ldp	d8, d9, [sp, #32]
  710d34:	ldp	x29, x30, [sp], #48
  710d38:	ret
  710d3c:	ldp	d1, d0, [x1, #32]
  710d40:	fmov	d3, #3.000000000000000000e+00
  710d44:	ldr	d2, [x1, #16]
  710d48:	mov	w0, #0x0                   	// #0
  710d4c:	str	w2, [x1, #4]
  710d50:	fadd	d0, d0, d3
  710d54:	str	d1, [x1, #24]
  710d58:	str	d2, [x1, #8]
  710d5c:	ldr	x19, [sp, #16]
  710d60:	str	d0, [x1, #40]
  710d64:	ldp	d8, d9, [sp, #32]
  710d68:	ldp	x29, x30, [sp], #48
  710d6c:	ret
  710d70:	ldr	d2, [x1, #24]
  710d74:	ldr	d3, [x1, #8]
  710d78:	str	d0, [x1, #16]
  710d7c:	fsub	d2, d1, d2
  710d80:	str	xzr, [x1, #40]
  710d84:	fsub	d0, d0, d3
  710d88:	str	d1, [x1, #32]
  710d8c:	fmul	d2, d2, d2
  710d90:	fmadd	d0, d0, d0, d2
  710d94:	fsqrt	d9, d0
  710d98:	fcmp	d0, #0.0
  710d9c:	b.mi	710dd0 <JudgeSD+0x130>  // b.first
  710da0:	fdiv	d8, d9, d8
  710da4:	mov	x0, #0xe20000000000        	// #248489627877376
  710da8:	movk	x0, #0x40a8, lsl #48
  710dac:	fmov	d0, x0
  710db0:	fcmpe	d8, d0
  710db4:	b.gt	710dc8 <JudgeSD+0x128>
  710db8:	add	x0, x19, #0x8a8
  710dbc:	ldr	w2, [x19, #2216]
  710dc0:	ldr	d2, [x0, #40]
  710dc4:	b	710d04 <JudgeSD+0x64>
  710dc8:	mov	w0, #0xffffffff            	// #-1
  710dcc:	b	710d2c <JudgeSD+0x8c>
  710dd0:	bl	593cc0 <sqrt@plt>
  710dd4:	b	710da0 <JudgeSD+0x100>

0000000000710dd8 <EncryptRn>:
  710dd8:	cbz	w0, 710e2c <EncryptRn+0x54>
  710ddc:	ucvtf	d1, w0
  710de0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710de4:	fmov	d4, #5.000000000000000000e-01
  710de8:	fmov	d6, #2.000000000000000000e+00
  710dec:	ldr	d5, [x0, #3392]
  710df0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710df4:	ldr	d0, [x0, #3400]
  710df8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710dfc:	fdiv	d3, d1, d5
  710e00:	ldr	d2, [x0, #3408]
  710e04:	fcvtzs	w0, d3
  710e08:	scvtf	d3, w0
  710e0c:	fmsub	d1, d3, d5, d1
  710e10:	fmadd	d1, d1, d0, d2
  710e14:	fmul	d2, d1, d4
  710e18:	fcvtzs	w0, d2
  710e1c:	scvtf	d0, w0
  710e20:	fmsub	d1, d0, d6, d1
  710e24:	fmul	d0, d1, d4
  710e28:	ret
  710e2c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710e30:	ldr	d0, [x0, #3416]
  710e34:	ret

0000000000710e38 <EncrpytIni>:
  710e38:	ucvtf	d1, w2
  710e3c:	ucvtf	d0, w3
  710e40:	adrp	x0, b27000 <google::protobuf::_EnumOptions_default_instance_+0x8>
  710e44:	add	x0, x0, #0x8a8
  710e48:	fmov	d2, #3.000000000000000000e+00
  710e4c:	stp	d1, d1, [x0, #8]
  710e50:	stp	d0, d0, [x0, #24]
  710e54:	str	d2, [x0, #40]
  710e58:	ret
  710e5c:	nop

0000000000710e60 <wgtochina_lb>:
  710e60:	stp	x29, x30, [sp, #-96]!
  710e64:	sub	w4, w4, #0x96c
  710e68:	cmp	w4, #0x1c
  710e6c:	mov	x29, sp
  710e70:	stp	x19, x20, [sp, #16]
  710e74:	mov	x19, x6
  710e78:	mov	x20, x7
  710e7c:	b.hi	710f24 <wgtochina_lb+0xc4>  // b.pmore
  710e80:	mov	w4, #0x1388                	// #5000
  710e84:	cmp	w3, w4
  710e88:	b.gt	710f24 <wgtochina_lb+0xc4>
  710e8c:	ucvtf	d0, w1
  710e90:	mov	x3, #0x200000000000        	// #35184372088832
  710e94:	movk	x3, #0x414c, lsl #48
  710e98:	fmov	d2, x3
  710e9c:	stp	d8, d9, [sp, #32]
  710ea0:	adrp	x3, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710ea4:	fdiv	d9, d0, d2
  710ea8:	ldr	d1, [x3, #3424]
  710eac:	fcmpe	d9, d1
  710eb0:	b.mi	710f20 <wgtochina_lb+0xc0>  // b.first
  710eb4:	adrp	x3, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710eb8:	ldr	d1, [x3, #3432]
  710ebc:	fcmpe	d9, d1
  710ec0:	b.gt	710f20 <wgtochina_lb+0xc0>
  710ec4:	ucvtf	d1, w2
  710ec8:	adrp	x3, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710ecc:	ldr	d3, [x3, #3440]
  710ed0:	fdiv	d8, d1, d2
  710ed4:	fcmpe	d8, d3
  710ed8:	b.mi	710f20 <wgtochina_lb+0xc0>  // b.first
  710edc:	adrp	x3, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710ee0:	ldr	d2, [x3, #3448]
  710ee4:	fcmpe	d8, d2
  710ee8:	b.gt	710f20 <wgtochina_lb+0xc0>
  710eec:	cbnz	w0, 710f3c <wgtochina_lb+0xdc>
  710ef0:	adrp	x3, b27000 <google::protobuf::_EnumOptions_default_instance_+0x8>
  710ef4:	add	x3, x3, #0x8a8
  710ef8:	fmov	d2, #3.000000000000000000e+00
  710efc:	ldp	d8, d9, [sp, #32]
  710f00:	stp	d0, d0, [x3, #8]
  710f04:	stp	d1, d1, [x3, #24]
  710f08:	str	d2, [x3, #40]
  710f0c:	str	w1, [x6]
  710f10:	str	w2, [x7]
  710f14:	ldp	x19, x20, [sp, #16]
  710f18:	ldp	x29, x30, [sp], #96
  710f1c:	ret
  710f20:	ldp	d8, d9, [sp, #32]
  710f24:	str	wzr, [x19]
  710f28:	mov	w0, #0xffff95ff            	// #-27137
  710f2c:	str	wzr, [x20]
  710f30:	ldp	x19, x20, [sp, #16]
  710f34:	ldp	x29, x30, [sp], #96
  710f38:	ret
  710f3c:	adrp	x0, b27000 <google::protobuf::_EnumOptions_default_instance_+0x8>
  710f40:	str	w5, [x0, #2216]
  710f44:	bl	710ca0 <JudgeSD>
  710f48:	cmn	w0, #0x1
  710f4c:	b.eq	710f20 <wgtochina_lb+0xc0>  // b.none
  710f50:	mov	x0, #0x6a0000000000        	// #116548232544256
  710f54:	fmov	d2, #1.000000000000000000e+01
  710f58:	movk	x0, #0x40f8, lsl #48
  710f5c:	fmov	d0, x0
  710f60:	mov	x0, #0x848000000000        	// #145685290680320
  710f64:	stp	d10, d11, [sp, #48]
  710f68:	fmul	d0, d9, d0
  710f6c:	movk	x0, #0x412e, lsl #48
  710f70:	fmov	d1, x0
  710f74:	adrp	x0, 9b4000 <grpc_stats_histo_buckets+0x2a0>
  710f78:	stp	d12, d13, [sp, #64]
  710f7c:	fmul	d9, d9, d1
  710f80:	ldr	d3, [x0, #3704]
  710f84:	fcvtzs	w0, d0
  710f88:	str	d14, [sp, #80]
  710f8c:	fcvtzs	w1, d9
  710f90:	scvtf	d0, w0
  710f94:	scvtf	d1, w1
  710f98:	fmul	d2, d0, d2
  710f9c:	fsub	d9, d9, d1
  710fa0:	fsub	d1, d1, d2
  710fa4:	fmul	d9, d9, d3
  710fa8:	fcvtzs	w0, d1
  710fac:	cmp	w0, #0x4
  710fb0:	b.le	711170 <wgtochina_lb+0x310>
  710fb4:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710fb8:	fmov	d3, #5.000000000000000000e+00
  710fbc:	ldr	d1, [x0, #3312]
  710fc0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710fc4:	fadd	d2, d2, d3
  710fc8:	ldr	d0, [x0, #3320]
  710fcc:	fmul	d9, d9, d1
  710fd0:	fmadd	d9, d2, d0, d9
  710fd4:	mov	x0, #0x6a0000000000        	// #116548232544256
  710fd8:	fmov	d3, #1.000000000000000000e+01
  710fdc:	movk	x0, #0x40f8, lsl #48
  710fe0:	fmov	d0, x0
  710fe4:	mov	x0, #0x848000000000        	// #145685290680320
  710fe8:	fmul	d0, d8, d0
  710fec:	movk	x0, #0x412e, lsl #48
  710ff0:	fmov	d2, x0
  710ff4:	adrp	x0, 9b4000 <grpc_stats_histo_buckets+0x2a0>
  710ff8:	fmul	d2, d8, d2
  710ffc:	ldr	d8, [x0, #3704]
  711000:	fcvtzs	w0, d0
  711004:	fcvtzs	w1, d2
  711008:	scvtf	d0, w0
  71100c:	scvtf	d1, w1
  711010:	fmul	d3, d0, d3
  711014:	fsub	d2, d2, d1
  711018:	fsub	d1, d1, d3
  71101c:	fmul	d2, d2, d8
  711020:	fcvtzs	w0, d1
  711024:	cmp	w0, #0x4
  711028:	b.gt	711184 <wgtochina_lb+0x324>
  71102c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711030:	fadd	d2, d0, d2
  711034:	ldr	d8, [x0, #3312]
  711038:	fmul	d8, d2, d8
  71103c:	mov	x0, #0x400000000000        	// #70368744177664
  711040:	mov	x1, #0x800000000000        	// #140737488355328
  711044:	movk	x0, #0x405a, lsl #48
  711048:	movk	x1, #0x4041, lsl #48
  71104c:	fmov	d10, x0
  711050:	fmov	d12, x1
  711054:	fsub	d10, d9, d10
  711058:	fsub	d12, d8, d12
  71105c:	fmov	d0, d10
  711060:	fmov	d1, d12
  711064:	bl	710860 <EncrpytLonLatA>
  711068:	fmov	d11, d0
  71106c:	fmov	d1, d12
  711070:	fmov	d0, d10
  711074:	bl	7109d0 <EncrpytLonLatB>
  711078:	fmov	d12, d0
  71107c:	fmov	d1, d8
  711080:	fmov	d0, d9
  711084:	bl	710530 <Elev_Inter>
  711088:	fmov	d1, d0
  71108c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711090:	ldr	d13, [x0, #3360]
  711094:	adrp	x0, 9ae000 <__libc_csu_init+0x38>
  711098:	ldr	d10, [x0, #2272]
  71109c:	fmul	d13, d8, d13
  7110a0:	fmadd	d11, d1, d10, d11
  7110a4:	fmadd	d12, d1, d10, d12
  7110a8:	fmov	d0, d13
  7110ac:	bl	710730 <encrpytTL>
  7110b0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7110b4:	fmov	d1, #1.000000000000000000e+00
  7110b8:	ldr	d10, [x0, #3368]
  7110bc:	fmul	d10, d0, d10
  7110c0:	fmsub	d10, d0, d10, d1
  7110c4:	fsqrt	d14, d10
  7110c8:	fcmp	d10, #0.0
  7110cc:	b.mi	7111a8 <wgtochina_lb+0x348>  // b.first
  7110d0:	fmov	d0, d13
  7110d4:	bl	594770 <cos@plt>
  7110d8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7110dc:	ldr	d1, [x0, #3376]
  7110e0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7110e4:	ldr	d4, [x0, #1960]
  7110e8:	mov	x0, #0x800000000000        	// #140737488355328
  7110ec:	fdiv	d1, d1, d14
  7110f0:	movk	x0, #0x4066, lsl #48
  7110f4:	fmov	d2, x0
  7110f8:	mov	x0, #0x200000000000        	// #35184372088832
  7110fc:	movk	x0, #0x414c, lsl #48
  711100:	fmov	d3, x0
  711104:	fmul	d11, d11, d2
  711108:	fmul	d12, d12, d2
  71110c:	fmul	d10, d12, d10
  711110:	fmul	d1, d1, d0
  711114:	fmul	d1, d1, d4
  711118:	fdiv	d11, d11, d1
  71111c:	fadd	d9, d11, d9
  711120:	fmul	d9, d9, d3
  711124:	fcvtzu	w0, d9
  711128:	str	w0, [x19]
  71112c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711130:	fmul	d10, d14, d10
  711134:	ldp	d12, d13, [sp, #64]
  711138:	ldr	d1, [x0, #3384]
  71113c:	mov	x0, #0x200000000000        	// #35184372088832
  711140:	movk	x0, #0x414c, lsl #48
  711144:	fmov	d0, x0
  711148:	mov	w0, #0x0                   	// #0
  71114c:	ldr	d14, [sp, #80]
  711150:	fdiv	d10, d10, d1
  711154:	fadd	d8, d10, d8
  711158:	ldp	d10, d11, [sp, #48]
  71115c:	fmul	d8, d8, d0
  711160:	fcvtzu	w1, d8
  711164:	ldp	d8, d9, [sp, #32]
  711168:	str	w1, [x20]
  71116c:	b	710f30 <wgtochina_lb+0xd0>
  711170:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711174:	fadd	d9, d0, d9
  711178:	ldr	d0, [x0, #3312]
  71117c:	fmul	d9, d9, d0
  711180:	b	710fd4 <wgtochina_lb+0x174>
  711184:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711188:	fmov	d1, #5.000000000000000000e+00
  71118c:	ldr	d0, [x0, #3312]
  711190:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711194:	fadd	d3, d3, d1
  711198:	ldr	d8, [x0, #3320]
  71119c:	fmul	d2, d2, d0
  7111a0:	fmadd	d8, d3, d8, d2
  7111a4:	b	71103c <wgtochina_lb+0x1dc>
  7111a8:	fmov	d0, d10
  7111ac:	bl	593cc0 <sqrt@plt>
  7111b0:	fmov	d0, d13
  7111b4:	bl	594770 <cos@plt>
  7111b8:	fmov	d5, d0
  7111bc:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7111c0:	ldr	d2, [x0, #3376]
  7111c4:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7111c8:	ldr	d4, [x0, #1960]
  7111cc:	mov	x0, #0x800000000000        	// #140737488355328
  7111d0:	fdiv	d2, d2, d14
  7111d4:	movk	x0, #0x4066, lsl #48
  7111d8:	fmov	d0, x0
  7111dc:	mov	x0, #0x200000000000        	// #35184372088832
  7111e0:	movk	x0, #0x414c, lsl #48
  7111e4:	fmov	d3, x0
  7111e8:	fmul	d1, d11, d0
  7111ec:	fmul	d12, d12, d0
  7111f0:	fmov	d0, d10
  7111f4:	fmul	d10, d12, d10
  7111f8:	fmul	d2, d2, d5
  7111fc:	fmul	d2, d2, d4
  711200:	fdiv	d1, d1, d2
  711204:	fadd	d9, d1, d9
  711208:	fmul	d1, d9, d3
  71120c:	fcvtzu	w0, d1
  711210:	str	w0, [x19]
  711214:	bl	593cc0 <sqrt@plt>
  711218:	b	71112c <wgtochina_lb+0x2cc>
  71121c:	nop

0000000000711220 <UTC2GPS(int, int, int, int, int, int, int&, int&)>:
  711220:	cmp	w0, #0x7bc
  711224:	mov	w8, #0x7bc                 	// #1980
  711228:	mov	w9, #0x0                   	// #0
  71122c:	b.le	71127c <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x5c>
  711230:	mov	w12, #0x5c29                	// #23593
  711234:	mov	w13, #0xd70a                	// #55050
  711238:	mov	w14, #0x5c28                	// #23592
  71123c:	movk	w12, #0xc28f, lsl #16
  711240:	movk	w13, #0xa3, lsl #16
  711244:	movk	w14, #0x28f, lsl #16
  711248:	mul	w10, w8, w12
  71124c:	tst	x8, #0x3
  711250:	b.ne	711260 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x40>  // b.any
  711254:	ror	w11, w10, #2
  711258:	cmp	w11, w14
  71125c:	b.hi	711368 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x148>  // b.pmore
  711260:	ror	w10, w10, #4
  711264:	cmp	w10, w13
  711268:	b.ls	711368 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x148>  // b.plast
  71126c:	add	w9, w9, #0x16d
  711270:	add	w8, w8, #0x1
  711274:	cmp	w0, w8
  711278:	b.ne	711248 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x28>  // b.any
  71127c:	cmp	w1, #0x1
  711280:	b.le	711304 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xe4>
  711284:	mov	w10, #0x851f                	// #34079
  711288:	asr	w11, w0, #31
  71128c:	movk	w10, #0x51eb, lsl #16
  711290:	mov	w14, #0x190                 	// #400
  711294:	mov	w13, #0x64                  	// #100
  711298:	and	w12, w0, #0x3
  71129c:	smull	x10, w0, w10
  7112a0:	asr	x8, x10, #39
  7112a4:	asr	x10, x10, #37
  7112a8:	sub	w8, w8, w11
  7112ac:	sub	w10, w10, w11
  7112b0:	msub	w8, w8, w14, w0
  7112b4:	msub	w10, w10, w13, w0
  7112b8:	cbz	w8, 711370 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x150>
  7112bc:	cbz	w12, 711460 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x240>
  7112c0:	mov	w0, #0x1                   	// #1
  7112c4:	mov	w8, #0x0                   	// #0
  7112c8:	and	w10, w0, #0xfffffffd
  7112cc:	sub	w11, w0, #0x7
  7112d0:	cmp	w10, #0x1
  7112d4:	b.eq	7112f0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xd0>  // b.none
  7112d8:	cmp	w11, #0x1
  7112dc:	sub	w11, w0, #0xa
  7112e0:	ccmp	w0, #0x5, #0x4, hi	// hi = pmore
  7112e4:	b.eq	7112f0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xd0>  // b.none
  7112e8:	tst	w11, #0xfffffffd
  7112ec:	b.ne	7114b0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x290>  // b.any
  7112f0:	add	w8, w8, #0x1f
  7112f4:	add	w0, w0, #0x1
  7112f8:	cmp	w1, w0
  7112fc:	b.ne	7112c8 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xa8>  // b.any
  711300:	add	w2, w2, w8
  711304:	add	w9, w9, w2
  711308:	mov	w0, #0x2493                	// #9363
  71130c:	sub	w9, w9, #0x6
  711310:	movk	w0, #0x9249, lsl #16
  711314:	mov	w2, #0xe10                 	// #3600
  711318:	mov	w8, #0x5180                	// #20864
  71131c:	movk	w8, #0x1, lsl #16
  711320:	lsl	w1, w4, #4
  711324:	smull	x0, w9, w0
  711328:	sub	w1, w1, w4
  71132c:	mul	w3, w3, w2
  711330:	lsr	x0, x0, #32
  711334:	add	w0, w9, w0
  711338:	asr	w0, w0, #2
  71133c:	sub	w0, w0, w9, asr #31
  711340:	str	w0, [x6]
  711344:	lsl	w2, w0, #3
  711348:	sub	w0, w2, w0
  71134c:	sub	w9, w9, w0
  711350:	madd	w9, w9, w8, w3
  711354:	add	w9, w9, w1, lsl #2
  711358:	add	w0, w9, w5
  71135c:	add	w0, w0, #0x12
  711360:	str	w0, [x7]
  711364:	ret
  711368:	add	w9, w9, #0x16e
  71136c:	b	711270 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x50>
  711370:	mov	w0, #0x1                   	// #1
  711374:	cbnz	w12, 7113d0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1b0>
  711378:	cbnz	w10, 711420 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x200>
  71137c:	nop
  711380:	and	w10, w0, #0xfffffffd
  711384:	sub	w11, w0, #0x7
  711388:	cmp	w10, #0x1
  71138c:	b.eq	7113a8 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x188>  // b.none
  711390:	cmp	w11, #0x1
  711394:	sub	w11, w0, #0xa
  711398:	ccmp	w0, #0x5, #0x4, hi	// hi = pmore
  71139c:	b.eq	7113a8 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x188>  // b.none
  7113a0:	tst	w11, #0xfffffffd
  7113a4:	b.ne	711528 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x308>  // b.any
  7113a8:	add	w8, w8, #0x1f
  7113ac:	add	w0, w0, #0x1
  7113b0:	cmp	w1, w0
  7113b4:	b.ne	711380 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x160>  // b.any
  7113b8:	add	w2, w2, w8
  7113bc:	b	711304 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xe4>
  7113c0:	add	w8, w8, #0x1f
  7113c4:	add	w0, w0, #0x1
  7113c8:	cmp	w1, w0
  7113cc:	b.eq	711300 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xe0>  // b.none
  7113d0:	and	w10, w0, #0xfffffffd
  7113d4:	sub	w11, w0, #0x7
  7113d8:	cmp	w10, #0x1
  7113dc:	b.eq	7113c0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1a0>  // b.none
  7113e0:	cmp	w11, #0x1
  7113e4:	sub	w11, w0, #0xa
  7113e8:	ccmp	w0, #0x5, #0x4, hi	// hi = pmore
  7113ec:	b.eq	7113c0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1a0>  // b.none
  7113f0:	tst	w11, #0xfffffffd
  7113f4:	b.eq	7113c0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1a0>  // b.none
  7113f8:	cmp	w10, #0x4
  7113fc:	b.eq	711408 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1e8>  // b.none
  711400:	cmp	w10, #0x9
  711404:	b.ne	711578 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x358>  // b.any
  711408:	add	w8, w8, #0x1e
  71140c:	b	7113c4 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1a4>
  711410:	add	w8, w8, #0x1f
  711414:	add	w0, w0, #0x1
  711418:	cmp	w1, w0
  71141c:	b.eq	711300 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xe0>  // b.none
  711420:	and	w10, w0, #0xfffffffd
  711424:	sub	w11, w0, #0x7
  711428:	cmp	w10, #0x1
  71142c:	b.eq	711410 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1f0>  // b.none
  711430:	cmp	w11, #0x1
  711434:	sub	w11, w0, #0xa
  711438:	ccmp	w0, #0x5, #0x4, hi	// hi = pmore
  71143c:	b.eq	711410 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1f0>  // b.none
  711440:	tst	w11, #0xfffffffd
  711444:	b.eq	711410 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1f0>  // b.none
  711448:	cmp	w10, #0x4
  71144c:	b.eq	711570 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x350>  // b.none
  711450:	cmp	w10, #0x9
  711454:	b.eq	711570 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x350>  // b.none
  711458:	add	w8, w8, #0x1d
  71145c:	b	711414 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1f4>
  711460:	cbnz	w10, 7114c8 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2a8>
  711464:	mov	w8, #0x0                   	// #0
  711468:	mov	w0, #0x1                   	// #1
  71146c:	nop
  711470:	and	w10, w0, #0xfffffffd
  711474:	sub	w11, w0, #0x7
  711478:	cmp	w10, #0x1
  71147c:	b.eq	711498 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x278>  // b.none
  711480:	cmp	w11, #0x1
  711484:	sub	w11, w0, #0xa
  711488:	ccmp	w0, #0x5, #0x4, hi	// hi = pmore
  71148c:	b.eq	711498 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x278>  // b.none
  711490:	tst	w11, #0xfffffffd
  711494:	b.ne	711510 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2f0>  // b.any
  711498:	add	w8, w8, #0x1f
  71149c:	add	w0, w0, #0x1
  7114a0:	cmp	w1, w0
  7114a4:	b.ne	711470 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x250>  // b.any
  7114a8:	add	w2, w2, w8
  7114ac:	b	711304 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xe4>
  7114b0:	cmp	w10, #0x4
  7114b4:	b.eq	7114c0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2a0>  // b.none
  7114b8:	cmp	w10, #0x9
  7114bc:	b.ne	711580 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x360>  // b.any
  7114c0:	add	w8, w8, #0x1e
  7114c4:	b	7112f4 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xd4>
  7114c8:	mov	w0, #0x1                   	// #1
  7114cc:	mov	w8, #0x0                   	// #0
  7114d0:	and	w10, w0, #0xfffffffd
  7114d4:	sub	w11, w0, #0x7
  7114d8:	cmp	w10, #0x1
  7114dc:	b.eq	7114f8 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2d8>  // b.none
  7114e0:	cmp	w11, #0x1
  7114e4:	sub	w11, w0, #0xa
  7114e8:	ccmp	w0, #0x5, #0x4, hi	// hi = pmore
  7114ec:	b.eq	7114f8 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2d8>  // b.none
  7114f0:	tst	w11, #0xfffffffd
  7114f4:	b.ne	711540 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x320>  // b.any
  7114f8:	add	w8, w8, #0x1f
  7114fc:	add	w0, w0, #0x1
  711500:	cmp	w1, w0
  711504:	b.ne	7114d0 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2b0>  // b.any
  711508:	add	w2, w2, w8
  71150c:	b	711304 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xe4>
  711510:	cmp	w10, #0x4
  711514:	b.eq	711568 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x348>  // b.none
  711518:	cmp	w10, #0x9
  71151c:	b.eq	711568 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x348>  // b.none
  711520:	add	w8, w8, #0x1c
  711524:	b	71149c <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x27c>
  711528:	cmp	w10, #0x4
  71152c:	b.eq	711560 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x340>  // b.none
  711530:	cmp	w10, #0x9
  711534:	b.eq	711560 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x340>  // b.none
  711538:	add	w8, w8, #0x1d
  71153c:	b	7113ac <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x18c>
  711540:	cmp	w10, #0x4
  711544:	b.eq	711558 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x338>  // b.none
  711548:	cmp	w10, #0x9
  71154c:	b.eq	711558 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x338>  // b.none
  711550:	add	w8, w8, #0x1d
  711554:	b	7114fc <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2dc>
  711558:	add	w8, w8, #0x1e
  71155c:	b	7114fc <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x2dc>
  711560:	add	w8, w8, #0x1e
  711564:	b	7113ac <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x18c>
  711568:	add	w8, w8, #0x1e
  71156c:	b	71149c <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x27c>
  711570:	add	w8, w8, #0x1e
  711574:	b	711414 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1f4>
  711578:	add	w8, w8, #0x1d
  71157c:	b	7113c4 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0x1a4>
  711580:	add	w8, w8, #0x1c
  711584:	b	7112f4 <UTC2GPS(int, int, int, int, int, int, int&, int&)+0xd4>

0000000000711588 <timeConvert(long, int&, int&, int&, int&, int&, int&)>:
  711588:	mov	x7, #0xf7cf                	// #63439
  71158c:	stp	x29, x30, [sp, #-96]!
  711590:	movk	x7, #0xe353, lsl #16
  711594:	movk	x7, #0x9ba5, lsl #32
  711598:	mov	x29, sp
  71159c:	movk	x7, #0x20c4, lsl #48
  7115a0:	stp	x19, x20, [sp, #16]
  7115a4:	adrp	x19, b12000 <google::protobuf::util::Status::OK@@Base-0x14920>
  7115a8:	smulh	x7, x0, x7
  7115ac:	ldr	x19, [x19, #3688]
  7115b0:	mov	x20, x6
  7115b4:	asr	x7, x7, #7
  7115b8:	stp	x21, x22, [sp, #32]
  7115bc:	sub	x7, x7, x0, asr #63
  7115c0:	ldr	x0, [x19]
  7115c4:	str	x0, [sp, #88]
  7115c8:	mov	x0, #0x0                   	// #0
  7115cc:	mov	x22, x4
  7115d0:	mov	x21, x5
  7115d4:	add	x0, sp, #0x50
  7115d8:	stp	x23, x24, [sp, #48]
  7115dc:	mov	x24, x2
  7115e0:	mov	x23, x3
  7115e4:	str	x25, [sp, #64]
  7115e8:	mov	x25, x1
  7115ec:	str	x7, [sp, #80]
  7115f0:	bl	5949a0 <gmtime@plt>
  7115f4:	ldr	x1, [sp, #88]
  7115f8:	ldr	x2, [x19]
  7115fc:	subs	x1, x1, x2
  711600:	mov	x2, #0x0                   	// #0
  711604:	ldr	w1, [x0, #20]
  711608:	add	w1, w1, #0x76c
  71160c:	str	w1, [x25]
  711610:	ldr	w1, [x0, #16]
  711614:	add	w1, w1, #0x1
  711618:	str	w1, [x24]
  71161c:	ldr	w1, [x0, #12]
  711620:	str	w1, [x23]
  711624:	ldr	w1, [x0, #8]
  711628:	str	w1, [x22]
  71162c:	ldr	w1, [x0, #4]
  711630:	str	w1, [x21]
  711634:	ldr	w0, [x0]
  711638:	str	w0, [x20]
  71163c:	b.ne	711658 <timeConvert(long, int&, int&, int&, int&, int&, int&)+0xd0>  // b.any
  711640:	ldp	x19, x20, [sp, #16]
  711644:	ldp	x21, x22, [sp, #32]
  711648:	ldp	x23, x24, [sp, #48]
  71164c:	ldr	x25, [sp, #64]
  711650:	ldp	x29, x30, [sp], #96
  711654:	ret
  711658:	bl	595150 <__stack_chk_fail@plt>
  71165c:	nop

0000000000711660 <doEncrypt(long, double const&, double const&, double const&, double&, double&)>:
  711660:	mov	x6, #0xf7cf                	// #63439
  711664:	stp	x29, x30, [sp, #-160]!
  711668:	movk	x6, #0xe353, lsl #16
  71166c:	movk	x6, #0x9ba5, lsl #32
  711670:	mov	x29, sp
  711674:	movk	x6, #0x20c4, lsl #48
  711678:	stp	x19, x20, [sp, #16]
  71167c:	adrp	x20, b12000 <google::protobuf::util::Status::OK@@Base-0x14920>
  711680:	smulh	x6, x0, x6
  711684:	ldr	x7, [x20, #3688]
  711688:	add	x19, sp, #0x88
  71168c:	asr	x6, x6, #7
  711690:	stp	x21, x22, [sp, #32]
  711694:	sub	x6, x6, x0, asr #63
  711698:	ldr	x0, [x7]
  71169c:	str	x0, [sp, #152]
  7116a0:	mov	x0, #0x0                   	// #0
  7116a4:	mov	x21, x2
  7116a8:	mov	x22, x4
  7116ac:	mov	x0, x19
  7116b0:	stp	x23, x24, [sp, #48]
  7116b4:	mov	x23, x1
  7116b8:	mov	x24, x5
  7116bc:	str	x25, [sp, #64]
  7116c0:	mov	x25, x3
  7116c4:	str	d14, [sp, #72]
  7116c8:	stp	d8, d9, [sp, #80]
  7116cc:	stp	d10, d11, [sp, #96]
  7116d0:	stp	d12, d13, [sp, #112]
  7116d4:	str	x6, [sp, #136]
  7116d8:	bl	5949a0 <gmtime@plt>
  7116dc:	ldp	w3, w2, [x0, #8]
  7116e0:	add	x7, sp, #0x84
  7116e4:	ldp	w5, w4, [x0]
  7116e8:	add	x6, sp, #0x80
  7116ec:	ldp	w1, w0, [x0, #16]
  7116f0:	add	w1, w1, #0x1
  7116f4:	add	w0, w0, #0x76c
  7116f8:	bl	711220 <UTC2GPS(int, int, int, int, int, int, int&, int&)>
  7116fc:	ldr	d0, [x25]
  711700:	mov	w2, #0x1388                	// #5000
  711704:	ldr	w1, [sp, #128]
  711708:	fcvtzs	w0, d0
  71170c:	sub	w1, w1, #0x96c
  711710:	cmp	w1, #0x1c
  711714:	ccmp	w0, w2, #0x0, ls	// ls = plast
  711718:	b.gt	7117fc <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x19c>
  71171c:	ldr	d0, [x23]
  711720:	mov	x0, #0x404e000000000000    	// #4633641066610819072
  711724:	fmov	d3, x0
  711728:	mov	x0, #0x200000000000        	// #35184372088832
  71172c:	movk	x0, #0x414c, lsl #48
  711730:	fmov	d2, x0
  711734:	fmul	d0, d0, d3
  711738:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  71173c:	ldr	d1, [x0, #3424]
  711740:	fmul	d0, d0, d3
  711744:	fcvtzu	w0, d0, #10
  711748:	ucvtf	d0, w0
  71174c:	fdiv	d8, d0, d2
  711750:	fcmpe	d8, d1
  711754:	b.mi	7117fc <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x19c>  // b.first
  711758:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  71175c:	ldr	d1, [x0, #3432]
  711760:	fcmpe	d8, d1
  711764:	b.gt	7117fc <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x19c>
  711768:	ldr	d1, [x21]
  71176c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711770:	ldr	d4, [x0, #3440]
  711774:	fmul	d1, d1, d3
  711778:	fmul	d1, d1, d3
  71177c:	fcvtzu	w0, d1, #10
  711780:	ucvtf	d1, w0
  711784:	fdiv	d10, d1, d2
  711788:	fcmpe	d10, d4
  71178c:	b.mi	7117fc <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x19c>  // b.first
  711790:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711794:	ldr	d2, [x0, #3448]
  711798:	fcmpe	d10, d2
  71179c:	b.gt	7117fc <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x19c>
  7117a0:	adrp	x21, b16000 <grpc_static_mdelem_table+0x1200>
  7117a4:	ldrb	w0, [x21, #3616]
  7117a8:	cbz	w0, 711878 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x218>
  7117ac:	adrp	x0, b27000 <google::protobuf::_EnumOptions_default_instance_+0x8>
  7117b0:	add	x0, x0, #0x8a8
  7117b4:	fmov	d2, #3.000000000000000000e+00
  7117b8:	stp	d0, d0, [x0, #8]
  7117bc:	stp	d1, d1, [x0, #24]
  7117c0:	str	d2, [x0, #40]
  7117c4:	str	d0, [x22]
  7117c8:	mov	x0, #0x200000000000        	// #35184372088832
  7117cc:	str	d1, [x24]
  7117d0:	movk	x0, #0x414c, lsl #48
  7117d4:	ldr	d1, [x22]
  7117d8:	fmov	d0, x0
  7117dc:	strb	wzr, [x21, #3616]
  7117e0:	mov	w0, #0x1                   	// #1
  7117e4:	fdiv	d1, d1, d0
  7117e8:	str	d1, [x22]
  7117ec:	ldr	d1, [x24]
  7117f0:	fdiv	d0, d1, d0
  7117f4:	str	d0, [x24]
  7117f8:	b	711838 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x1d8>
  7117fc:	adrp	x1, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711800:	add	x1, x1, #0xc60
  711804:	mov	w3, #0x1                   	// #1
  711808:	mov	w2, #0x6a                  	// #106
  71180c:	mov	x0, x19
  711810:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  711814:	mov	x0, x19
  711818:	bl	99f010 <google::LogMessage::stream()>
  71181c:	adrp	x1, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711820:	mov	x2, #0x22                  	// #34
  711824:	add	x1, x1, #0xc98
  711828:	bl	5940a0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
  71182c:	mov	x0, x19
  711830:	bl	99fc20 <google::LogMessage::~LogMessage()>
  711834:	mov	w0, #0x0                   	// #0
  711838:	ldr	x20, [x20, #3688]
  71183c:	ldr	x1, [sp, #152]
  711840:	ldr	x2, [x20]
  711844:	subs	x1, x1, x2
  711848:	mov	x2, #0x0                   	// #0
  71184c:	b.ne	711ac8 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x468>  // b.any
  711850:	ldp	x19, x20, [sp, #16]
  711854:	ldp	x21, x22, [sp, #32]
  711858:	ldp	x23, x24, [sp, #48]
  71185c:	ldr	x25, [sp, #64]
  711860:	ldr	d14, [sp, #72]
  711864:	ldp	d8, d9, [sp, #80]
  711868:	ldp	d10, d11, [sp, #96]
  71186c:	ldp	d12, d13, [sp, #112]
  711870:	ldp	x29, x30, [sp], #160
  711874:	ret
  711878:	ldr	w1, [sp, #132]
  71187c:	adrp	x0, b27000 <google::protobuf::_EnumOptions_default_instance_+0x8>
  711880:	str	w1, [x0, #2216]
  711884:	bl	710ca0 <JudgeSD>
  711888:	cmn	w0, #0x1
  71188c:	b.eq	7117fc <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x19c>  // b.none
  711890:	mov	x0, #0x6a0000000000        	// #116548232544256
  711894:	fmov	d1, #1.000000000000000000e+01
  711898:	movk	x0, #0x40f8, lsl #48
  71189c:	fmov	d0, x0
  7118a0:	mov	x0, #0x848000000000        	// #145685290680320
  7118a4:	fmul	d0, d8, d0
  7118a8:	movk	x0, #0x412e, lsl #48
  7118ac:	fmov	d2, x0
  7118b0:	adrp	x0, 9b4000 <grpc_stats_histo_buckets+0x2a0>
  7118b4:	fmul	d8, d8, d2
  7118b8:	ldr	d11, [x0, #3704]
  7118bc:	fcvtzs	w0, d0
  7118c0:	fcvtzs	w1, d8
  7118c4:	scvtf	d0, w0
  7118c8:	scvtf	d2, w1
  7118cc:	fmul	d1, d0, d1
  7118d0:	fsub	d8, d8, d2
  7118d4:	fsub	d2, d2, d1
  7118d8:	fmul	d8, d8, d11
  7118dc:	fcvtzs	w0, d2
  7118e0:	cmp	w0, #0x4
  7118e4:	b.le	711a90 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x430>
  7118e8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7118ec:	fmov	d2, #5.000000000000000000e+00
  7118f0:	ldr	d0, [x0, #3312]
  7118f4:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7118f8:	fadd	d1, d1, d2
  7118fc:	ldr	d11, [x0, #3320]
