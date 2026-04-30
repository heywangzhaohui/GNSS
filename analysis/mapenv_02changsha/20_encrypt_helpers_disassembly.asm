
mapenv_02changsha.bin:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000710500 <fusnloc::ekf::SystemModel<double, Kalman::StandardBase>::updateJacobians(fusnloc::ekf::State<double> const&, fusnloc::ekf::Control<double> const&)+0x4e8>:
  710500:	bl	594550 <pow@plt>
  710504:	fmul	d9, d9, d0
  710508:	ldr	d0, [x20]
  71050c:	fmov	d1, d13
  710510:	fdiv	d0, d0, d13
  710514:	fabs	d9, d9
  710518:	bl	594550 <pow@plt>
  71051c:	ldr	d10, [x20, #16]
  710520:	fmul	d10, d0, d10
  710524:	b	7104c4 <fusnloc::ekf::SystemModel<double, Kalman::StandardBase>::updateJacobians(fusnloc::ekf::State<double> const&, fusnloc::ekf::Control<double> const&)+0x4ac>
  710528:	bl	595150 <__stack_chk_fail@plt>
  71052c:	nop

0000000000710530 <Elev_Inter>:
  710530:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710534:	fmov	d2, d0
  710538:	movi	d0, #0x0
  71053c:	ldr	d3, [x0, #3264]
  710540:	fcmpe	d2, d3
  710544:	b.mi	71055c <Elev_Inter+0x2c>  // b.first
  710548:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  71054c:	movi	d0, #0x0
  710550:	ldr	d4, [x0, #3272]
  710554:	fcmpe	d2, d4
  710558:	b.le	710560 <Elev_Inter+0x30>
  71055c:	ret
  710560:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710564:	ldr	d4, [x0, #3280]
  710568:	fcmpe	d1, d4
  71056c:	b.mi	71055c <Elev_Inter+0x2c>  // b.first
  710570:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710574:	ldr	d5, [x0, #3288]
  710578:	fcmpe	d1, d5
  71057c:	b.gt	71055c <Elev_Inter+0x2c>
  710580:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710584:	fsub	d4, d2, d3
  710588:	fsub	d0, d5, d1
  71058c:	fmov	d17, #5.000000000000000000e-01
  710590:	ldr	d6, [x0, #3296]
  710594:	fmov	d7, #1.000000000000000000e+00
  710598:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  71059c:	adrp	x2, b16000 <grpc_static_mdelem_table+0x1200>
  7105a0:	add	x2, x2, #0xe30
  7105a4:	fdiv	d4, d4, d6
  7105a8:	ldr	d16, [x0, #3304]
  7105ac:	fdiv	d0, d0, d6
  7105b0:	fsub	d4, d4, d17
  7105b4:	fsub	d0, d0, d17
  7105b8:	fadd	d4, d4, d7
  7105bc:	fadd	d0, d0, d7
  7105c0:	fcvtzs	w1, d4
  7105c4:	fcvtzs	w0, d0
  7105c8:	sub	w4, w1, #0x1
  7105cc:	add	w3, w1, #0x1
  7105d0:	sub	w0, w0, #0x1
  7105d4:	scvtf	d0, w4
  7105d8:	scvtf	d4, w0
  7105dc:	add	w0, w0, w0, lsl #2
  7105e0:	lsl	w0, w0, #4
  7105e4:	fmadd	d3, d0, d6, d3
  7105e8:	add	w5, w1, w0
  7105ec:	fmsub	d5, d4, d6, d5
  7105f0:	add	w4, w3, w0
  7105f4:	add	w0, w0, #0x50
  7105f8:	ldr	d7, [x2, w5, sxtw #3]
  7105fc:	add	w1, w1, w0
  710600:	ldr	d4, [x2, w4, sxtw #3]
  710604:	add	w0, w3, w0
  710608:	ldr	d17, [x2, w1, sxtw #3]
  71060c:	ldr	d0, [x2, w0, sxtw #3]
  710610:	fsub	d2, d2, d3
  710614:	fsub	d5, d5, d1
  710618:	fsub	d3, d6, d2
  71061c:	fmul	d4, d2, d4
  710620:	fsub	d6, d6, d5
  710624:	fmul	d2, d2, d0
  710628:	fmul	d7, d3, d7
  71062c:	fmul	d1, d3, d17
  710630:	fmul	d3, d4, d6
  710634:	fmul	d0, d2, d5
  710638:	fmul	d6, d7, d6
  71063c:	fmul	d1, d1, d5
  710640:	fdiv	d2, d3, d16
  710644:	fdiv	d0, d0, d16
  710648:	fdiv	d6, d6, d16
  71064c:	fdiv	d1, d1, d16
  710650:	fadd	d2, d2, d6
  710654:	fadd	d1, d1, d2
  710658:	fadd	d0, d0, d1
  71065c:	ret

0000000000710660 <getYuValue>:
  710660:	fdiv	d2, d0, d1
  710664:	fcvtzs	w0, d2
  710668:	scvtf	d2, w0
  71066c:	fmsub	d0, d2, d1, d0
  710670:	ret
  710674:	nop

0000000000710678 <ToPow>:
  710678:	fmov	d1, d0
  71067c:	cmp	w0, #0x1
  710680:	b.le	710698 <ToPow+0x20>
  710684:	mov	w1, #0x1                   	// #1
  710688:	add	w1, w1, #0x1
  71068c:	fmul	d0, d0, d1
  710690:	cmp	w0, w1
  710694:	b.ne	710688 <ToPow+0x10>  // b.any
  710698:	ret
  71069c:	nop

00000000007106a0 <comLonValue>:
  7106a0:	mov	x0, #0x6a0000000000        	// #116548232544256
  7106a4:	fmov	d4, #1.000000000000000000e+01
  7106a8:	movk	x0, #0x40f8, lsl #48
  7106ac:	fmov	d2, x0
  7106b0:	mov	x0, #0x848000000000        	// #145685290680320
  7106b4:	fmul	d2, d0, d2
  7106b8:	movk	x0, #0x412e, lsl #48
  7106bc:	fmov	d3, x0
  7106c0:	adrp	x0, 9b4000 <grpc_stats_histo_buckets+0x2a0>
  7106c4:	fmul	d0, d0, d3
  7106c8:	ldr	d1, [x0, #3704]
  7106cc:	fcvtzs	w0, d2
  7106d0:	fcvtzs	w1, d0
  7106d4:	scvtf	d2, w0
  7106d8:	scvtf	d3, w1
  7106dc:	fmul	d4, d2, d4
  7106e0:	fsub	d0, d0, d3
  7106e4:	fsub	d3, d3, d4
  7106e8:	fmul	d1, d0, d1
  7106ec:	fcvtzs	w0, d3
  7106f0:	cmp	w0, #0x4
  7106f4:	b.gt	71070c <comLonValue+0x6c>
  7106f8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7106fc:	fadd	d1, d2, d1
  710700:	ldr	d0, [x0, #3312]
  710704:	fmul	d0, d1, d0
  710708:	ret
  71070c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710710:	fmov	d3, #5.000000000000000000e+00
  710714:	ldr	d0, [x0, #3312]
  710718:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  71071c:	fadd	d4, d4, d3
  710720:	ldr	d2, [x0, #3320]
  710724:	fmul	d0, d1, d0
  710728:	fmadd	d0, d4, d2, d0
  71072c:	ret

0000000000710730 <encrpytTL>:
  710730:	fcmpe	d0, #0.0
  710734:	mov	w2, #0x1                   	// #1
  710738:	mov	w1, #0x0                   	// #0
  71073c:	b.pl	71074c <encrpytTL+0x1c>  // b.nfrst
  710740:	fneg	d0, d0
  710744:	mov	w2, #0x0                   	// #0
  710748:	mov	w1, #0x1                   	// #1
  71074c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710750:	ldr	d2, [x0, #3328]
  710754:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710758:	ldr	d3, [x0, #1960]
  71075c:	fdiv	d1, d0, d2
  710760:	fcvtzs	w0, d1
  710764:	scvtf	d1, w0
  710768:	fmsub	d0, d1, d2, d0
  71076c:	fcmpe	d0, d3
  710770:	b.le	71077c <encrpytTL+0x4c>
  710774:	fsub	d0, d0, d3
  710778:	mov	w1, w2
  71077c:	fmul	d5, d0, d0
  710780:	fmov	d3, #6.000000000000000000e+00
  710784:	mov	x0, #0x405e000000000000    	// #4638144666238189568
  710788:	fmov	d6, x0
  71078c:	mov	x0, #0xb00000000000        	// #193514046488576
  710790:	cmp	w1, #0x1
  710794:	movk	x0, #0x40b3, lsl #48
  710798:	fmov	d2, x0
  71079c:	fmul	d5, d0, d5
  7107a0:	mov	x0, #0x260000000000        	// #41781441855488
  7107a4:	movk	x0, #0x4116, lsl #48
  7107a8:	fmov	d1, x0
  7107ac:	mov	x0, #0x8a800000000         	// #9517647527936
  7107b0:	movk	x0, #0x4183, lsl #48
  7107b4:	fmov	d17, x0
  7107b8:	fmul	d4, d0, d5
  7107bc:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7107c0:	fdiv	d5, d5, d3
  7107c4:	ldr	d16, [x0, #3336]
  7107c8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7107cc:	fmul	d4, d0, d4
  7107d0:	ldr	d7, [x0, #3344]
  7107d4:	fmul	d3, d0, d4
  7107d8:	fdiv	d4, d4, d6
  7107dc:	fmul	d3, d0, d3
  7107e0:	fmul	d6, d0, d3
  7107e4:	fdiv	d3, d3, d2
  7107e8:	fmul	d6, d0, d6
  7107ec:	fdiv	d6, d6, d1
  7107f0:	fsub	d0, d0, d5
  7107f4:	fadd	d1, d0, d4
  7107f8:	fsub	d1, d1, d3
  7107fc:	fadd	d1, d1, d6
  710800:	fmul	d0, d1, d1
  710804:	fmul	d0, d1, d0
  710808:	fmul	d0, d1, d0
  71080c:	fmul	d0, d1, d0
  710810:	fmul	d0, d1, d0
  710814:	fmul	d0, d1, d0
  710818:	fmul	d0, d1, d0
  71081c:	fmul	d0, d0, d1
  710820:	fmul	d0, d0, d1
  710824:	fmul	d0, d1, d0
  710828:	fmul	d2, d1, d0
  71082c:	fdiv	d0, d0, d17
  710830:	fmul	d2, d1, d2
  710834:	fmul	d3, d1, d2
  710838:	fdiv	d2, d2, d16
  71083c:	fmul	d3, d1, d3
  710840:	fdiv	d3, d3, d7
  710844:	fsub	d1, d1, d0
  710848:	fadd	d1, d1, d2
  71084c:	fsub	d1, d1, d3
  710850:	fneg	d0, d1
  710854:	fcsel	d0, d0, d1, eq	// eq = none
  710858:	ret
  71085c:	nop

0000000000710860 <EncrpytLonLatA>:
  710860:	stp	x29, x30, [sp, #-80]!
  710864:	mov	x0, #0xc00000000000        	// #211106232532992
  710868:	movk	x0, #0x4072, lsl #48
  71086c:	mov	x29, sp
  710870:	stp	d14, d15, [sp, #64]
  710874:	fmul	d15, d0, d0
  710878:	fmov	d14, d1
  71087c:	stp	d12, d13, [sp, #48]
  710880:	fmov	d13, x0
  710884:	fmov	d12, d0
  710888:	fcmp	d15, #0.0
  71088c:	stp	d8, d9, [sp, #16]
  710890:	fmov	d8, #2.000000000000000000e+00
  710894:	fadd	d13, d0, d13
  710898:	stp	d10, d11, [sp, #32]
  71089c:	fmadd	d13, d1, d8, d13
  7108a0:	fsqrt	d9, d15
  7108a4:	b.mi	7109b8 <EncrpytLonLatA+0x158>  // b.first
  7108a8:	fsqrt	d8, d9
  7108ac:	fcmp	d9, #0.0
  7108b0:	b.mi	7109c4 <EncrpytLonLatA+0x164>  // b.first
  7108b4:	fmov	d0, #6.000000000000000000e+00
  7108b8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7108bc:	fmov	d10, #3.000000000000000000e+00
  7108c0:	fmul	d0, d12, d0
  7108c4:	ldr	d1, [x0, #1960]
  7108c8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7108cc:	fmul	d9, d12, d1
  7108d0:	ldr	d11, [x0, #3352]
  7108d4:	fmul	d0, d0, d1
  7108d8:	bl	5935e0 <sin@plt>
  7108dc:	fmul	d14, d12, d14
  7108e0:	fmov	d2, #1.000000000000000000e+01
  7108e4:	fmov	d3, d0
  7108e8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7108ec:	fadd	d12, d12, d12
  7108f0:	fdiv	d8, d8, d2
  7108f4:	fdiv	d15, d15, d2
  7108f8:	ldr	d1, [x0, #1960]
  7108fc:	fdiv	d14, d14, d2
  710900:	fmul	d0, d12, d1
  710904:	fadd	d8, d8, d13
  710908:	fadd	d8, d8, d15
  71090c:	fadd	d8, d8, d14
  710910:	fmadd	d8, d3, d11, d8
  710914:	bl	710730 <encrpytTL>
  710918:	fmov	d1, d0
  71091c:	fmov	d0, d9
  710920:	fmadd	d8, d1, d11, d8
  710924:	bl	5935e0 <sin@plt>
  710928:	fmov	d11, d0
  71092c:	fdiv	d0, d9, d10
  710930:	bl	5935e0 <sin@plt>
  710934:	mov	x0, #0x4044000000000000    	// #4630826316843712512
  710938:	fmov	d1, x0
  71093c:	fmov	d3, #2.000000000000000000e+01
  710940:	fmov	d2, #1.200000000000000000e+01
  710944:	fmul	d1, d0, d1
  710948:	fdiv	d0, d9, d2
  71094c:	fmadd	d1, d11, d3, d1
  710950:	fadd	d1, d1, d1
  710954:	fdiv	d1, d1, d10
  710958:	fadd	d8, d1, d8
  71095c:	bl	5935e0 <sin@plt>
  710960:	fmov	d1, d0
  710964:	fmov	d0, #3.000000000000000000e+01
  710968:	fdiv	d0, d9, d0
  71096c:	fmov	d9, d1
  710970:	bl	5935e0 <sin@plt>
  710974:	mov	x0, #0xc00000000000        	// #211106232532992
  710978:	movk	x0, #0x4072, lsl #48
  71097c:	fmov	d1, x0
  710980:	mov	x0, #0xc00000000000        	// #211106232532992
  710984:	movk	x0, #0x4062, lsl #48
  710988:	fmov	d2, x0
  71098c:	fmul	d1, d0, d1
  710990:	fmadd	d0, d9, d2, d1
  710994:	ldp	d12, d13, [sp, #48]
  710998:	ldp	d14, d15, [sp, #64]
  71099c:	fadd	d0, d0, d0
  7109a0:	fdiv	d0, d0, d10
  7109a4:	ldp	d10, d11, [sp, #32]
  7109a8:	fadd	d0, d0, d8
  7109ac:	ldp	d8, d9, [sp, #16]
  7109b0:	ldp	x29, x30, [sp], #80
  7109b4:	ret
  7109b8:	fmov	d0, d15
  7109bc:	bl	593cc0 <sqrt@plt>
  7109c0:	b	7108a8 <EncrpytLonLatA+0x48>
  7109c4:	fmov	d0, d9
  7109c8:	bl	593cc0 <sqrt@plt>
  7109cc:	b	7108b4 <EncrpytLonLatA+0x54>

00000000007109d0 <EncrpytLonLatB>:
  7109d0:	stp	x29, x30, [sp, #-96]!
  7109d4:	mov	x0, #0x4059000000000000    	// #4636737291354636288
  7109d8:	mov	x29, sp
  7109dc:	stp	d12, d13, [sp, #48]
  7109e0:	fmov	d12, d0
  7109e4:	fmul	d0, d0, d0
  7109e8:	fmov	d13, x0
  7109ec:	stp	d8, d9, [sp, #16]
  7109f0:	fmov	d8, #3.000000000000000000e+00
  7109f4:	fadd	d2, d12, d12
  7109f8:	stp	d10, d11, [sp, #32]
  7109fc:	fcmp	d0, #0.0
  710a00:	fsqrt	d9, d0
  710a04:	stp	d14, d15, [sp, #64]
  710a08:	fmov	d14, d1
  710a0c:	fsub	d13, d2, d13
  710a10:	fmadd	d13, d1, d8, d13
  710a14:	b.mi	710b28 <EncrpytLonLatB+0x158>  // b.first
  710a18:	fsqrt	d8, d9
  710a1c:	fcmp	d9, #0.0
  710a20:	b.mi	710b38 <EncrpytLonLatB+0x168>  // b.first
  710a24:	fmov	d0, #6.000000000000000000e+00
  710a28:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710a2c:	fmov	d9, #3.000000000000000000e+00
  710a30:	str	d2, [sp, #88]
  710a34:	fmul	d0, d12, d0
  710a38:	ldr	d15, [x0, #1960]
  710a3c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710a40:	fmul	d10, d14, d15
  710a44:	ldr	d11, [x0, #3352]
  710a48:	fmul	d0, d0, d15
  710a4c:	bl	5935e0 <sin@plt>
  710a50:	fadd	d1, d14, d14
  710a54:	fadd	d8, d8, d8
  710a58:	ldr	d2, [sp, #88]
  710a5c:	fmov	d3, #1.000000000000000000e+01
  710a60:	fmov	d4, d0
  710a64:	fmul	d12, d12, d14
  710a68:	fmul	d0, d2, d15
  710a6c:	fmul	d14, d1, d14
  710a70:	fdiv	d2, d8, d3
  710a74:	fdiv	d12, d12, d3
  710a78:	fdiv	d14, d14, d3
  710a7c:	fadd	d8, d2, d13
  710a80:	fadd	d8, d8, d14
  710a84:	fadd	d8, d8, d12
  710a88:	fmadd	d8, d4, d11, d8
  710a8c:	bl	710730 <encrpytTL>
  710a90:	fmov	d1, d0
  710a94:	fmov	d0, d10
  710a98:	fmadd	d8, d1, d11, d8
  710a9c:	bl	5935e0 <sin@plt>
  710aa0:	fmov	d11, d0
  710aa4:	fdiv	d0, d10, d9
  710aa8:	bl	5935e0 <sin@plt>
  710aac:	fmov	d1, d0
  710ab0:	fmov	d0, #1.200000000000000000e+01
  710ab4:	mov	x0, #0x4044000000000000    	// #4630826316843712512
  710ab8:	fmov	d2, x0
  710abc:	fmov	d3, #2.000000000000000000e+01
  710ac0:	fdiv	d0, d10, d0
  710ac4:	fmul	d1, d1, d2
  710ac8:	fmadd	d11, d11, d3, d1
  710acc:	bl	5935e0 <sin@plt>
  710ad0:	fadd	d11, d11, d11
  710ad4:	mov	x0, #0x4074000000000000    	// #4644337115725824000
  710ad8:	fmov	d1, x0
  710adc:	fmov	d2, #3.000000000000000000e+01
  710ae0:	fmul	d1, d0, d1
  710ae4:	fdiv	d11, d11, d9
  710ae8:	fdiv	d0, d10, d2
  710aec:	fdiv	d1, d1, d9
  710af0:	fadd	d8, d11, d8
  710af4:	fadd	d8, d8, d1
  710af8:	bl	5935e0 <sin@plt>
  710afc:	mov	x0, #0x4084000000000000    	// #4648840715353194496
  710b00:	fmov	d1, x0
  710b04:	ldp	d10, d11, [sp, #32]
  710b08:	fmul	d0, d0, d1
  710b0c:	ldp	d12, d13, [sp, #48]
  710b10:	ldp	d14, d15, [sp, #64]
  710b14:	fdiv	d0, d0, d9
  710b18:	fadd	d0, d0, d8
  710b1c:	ldp	d8, d9, [sp, #16]
  710b20:	ldp	x29, x30, [sp], #96
  710b24:	ret
  710b28:	str	d2, [sp, #88]
  710b2c:	bl	593cc0 <sqrt@plt>
  710b30:	ldr	d2, [sp, #88]
  710b34:	b	710a18 <EncrpytLonLatB+0x48>
  710b38:	fmov	d0, d9
  710b3c:	str	d2, [sp, #88]
  710b40:	bl	593cc0 <sqrt@plt>
  710b44:	ldr	d2, [sp, #88]
  710b48:	b	710a24 <EncrpytLonLatB+0x54>
  710b4c:	nop

0000000000710b50 <getZJValue>:
  710b50:	stp	x29, x30, [sp, #-16]!
  710b54:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710b58:	mov	x29, sp
  710b5c:	ldr	d1, [x0, #3360]
  710b60:	fmul	d0, d0, d1
  710b64:	bl	710730 <encrpytTL>
  710b68:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  710b6c:	fmov	d2, #1.000000000000000000e+00
  710b70:	ldp	x29, x30, [sp], #16
  710b74:	ldr	d1, [x0, #3368]
  710b78:	fmul	d1, d0, d1
  710b7c:	fmsub	d0, d0, d1, d2
  710b80:	ret
  710b84:	nop
