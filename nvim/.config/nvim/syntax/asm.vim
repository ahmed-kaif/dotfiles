" Vim syntax file
" Language:	Intel AT&T Assembler (GASM)
" quick mod on the default FASM to display comments. Added movl and addl

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword=a-z,A-Z,48-57,.,_
setlocal isident=a-z,A-Z,48-57,.,_
syn case ignore

syn keyword gasmRegister	ah al ax bh bl bp bx ch cl cr0 cr1 cr2 cr3 cr4 cr5 cr6
syn keyword gasmRegister	cr7 cs cx dh di dl dr0 dr1 dr2 dr3 dr4 dr5 dr6 dr7 ds dx
syn keyword gasmRegister	eax ebp ebx ecx edi edx es esi esp fs gs mm0 mm1 mm2 mm3
syn keyword gasmRegister	mm4 mm5 mm6 mm7 si sp ss st st0 st1 st2 st3 st4 st5 st6
syn keyword gasmRegister	st7 tr0 tr1 tr2 tr3 tr4 tr5 tr6 tr7 xmm0 xmm1 xmm2 xmm3
syn keyword gasmRegister	xmm4 xmm5 xmm6 xmm7
syn keyword gasmAddressSizes 	byte dqword dword fword pword qword tword word
syn keyword gasmDataDirectives 	db dd df dp dq dt du dw file rb rd rf rp rq rt rw
syn keyword gasmInstr 	aaa aad aam aas adc add addpd addps addsd addss addsubpd addl
syn keyword gasmInstr	addsubps and andnpd andnps andpd andps arpl bound bsf bsr
syn keyword gasmInstr	bswap bt btc btr bts call cbw cdq clc cld clflush cli clts
syn keyword gasmInstr	cmc cmova cmovae cmovb cmovbe cmovc cmove cmovg cmovge cmovl
syn keyword gasmInstr	cmovle cmovna cmovnae cmovnb cmovnbe cmovnc cmovne cmovng
syn keyword gasmInstr	cmovnge cmovnl cmovnle cmovno cmovnp cmovns cmovnz cmovo cmovp
syn keyword gasmInstr	cmovpe cmovpo cmovs cmovz cmp cmpeqpd cmpeqps cmpeqsd cmpeqss
syn keyword gasmInstr	cmplepd cmpleps cmplesd cmpless cmpltpd cmpltps cmpltsd cmpltss
syn keyword gasmInstr	cmpneqpd cmpneqps cmpneqsd cmpneqss cmpnlepd cmpnleps cmpnlesd
syn keyword gasmInstr	cmpnless cmpnltpd cmpnltps cmpnltsd cmpnltss cmpordpd cmpordps
syn keyword gasmInstr	cmpordsd cmpordss cmppd cmpps cmps cmpsb cmpsd cmpss cmpsw
syn keyword gasmInstr	cmpunordpd cmpunordps cmpunordsd cmpunordss cmpxchg cmpxchg8b
syn keyword gasmInstr	comisd comiss cpuid cvtdq2pd cvtdq2ps cvtpd2dq cvtpd2pi cvtpd2ps
syn keyword gasmInstr	cvtpi2pd cvtpi2ps cvtps2dq cvtps2pd cvtps2pi cvtsd2si cvtsd2ss
syn keyword gasmInstr	cvtsi2sd cvtsi2ss cvtss2sd cvtss2si cvttpd2dq cvttpd2pi cvttps2dq
syn keyword gasmInstr	cvttps2pi cvttsd2si cvttss2si cwd cwde daa das data dec div
syn keyword gasmInstr	divpd divps divsd divss else emms end enter extrn f2xm1 fabs
syn keyword gasmInstr	fadd faddp fbld fbstp fchs fclex fcmovb fcmovbe fcmove fcmovnb
syn keyword gasmInstr	fcmovnbe fcmovne fcmovnu fcmovu fcom fcomi fcomip fcomp fcompp
syn keyword gasmInstr	fcos fdecstp fdisi fdiv fdivp fdivr fdivrp femms feni ffree
syn keyword gasmInstr	ffreep fiadd ficom ficomp fidiv fidivr fild fimul fincstp
syn keyword gasmInstr	finit fist fistp fisttp fisub fisubr fld fld1 fldcw fldenv
syn keyword gasmInstr	fldl2e fldl2t fldlg2 fldln2 fldpi fldz fmul fmulp fnclex fndisi
syn keyword gasmInstr	fneni fninit fnop fnsave fnstcw fnstenv fnstsw fpatan fprem
syn keyword gasmInstr	fprem1 fptan frndint frstor frstpm fsave fscale fsetpm fsin
syn keyword gasmInstr	fsincos fsqrt fst fstcw fstenv fstp fstsw fsub fsubp fsubr
syn keyword gasmInstr	fsubrp ftst fucom fucomi fucomip fucomp fucompp fwait fxam
syn keyword gasmInstr	fxch fxrstor fxsave fxtract fyl2x fyl2xp1 haddpd haddps heap
syn keyword gasmInstr	hlt hsubpd hsubps idiv if imul in inc ins insb insd insw int
syn keyword gasmInstr	int3 into invd invlpg iret iretd iretw ja jae jb jbe jc jcxz
syn keyword gasmInstr	je jecxz jg jge jl jle jmp jna jnae jnb jnbe jnc jne jng jnge
syn keyword gasmInstr	jnl jnle jno jnp jns jnz jo jp jpe jpo js jz lahf lar lddqu
syn keyword gasmInstr	ldmxcsr lds lea leave les lfence lfs lgdt lgs lidt lldt lmsw
syn keyword gasmInstr	load loadall286 loadall386 lock lods lodsb lodsd lodsw loop
syn keyword gasmInstr	loopd loope looped loopew loopne loopned loopnew loopnz loopnzd
syn keyword gasmInstr	loopnzw loopw loopz loopzd loopzw lsl lss ltr maskmovdqu maskmovq
syn keyword gasmInstr	maxpd maxps maxsd maxss mfence minpd minps minsd minss monitor
syn keyword gasmInstr	mov movapd movaps movd movddup movdq2q movdqa movdqu movhlps
syn keyword gasmInstr	movhpd movhps movlhps movlpd movlps movmskpd movmskps movntdq
syn keyword gasmInstr	movnti movntpd movntps movntq movq movq2dq movs movsb movsd
syn keyword gasmInstr	movshdup movsldup movss movsw movsx movupd movups movzx mul movl
syn keyword gasmInstr	mulpd mulps mulsd mulss mwait neg nop not or org orpd orps
syn keyword gasmInstr	out outs outsb outsd outsw packssdw packsswb packuswb paddb
syn keyword gasmInstr	paddd paddq paddsb paddsw paddusb paddusw paddw pand pandn
syn keyword gasmInstr	pause pavgb pavgusb pavgw pcmpeqb pcmpeqd pcmpeqw pcmpgtb
syn keyword gasmInstr	pcmpgtd pcmpgtw pextrw pf2id pf2iw pfacc pfadd pfcmpeq pfcmpge
syn keyword gasmInstr	pfcmpgt pfmax pfmin pfmul pfnacc pfpnacc pfrcp pfrcpit1 pfrcpit2
syn keyword gasmInstr	pfrsqit1 pfrsqrt pfsub pfsubr pi2fd pi2fw pinsrw pmaddwd pmaxsw
syn keyword gasmInstr	pmaxub pminsw pminub pmovmskb pmulhrw pmulhuw pmulhw pmullw
syn keyword gasmInstr	pmuludq pop popa popad popaw popd popf popfd popfw popw por
syn keyword gasmInstr	prefetch prefetchnta prefetcht0 prefetcht1 prefetcht2 prefetchw
syn keyword gasmInstr	psadbw pshufd pshufhw pshuflw pshufw pslld pslldq psllq psllw
syn keyword gasmInstr	psrad psraw psrld psrldq psrlq psrlw psubb psubd psubq psubsb
syn keyword gasmInstr	psubsw psubusb psubusw psubw pswapd punpckhbw punpckhdq punpckhqdq
syn keyword gasmInstr	punpckhwd punpcklbw punpckldq punpcklqdq punpcklwd push pusha pushl
syn keyword gasmInstr	pushad pushaw pushd pushf pushfd pushfw pushw pxor rcl rcpps
syn keyword gasmInstr	rcpss rcr rdmsr rdpmc rdtsc rep repe repne repnz repz ret
syn keyword gasmInstr	retd retf retfd retfw retn retnd retnw retw rol ror rsm rsqrtps
syn keyword gasmInstr	rsqrtss sahf sal salc sar sbb scas scasb scasd scasw seta
syn keyword gasmInstr	setae setalc setb setbe setc sete setg setge setl setle setna
syn keyword gasmInstr	setnae setnb setnbe setnc setne setng setnge setnl setnle
syn keyword gasmInstr	setno setnp setns setnz seto setp setpe setpo sets setz sfence
syn keyword gasmInstr	sgdt shl shld shr shrd shufpd shufps sidt sldt smsw sqrtpd
syn keyword gasmInstr	sqrtps sqrtsd sqrtss stc std sti stmxcsr store stos stosb
syn keyword gasmInstr	stosd stosw str sub subpd subps subsd subss sysenter sysexit
syn keyword gasmInstr	test ucomisd ucomiss ud2 unpckhpd unpckhps unpcklpd unpcklps
syn keyword gasmInstr	verr verw wait wbinvd wrmsr xadd xchg xlat xlatb xor xorpd
syn keyword gasmPreprocess 	common equ fix forward include local macro purge restore
syn keyword gasmPreprocess	reverse struc title .model .stack 
syn keyword gasmDirective 	align binary code coff console discardable display dll
syn keyword gasmDirective	elf entry executable export extern far fixups format gui
syn keyword gasmDirective	import label ms mz native near notpageable pe public readable
syn keyword gasmDirective	repeat resource section segment shareable stack times
syn keyword gasmDirective	use16 use32 virtual wdm writeable
syn keyword gasmOperator 	as at defined eq eqtype from mod on ptr rva used

syn match	gasmNumericOperator	"[+-/*]"
syn match	gasmLogicalOperator	"[=|&~<>]\|<=\|>=\|<>"
" numbers
syn match	gasmBinaryNumber	"\<[01]\+b\>"
syn match	gasmHexNumber		"\<\d\x*h\>"
syn match	gasmHexNumber		"\<\(0x\|$\)\x*\>"
syn match	gasmFPUNumber		"\<\d\+\(\.\d*\)\=\(e[-+]\=\d*\)\=\>"
syn match	gasmOctalNumber		"\<\(0\o\+o\=\|\o\+o\)\>"
syn match	gasmDecimalNumber	"\<\(0\|[1-9]\d*\)\>"
syn region	gasmString		start="\"" end="\"\|$"
syn region	gasmString		start="'" end="'\|$"
syn match	gasmSymbol		"[()|\[\]:]"
syn match	gasmSpecial		"[#?%$,]"
syn region	gasmComment		start="; " end="$"
syn match	gasmLabel		"^\s*[^; \t]\+:"

hi def link	gasmAddressSizes	type
hi def link	gasmNumericOperator	gasmOperator
hi def link	gasmLogicalOperator	gasmOperator

hi def link	gasmBinaryNumber	gasmNumber
hi def link	gasmHexNumber		gasmNumber
hi def link	gasmFPUNumber		gasmNumber
hi def link	gasmOctalNumber		gasmNumber
hi def link	gasmDecimalNumber	gasmNumber

hi def link	gasmSymbols		gasmRegister
hi def link	gasmPreprocess		gasmDirective

"  link to standard syn groups so the 'colorschemes' work:
hi def link	gasmOperator operator
hi def link	gasmComment  comment
hi def link	gasmDirective	preproc
hi def link	gasmRegister  type
hi def link	gasmNumber   constant
hi def link	gasmSymbol structure
hi def link	gasmString  String
hi def link	gasmSpecial	special
hi def link	gasmInstr keyword
hi def link	gasmLabel label
hi def link	gasmPrefix preproc
let b:current_syntax = "gasm"
" vim: ts=8 sw=8 :
