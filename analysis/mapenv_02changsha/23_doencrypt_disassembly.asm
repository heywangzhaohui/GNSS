
mapenv_02changsha.bin:     file format elf64-littleaarch64


Disassembly of section .text:

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
  711900:	fmul	d8, d8, d0
  711904:	fmadd	d11, d1, d11, d8
  711908:	mov	x0, #0x6a0000000000        	// #116548232544256
  71190c:	fmov	d3, #1.000000000000000000e+01
  711910:	movk	x0, #0x40f8, lsl #48
  711914:	fmov	d0, x0
  711918:	mov	x0, #0x848000000000        	// #145685290680320
  71191c:	fmul	d0, d10, d0
  711920:	movk	x0, #0x412e, lsl #48
  711924:	fmov	d2, x0
  711928:	adrp	x0, 9b4000 <grpc_stats_histo_buckets+0x2a0>
  71192c:	fmul	d2, d10, d2
  711930:	ldr	d9, [x0, #3704]
  711934:	fcvtzs	w0, d0
  711938:	fcvtzs	w1, d2
  71193c:	scvtf	d0, w0
  711940:	scvtf	d1, w1
  711944:	fmul	d3, d0, d3
  711948:	fsub	d2, d2, d1
  71194c:	fsub	d1, d1, d3
  711950:	fmul	d2, d2, d9
  711954:	fcvtzs	w0, d1
  711958:	cmp	w0, #0x4
  71195c:	b.gt	711aa4 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x444>
  711960:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711964:	fadd	d2, d0, d2
  711968:	ldr	d9, [x0, #3312]
  71196c:	fmul	d9, d2, d9
  711970:	mov	x0, #0x400000000000        	// #70368744177664
  711974:	mov	x1, #0x800000000000        	// #140737488355328
  711978:	movk	x0, #0x405a, lsl #48
  71197c:	movk	x1, #0x4041, lsl #48
  711980:	fmov	d10, x0
  711984:	fmov	d12, x1
  711988:	fsub	d10, d11, d10
  71198c:	fsub	d12, d9, d12
  711990:	fmov	d0, d10
  711994:	fmov	d1, d12
  711998:	bl	710860 <EncrpytLonLatA>
  71199c:	fmov	d8, d0
  7119a0:	fmov	d1, d12
  7119a4:	fmov	d0, d10
  7119a8:	bl	7109d0 <EncrpytLonLatB>
  7119ac:	fmov	d12, d0
  7119b0:	fmov	d1, d9
  7119b4:	fmov	d0, d11
  7119b8:	bl	710530 <Elev_Inter>
  7119bc:	fmov	d1, d0
  7119c0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7119c4:	ldr	d13, [x0, #3360]
  7119c8:	adrp	x0, 9ae000 <__libc_csu_init+0x38>
  7119cc:	ldr	d10, [x0, #2272]
  7119d0:	fmul	d13, d9, d13
  7119d4:	fmadd	d8, d1, d10, d8
  7119d8:	fmadd	d12, d1, d10, d12
  7119dc:	fmov	d0, d13
  7119e0:	bl	710730 <encrpytTL>
  7119e4:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  7119e8:	fmov	d1, #1.000000000000000000e+00
  7119ec:	ldr	d10, [x0, #3368]
  7119f0:	fmul	d10, d0, d10
  7119f4:	fmsub	d10, d0, d10, d1
  7119f8:	fsqrt	d14, d10
  7119fc:	fcmp	d10, #0.0
  711a00:	b.mi	711acc <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x46c>  // b.first
  711a04:	fmov	d0, d13
  711a08:	bl	594770 <cos@plt>
  711a0c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711a10:	ldr	d1, [x0, #3376]
  711a14:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711a18:	ldr	d4, [x0, #1960]
  711a1c:	mov	x0, #0x800000000000        	// #140737488355328
  711a20:	fdiv	d1, d1, d14
  711a24:	movk	x0, #0x4066, lsl #48
  711a28:	fmov	d2, x0
  711a2c:	mov	x0, #0x200000000000        	// #35184372088832
  711a30:	movk	x0, #0x414c, lsl #48
  711a34:	fmov	d3, x0
  711a38:	fmul	d8, d8, d2
  711a3c:	fmul	d12, d12, d2
  711a40:	fmul	d10, d12, d10
  711a44:	fmul	d1, d1, d0
  711a48:	fmul	d1, d1, d4
  711a4c:	fdiv	d8, d8, d1
  711a50:	fadd	d8, d8, d11
  711a54:	fmul	d8, d8, d3
  711a58:	fcvtzu	w19, d8
  711a5c:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711a60:	fmul	d10, d14, d10
  711a64:	ucvtf	d0, w19
  711a68:	ldr	d2, [x0, #3384]
  711a6c:	mov	x0, #0x200000000000        	// #35184372088832
  711a70:	movk	x0, #0x414c, lsl #48
  711a74:	fmov	d1, x0
  711a78:	fdiv	d10, d10, d2
  711a7c:	fadd	d9, d10, d9
  711a80:	fmul	d9, d9, d1
  711a84:	fcvtzu	w0, d9
  711a88:	ucvtf	d1, w0
  711a8c:	b	7117c4 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x164>
  711a90:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711a94:	fadd	d8, d0, d8
  711a98:	ldr	d1, [x0, #3312]
  711a9c:	fmul	d11, d8, d1
  711aa0:	b	711908 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x2a8>
  711aa4:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711aa8:	fmov	d1, #5.000000000000000000e+00
  711aac:	ldr	d0, [x0, #3312]
  711ab0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711ab4:	fadd	d3, d3, d1
  711ab8:	ldr	d9, [x0, #3320]
  711abc:	fmul	d2, d2, d0
  711ac0:	fmadd	d9, d3, d9, d2
  711ac4:	b	711970 <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x310>
  711ac8:	bl	595150 <__stack_chk_fail@plt>
  711acc:	fmov	d0, d10
  711ad0:	bl	593cc0 <sqrt@plt>
  711ad4:	fmov	d0, d13
  711ad8:	bl	594770 <cos@plt>
  711adc:	fmov	d5, d0
  711ae0:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711ae4:	ldr	d2, [x0, #3376]
  711ae8:	adrp	x0, 9d1000 <google::protobuf::internal::utf8acceptnonsurrogates+0x890>
  711aec:	ldr	d4, [x0, #1960]
  711af0:	mov	x0, #0x800000000000        	// #140737488355328
  711af4:	fdiv	d2, d2, d14
  711af8:	movk	x0, #0x4066, lsl #48
  711afc:	fmov	d0, x0
  711b00:	mov	x0, #0x200000000000        	// #35184372088832
  711b04:	movk	x0, #0x414c, lsl #48
  711b08:	fmov	d3, x0
  711b0c:	fmul	d1, d8, d0
  711b10:	fmul	d12, d12, d0
  711b14:	fmov	d0, d10
  711b18:	fmul	d10, d12, d10
  711b1c:	fmul	d2, d2, d5
  711b20:	fmul	d2, d2, d4
  711b24:	fdiv	d1, d1, d2
  711b28:	fadd	d1, d1, d11
  711b2c:	fmul	d1, d1, d3
  711b30:	fcvtzu	w19, d1
  711b34:	bl	593cc0 <sqrt@plt>
  711b38:	b	711a5c <doEncrypt(long, double const&, double const&, double const&, double&, double&)+0x3fc>
  711b3c:	mov	x1, x0
  711b40:	mov	x0, x19
  711b44:	mov	x19, x1
  711b48:	bl	99fc20 <google::LogMessage::~LogMessage()>
  711b4c:	mov	x0, x19
  711b50:	bl	593bf0 <_Unwind_Resume@plt>
  711b54:	nop

0000000000711b58 <fusnloc::getSetting()>:
  711b58:	stp	x29, x30, [sp, #-80]!
  711b5c:	mov	x29, sp
  711b60:	stp	x19, x20, [sp, #16]
  711b64:	adrp	x19, b12000 <google::protobuf::util::Status::OK@@Base-0x14920>
  711b68:	adrp	x20, b27000 <google::protobuf::_EnumOptions_default_instance_+0x8>
  711b6c:	add	x0, x20, #0x8d8
  711b70:	ldr	x1, [x19, #3688]
  711b74:	ldrb	w0, [x0, #128]
  711b78:	ldr	x2, [x1]
  711b7c:	str	x2, [sp, #72]
