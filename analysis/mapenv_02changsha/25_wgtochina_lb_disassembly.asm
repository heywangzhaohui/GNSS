
mapenv_02changsha.bin:     file format elf64-littleaarch64


Disassembly of section .text:

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
