
mapenv_02changsha.bin:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

0000000000597078 <main>:
  597078:	stp	x29, x30, [sp, #-432]!
  59707c:	mov	x29, sp
  597080:	stp	x25, x26, [sp, #64]
  597084:	adrp	x25, b12000 <google::protobuf::util::Status::OK@@Base-0x14920>
  597088:	ldr	x2, [x25, #3688]
  59708c:	stp	x23, x24, [sp, #48]
  597090:	mov	w24, w0
  597094:	ldr	x0, [x2]
  597098:	str	x0, [sp, #424]
  59709c:	mov	x0, #0x0                   	// #0
  5970a0:	add	x23, sp, #0xd0
  5970a4:	mov	w0, #0x1                   	// #1
  5970a8:	stp	x19, x20, [sp, #16]
  5970ac:	add	x20, sp, #0xb0
  5970b0:	mov	x19, x1
  5970b4:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  5970b8:	add	x1, x1, #0x3b8
  5970bc:	stp	x21, x22, [sp, #32]
  5970c0:	add	x21, sp, #0x70
  5970c4:	add	x22, sp, #0x90
  5970c8:	stp	x27, x28, [sp, #80]
  5970cc:	bl	594e90 <__printf_chk@plt>
  5970d0:	add	x3, x21, #0x10
  5970d4:	add	x2, x22, #0x10
  5970d8:	add	x1, x20, #0x10
  5970dc:	add	x0, x23, #0x10
  5970e0:	stp	x3, xzr, [sp, #112]
  5970e4:	cmp	w24, #0x4
  5970e8:	strb	wzr, [sp, #128]
  5970ec:	stp	x2, xzr, [sp, #144]
  5970f0:	strb	wzr, [sp, #160]
  5970f4:	stp	x1, xzr, [sp, #176]
  5970f8:	strb	wzr, [sp, #192]
  5970fc:	stp	x0, xzr, [sp, #208]
  597100:	strb	wzr, [sp, #224]
  597104:	b.le	597664 <main+0x5ec>
  597108:	ldr	x1, [x19, #8]
  59710c:	mov	x0, x21
  597110:	bl	5933b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@plt>
  597114:	ldr	x1, [x19, #16]
  597118:	mov	x0, x22
  59711c:	bl	5933b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@plt>
  597120:	ldr	x0, [x19, #24]
  597124:	mov	x1, #0x0                   	// #0
  597128:	mov	w2, #0xa                   	// #10
  59712c:	bl	595120 <strtol@plt>
  597130:	mov	x26, x0
  597134:	ldr	x1, [x19, #32]
  597138:	mov	x0, x20
  59713c:	bl	5933b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@plt>
  597140:	ldr	x1, [x19, #40]
  597144:	mov	x0, x23
  597148:	bl	5933b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@plt>
  59714c:	adrp	x3, 9ae000 <__libc_csu_init+0x38>
  597150:	add	x3, x3, #0x3d8
  597154:	ldp	x1, x2, [sp, #144]
  597158:	add	x24, sp, #0xf0
  59715c:	ldrh	w5, [x3, #8]
  597160:	add	x19, sp, #0x110
  597164:	ldr	x7, [x3]
  597168:	add	x4, x24, #0x10
  59716c:	add	x6, x19, #0x10
  597170:	mov	x8, #0xa                   	// #10
  597174:	stp	x4, x8, [sp, #240]
  597178:	mov	x0, x19
  59717c:	add	x2, x1, x2
  597180:	str	x7, [sp, #256]
  597184:	mov	w3, #0x0                   	// #0
  597188:	strb	wzr, [sp, #266]
  59718c:	strh	w5, [x24, #24]
  597190:	str	x6, [sp, #272]
  597194:	bl	5a0b80 <void std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct<char*>(char*, char*, std::forward_iterator_tag)>
  597198:	mov	w2, w26
  59719c:	mov	x1, x19
  5971a0:	mov	x0, x24
  5971a4:	bl	724070 <fusnloc::utils::initLogModule(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, int)>
  5971a8:	ldr	x0, [sp, #272]
  5971ac:	add	x1, x19, #0x10
  5971b0:	cmp	x0, x1
  5971b4:	b.eq	5971bc <main+0x144>  // b.none
  5971b8:	bl	593a40 <operator delete(void*)@plt>
  5971bc:	ldr	x0, [sp, #240]
  5971c0:	add	x1, x24, #0x10
  5971c4:	cmp	x0, x1
  5971c8:	b.eq	5971d0 <main+0x158>  // b.none
  5971cc:	bl	593a40 <operator delete(void*)@plt>
  5971d0:	bl	711b58 <fusnloc::getSetting()>
  5971d4:	ldp	x1, x2, [sp, #112]
  5971d8:	add	x4, x19, #0x10
  5971dc:	mov	x26, x0
  5971e0:	mov	w3, #0x0                   	// #0
  5971e4:	mov	x0, x19
  5971e8:	str	x4, [sp, #272]
  5971ec:	add	x2, x1, x2
  5971f0:	bl	5a0b80 <void std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct<char*>(char*, char*, std::forward_iterator_tag)>
  5971f4:	mov	x1, x19
  5971f8:	mov	x0, x26
  5971fc:	bl	7140f0 <fusnloc::Settings::load(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
  597200:	ldr	x2, [sp, #272]
  597204:	add	x1, x19, #0x10
  597208:	and	w26, w0, #0xff
  59720c:	cmp	x2, x1
  597210:	b.eq	59721c <main+0x1a4>  // b.none
  597214:	mov	x0, x2
  597218:	bl	593a40 <operator delete(void*)@plt>
  59721c:	cbz	w26, 597528 <main+0x4b0>
  597220:	adrp	x26, b21000 <casm_elev+0xa1d0>
  597224:	add	x0, x26, #0xfb0
  597228:	ldarb	w1, [x0]
  59722c:	tbz	w1, #0, 5974f0 <main+0x478>
  597230:	ldr	x0, [sp, #184]
  597234:	cbz	x0, 59742c <main+0x3b4>
  597238:	adrp	x0, b21000 <casm_elev+0xa1d0>
  59723c:	mov	x1, x20
  597240:	add	x0, x0, #0xfb8
  597244:	bl	727a30 <horizon::ndm::EhrConfig::LoadConfigYamlFile(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
  597248:	add	x26, sp, #0x60
  59724c:	tst	w0, #0xff
  597250:	b.eq	5975c4 <main+0x54c>  // b.none
  597254:	adrp	x27, 9ae000 <__libc_csu_init+0x38>
  597258:	mov	x0, x26
  59725c:	add	x1, x27, #0x110
  597260:	mov	w2, #0x69                  	// #105
  597264:	bl	99f7d0 <google::LogMessage::LogMessage(char const*, int)>
  597268:	mov	x0, x26
  59726c:	bl	99f010 <google::LogMessage::stream()>
  597270:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  597274:	mov	x28, x0
  597278:	add	x1, x1, #0x340
  59727c:	mov	x2, #0x28                  	// #40
  597280:	bl	5940a0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
  597284:	ldp	x1, x2, [sp, #176]
  597288:	mov	x0, x28
  59728c:	bl	5940a0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
  597290:	mov	x0, x26
  597294:	bl	99fc20 <google::LogMessage::~LogMessage()>
  597298:	adrp	x1, 59d000 <register_tm_clones+0x38>
  59729c:	add	x1, x1, #0x40
  5972a0:	mov	w0, #0x2                   	// #2
  5972a4:	bl	594fc0 <signal@plt>
  5972a8:	add	x0, x19, #0x8
  5972ac:	bl	594470 <sigemptyset@plt>
  5972b0:	adrp	x3, 59d000 <register_tm_clones+0x38>
  5972b4:	add	x3, x3, #0x260
  5972b8:	mov	w4, #0x4                   	// #4
  5972bc:	mov	x1, x19
  5972c0:	mov	x2, #0x0                   	// #0
  5972c4:	mov	w0, #0xb                   	// #11
  5972c8:	str	x3, [sp, #272]
  5972cc:	str	w4, [sp, #408]
  5972d0:	bl	593f50 <sigaction@plt>
  5972d4:	tbnz	w0, #31, 597564 <main+0x4ec>
  5972d8:	bl	59ee48 <fusnloc::FusionProc::getInstance()>
  5972dc:	ldp	x1, x2, [sp, #112]
  5972e0:	add	x4, x24, #0x10
  5972e4:	mov	x19, x0
  5972e8:	mov	w3, #0x0                   	// #0
  5972ec:	mov	x0, x24
  5972f0:	str	x4, [sp, #240]
  5972f4:	add	x2, x1, x2
  5972f8:	bl	5a0b80 <void std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct<char*>(char*, char*, std::forward_iterator_tag)>
  5972fc:	bl	711b58 <fusnloc::getSetting()>
  597300:	mov	x2, x0
  597304:	mov	x1, x24
  597308:	mov	x0, x19
  59730c:	ldr	x2, [x2, #312]
  597310:	bl	705140 <fusnloc::FusionProc::procStart(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, char const*)>
  597314:	ldr	x2, [sp, #240]
  597318:	add	x1, x24, #0x10
  59731c:	and	w19, w0, #0xff
  597320:	cmp	x2, x1
  597324:	b.eq	597330 <main+0x2b8>  // b.none
  597328:	mov	x0, x2
  59732c:	bl	593a40 <operator delete(void*)@plt>
  597330:	cbz	w19, 597598 <main+0x520>
  597334:	bl	59eed0 <fusnloc::DataReceiver::getInstance()>
  597338:	mov	x19, x0
  59733c:	bl	711b58 <fusnloc::getSetting()>
  597340:	ldr	x28, [x0, #184]
  597344:	bl	711b58 <fusnloc::getSetting()>
  597348:	mov	x2, x0
  59734c:	mov	x1, x28
  597350:	mov	x0, x19
  597354:	ldr	x2, [x2, #216]
  597358:	bl	5a1698 <fusnloc::DataReceiver::init(char const*, char const*)>
  59735c:	tst	w0, #0xff
  597360:	b.eq	597608 <main+0x590>  // b.none
  597364:	bl	711b58 <fusnloc::getSetting()>
  597368:	ldrb	w0, [x0, #179]
  59736c:	cbz	w0, 597374 <main+0x2fc>
  597370:	bl	59d818 <engineInit()>
  597374:	bl	711b58 <fusnloc::getSetting()>
  597378:	ldrb	w0, [x0, #178]
  59737c:	cbz	w0, 5973c8 <main+0x350>
  597380:	ldp	x1, x2, [sp, #176]
  597384:	add	x4, x24, #0x10
  597388:	mov	x0, x24
  59738c:	mov	w3, #0x0                   	// #0
  597390:	str	x4, [sp, #240]
  597394:	add	x2, x1, x2
  597398:	bl	5a0b80 <void std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct<char*>(char*, char*, std::forward_iterator_tag)>
  59739c:	mov	x0, x24
  5973a0:	bl	59dc08 <ehorizonInit(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
  5973a4:	ldr	x1, [sp, #240]
  5973a8:	add	x24, x24, #0x10
  5973ac:	mov	w19, w0
  5973b0:	cmp	x1, x24
  5973b4:	b.eq	5973c0 <main+0x348>  // b.none
  5973b8:	mov	x0, x1
  5973bc:	bl	593a40 <operator delete(void*)@plt>
  5973c0:	cmp	w19, #0x1
  5973c4:	b.ne	597634 <main+0x5bc>  // b.any
  5973c8:	adrp	x19, 59d000 <register_tm_clones+0x38>
  5973cc:	add	x19, x19, #0x750
  5973d0:	mov	x1, x19
  5973d4:	mov	w0, #0x2                   	// #2
  5973d8:	mov	w24, #0x4240                	// #16960
  5973dc:	bl	594fc0 <signal@plt>
  5973e0:	mov	x1, x19
  5973e4:	mov	w0, #0xf                   	// #15
  5973e8:	adrp	x19, b13000 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@GLIBCXX_3.4.21>
  5973ec:	movk	w24, #0xf, lsl #16
  5973f0:	add	x19, x19, #0xf60
  5973f4:	bl	594fc0 <signal@plt>
  5973f8:	b	59740c <main+0x394>
  5973fc:	ldrb	w0, [x19, #1]
  597400:	cbz	w0, 597414 <main+0x39c>
  597404:	mov	w0, w24
  597408:	bl	595210 <usleep@plt>
  59740c:	ldrb	w0, [x19]
  597410:	cbnz	w0, 5973fc <main+0x384>
  597414:	bl	59ee48 <fusnloc::FusionProc::getInstance()>
  597418:	bl	7054f0 <fusnloc::FusionProc::stop()>
  59741c:	bl	59eed0 <fusnloc::DataReceiver::getInstance()>
  597420:	bl	5a1510 <fusnloc::DataReceiver::stop()>
  597424:	mov	w19, #0x0                   	// #0
  597428:	b	597468 <main+0x3f0>
  59742c:	add	x26, sp, #0x60
  597430:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  597434:	mov	x0, x26
  597438:	add	x1, x1, #0x110
  59743c:	mov	w3, #0x2                   	// #2
  597440:	mov	w2, #0x61                  	// #97
  597444:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  597448:	mov	x0, x26
  59744c:	bl	99f010 <google::LogMessage::stream()>
  597450:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  597454:	add	x1, x1, #0x2e8
  597458:	bl	594990 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
  59745c:	mov	x0, x26
  597460:	mov	w19, #0x1                   	// #1
  597464:	bl	99fc20 <google::LogMessage::~LogMessage()>
  597468:	ldr	x0, [sp, #208]
  59746c:	add	x23, x23, #0x10
  597470:	cmp	x0, x23
  597474:	b.eq	59747c <main+0x404>  // b.none
  597478:	bl	593a40 <operator delete(void*)@plt>
  59747c:	ldr	x0, [sp, #176]
  597480:	add	x20, x20, #0x10
  597484:	cmp	x0, x20
  597488:	b.eq	597490 <main+0x418>  // b.none
  59748c:	bl	593a40 <operator delete(void*)@plt>
  597490:	ldr	x0, [sp, #144]
  597494:	add	x22, x22, #0x10
  597498:	cmp	x0, x22
  59749c:	b.eq	5974a4 <main+0x42c>  // b.none
  5974a0:	bl	593a40 <operator delete(void*)@plt>
  5974a4:	ldr	x0, [sp, #112]
  5974a8:	add	x21, x21, #0x10
  5974ac:	cmp	x0, x21
  5974b0:	b.eq	5974b8 <main+0x440>  // b.none
  5974b4:	bl	593a40 <operator delete(void*)@plt>
  5974b8:	ldr	x25, [x25, #3688]
  5974bc:	ldr	x0, [sp, #424]
  5974c0:	ldr	x1, [x25]
  5974c4:	subs	x0, x0, x1
  5974c8:	mov	x1, #0x0                   	// #0
  5974cc:	b.ne	597660 <main+0x5e8>  // b.any
  5974d0:	mov	w0, w19
  5974d4:	ldp	x19, x20, [sp, #16]
  5974d8:	ldp	x21, x22, [sp, #32]
  5974dc:	ldp	x23, x24, [sp, #48]
  5974e0:	ldp	x25, x26, [sp, #64]
  5974e4:	ldp	x27, x28, [sp, #80]
  5974e8:	ldp	x29, x30, [sp], #432
  5974ec:	ret
  5974f0:	bl	594540 <__cxa_guard_acquire@plt>
  5974f4:	cbz	w0, 597230 <main+0x1b8>
  5974f8:	adrp	x27, b21000 <casm_elev+0xa1d0>
  5974fc:	add	x0, x27, #0xfb8
  597500:	bl	727808 <horizon::ndm::EhrConfig::EhrConfig()>
  597504:	add	x0, x26, #0xfb0
  597508:	bl	594940 <__cxa_guard_release@plt>
  59750c:	add	x1, x27, #0xfb8
  597510:	adrp	x2, b13000 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::assign(char const*)@GLIBCXX_3.4.21>
  597514:	adrp	x0, 59e000 <ehorizonInit(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)+0x3f8>
  597518:	add	x2, x2, #0xf58
  59751c:	add	x0, x0, #0x688
  597520:	bl	594cf0 <__cxa_atexit@plt>
  597524:	b	597230 <main+0x1b8>
  597528:	add	x26, sp, #0x60
  59752c:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  597530:	mov	x0, x26
  597534:	add	x1, x1, #0x110
  597538:	mov	w2, #0x5a                  	// #90
  59753c:	bl	99f7d0 <google::LogMessage::LogMessage(char const*, int)>
  597540:	mov	x0, x26
  597544:	bl	99f010 <google::LogMessage::stream()>
  597548:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  59754c:	add	x1, x1, #0x3e8
  597550:	bl	594990 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
  597554:	mov	x0, x26
  597558:	mov	w19, #0xffffffff            	// #-1
  59755c:	bl	99fc20 <google::LogMessage::~LogMessage()>
  597560:	b	597468 <main+0x3f0>
  597564:	add	x1, x27, #0x110
  597568:	mov	x0, x26
  59756c:	mov	w3, #0x1                   	// #1
  597570:	mov	w2, #0x78                  	// #120
  597574:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  597578:	mov	x0, x26
  59757c:	bl	99f010 <google::LogMessage::stream()>
  597580:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  597584:	add	x1, x1, #0x410
  597588:	bl	594990 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
  59758c:	mov	x0, x26
  597590:	bl	99fc20 <google::LogMessage::~LogMessage()>
  597594:	b	5972d8 <main+0x260>
  597598:	add	x1, x27, #0x110
  59759c:	mov	x0, x26
  5975a0:	mov	w3, #0x2                   	// #2
  5975a4:	mov	w2, #0x7d                  	// #125
  5975a8:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  5975ac:	mov	x0, x26
  5975b0:	bl	99f010 <google::LogMessage::stream()>
  5975b4:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  5975b8:	add	x1, x1, #0x430
  5975bc:	bl	594990 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
  5975c0:	b	597554 <main+0x4dc>
  5975c4:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  5975c8:	mov	x0, x26
  5975cc:	add	x1, x1, #0x110
  5975d0:	mov	w3, #0x2                   	// #2
  5975d4:	mov	w2, #0x65                  	// #101
  5975d8:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  5975dc:	mov	x0, x26
  5975e0:	bl	99f010 <google::LogMessage::stream()>
  5975e4:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  5975e8:	mov	x19, x0
  5975ec:	add	x1, x1, #0x318
  5975f0:	mov	x2, #0x27                  	// #39
  5975f4:	bl	5940a0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
  5975f8:	ldp	x1, x2, [sp, #176]
  5975fc:	mov	x0, x19
  597600:	bl	5940a0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
  597604:	b	59745c <main+0x3e4>
  597608:	add	x1, x27, #0x110
  59760c:	mov	x0, x26
  597610:	mov	w3, #0x2                   	// #2
  597614:	mov	w2, #0x83                  	// #131
  597618:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  59761c:	mov	x0, x26
  597620:	bl	99f010 <google::LogMessage::stream()>
  597624:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  597628:	add	x1, x1, #0x448
  59762c:	bl	594990 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
  597630:	b	597554 <main+0x4dc>
  597634:	add	x1, x27, #0x110
  597638:	mov	x0, x26
  59763c:	mov	w3, #0x2                   	// #2
  597640:	mov	w2, #0x8f                  	// #143
  597644:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  597648:	mov	x0, x26
  59764c:	bl	99f010 <google::LogMessage::stream()>
  597650:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  597654:	add	x1, x1, #0x468
  597658:	bl	594990 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
  59765c:	b	597554 <main+0x4dc>
  597660:	bl	595150 <__stack_chk_fail@plt>
  597664:	add	x26, sp, #0x60
  597668:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  59766c:	mov	x0, x26
  597670:	add	x1, x1, #0x110
  597674:	mov	w3, #0x2                   	// #2
  597678:	mov	w2, #0x4b                  	// #75
  59767c:	bl	99f7f8 <google::LogMessage::LogMessage(char const*, int, int)>
  597680:	mov	x0, x26
  597684:	bl	99f010 <google::LogMessage::stream()>
  597688:	adrp	x1, 9ae000 <__libc_csu_init+0x38>
  59768c:	add	x1, x1, #0x3c0
  597690:	bl	594990 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
  597694:	mov	x0, x26
  597698:	bl	99fc20 <google::LogMessage::~LogMessage()>
  59769c:	mov	w0, #0xffffffff            	// #-1
  5976a0:	bl	5944b0 <exit@plt>
  5976a4:	mov	x19, x0
  5976a8:	mov	x0, x26
  5976ac:	bl	99fc20 <google::LogMessage::~LogMessage()>
  5976b0:	ldr	x0, [sp, #208]
  5976b4:	add	x23, x23, #0x10
  5976b8:	cmp	x0, x23
  5976bc:	b.eq	5976c4 <main+0x64c>  // b.none
  5976c0:	bl	593a40 <operator delete(void*)@plt>
  5976c4:	ldr	x0, [sp, #176]
  5976c8:	add	x20, x20, #0x10
  5976cc:	cmp	x0, x20
  5976d0:	b.eq	5976d8 <main+0x660>  // b.none
  5976d4:	bl	593a40 <operator delete(void*)@plt>
  5976d8:	ldr	x0, [sp, #144]
  5976dc:	add	x22, x22, #0x10
  5976e0:	cmp	x0, x22
  5976e4:	b.eq	5976ec <main+0x674>  // b.none
  5976e8:	bl	593a40 <operator delete(void*)@plt>
  5976ec:	ldr	x0, [sp, #112]
  5976f0:	add	x21, x21, #0x10
  5976f4:	cmp	x0, x21
  5976f8:	b.eq	597700 <main+0x688>  // b.none
  5976fc:	bl	593a40 <operator delete(void*)@plt>
  597700:	mov	x0, x19
  597704:	bl	593bf0 <_Unwind_Resume@plt>
  597708:	b	5976a4 <main+0x62c>
  59770c:	mov	x19, x0
  597710:	b	5976b0 <main+0x638>
  597714:	b	5976a4 <main+0x62c>
  597718:	ldr	x1, [sp, #240]
  59771c:	add	x24, x24, #0x10
  597720:	mov	x19, x0
  597724:	cmp	x1, x24
  597728:	b.eq	5976b0 <main+0x638>  // b.none
  59772c:	mov	x0, x1
  597730:	bl	593a40 <operator delete(void*)@plt>
  597734:	b	5976b0 <main+0x638>
  597738:	b	5976a4 <main+0x62c>
  59773c:	b	5976a4 <main+0x62c>
  597740:	b	5976a4 <main+0x62c>
  597744:	mov	x19, x0
  597748:	add	x0, x26, #0xfb0
  59774c:	bl	593810 <__cxa_guard_abort@plt>
  597750:	b	5976b0 <main+0x638>
  597754:	b	5976a4 <main+0x62c>
  597758:	ldr	x1, [sp, #272]
  59775c:	add	x2, x19, #0x10
  597760:	mov	x19, x0
  597764:	cmp	x1, x2
  597768:	b.eq	597774 <main+0x6fc>  // b.none
  59776c:	mov	x0, x1
  597770:	bl	593a40 <operator delete(void*)@plt>
  597774:	ldr	x0, [sp, #240]
  597778:	add	x24, x24, #0x10
  59777c:	cmp	x0, x24
  597780:	b.eq	5976b0 <main+0x638>  // b.none
  597784:	bl	593a40 <operator delete(void*)@plt>
  597788:	b	5976b0 <main+0x638>
  59778c:	mov	x19, x0
  597790:	b	597774 <main+0x6fc>
  597794:	ldr	x1, [sp, #272]
  597798:	add	x19, x19, #0x10
  59779c:	mov	x24, x0
  5977a0:	cmp	x1, x19
  5977a4:	b.eq	5977b0 <main+0x738>  // b.none
  5977a8:	mov	x0, x1
  5977ac:	bl	593a40 <operator delete(void*)@plt>
  5977b0:	mov	x19, x24
  5977b4:	b	5976b0 <main+0x638>
  5977b8:	b	5976a4 <main+0x62c>
  5977bc:	b	597718 <main+0x6a0>
  5977c0:	b	5976a4 <main+0x62c>

Disassembly of section .fini:
