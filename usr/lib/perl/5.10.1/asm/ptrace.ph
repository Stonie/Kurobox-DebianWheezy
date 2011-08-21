require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_PTRACE_H)) {
    eval 'sub _ASM_POWERPC_PTRACE_H () {1;}' unless defined(&_ASM_POWERPC_PTRACE_H);
    unless(defined(&__ASSEMBLY__)) {
	if(defined(&__powerpc64__)) {
	} else {
	}
    }
    eval 'sub PT_R0 () {0;}' unless defined(&PT_R0);
    eval 'sub PT_R1 () {1;}' unless defined(&PT_R1);
    eval 'sub PT_R2 () {2;}' unless defined(&PT_R2);
    eval 'sub PT_R3 () {3;}' unless defined(&PT_R3);
    eval 'sub PT_R4 () {4;}' unless defined(&PT_R4);
    eval 'sub PT_R5 () {5;}' unless defined(&PT_R5);
    eval 'sub PT_R6 () {6;}' unless defined(&PT_R6);
    eval 'sub PT_R7 () {7;}' unless defined(&PT_R7);
    eval 'sub PT_R8 () {8;}' unless defined(&PT_R8);
    eval 'sub PT_R9 () {9;}' unless defined(&PT_R9);
    eval 'sub PT_R10 () {10;}' unless defined(&PT_R10);
    eval 'sub PT_R11 () {11;}' unless defined(&PT_R11);
    eval 'sub PT_R12 () {12;}' unless defined(&PT_R12);
    eval 'sub PT_R13 () {13;}' unless defined(&PT_R13);
    eval 'sub PT_R14 () {14;}' unless defined(&PT_R14);
    eval 'sub PT_R15 () {15;}' unless defined(&PT_R15);
    eval 'sub PT_R16 () {16;}' unless defined(&PT_R16);
    eval 'sub PT_R17 () {17;}' unless defined(&PT_R17);
    eval 'sub PT_R18 () {18;}' unless defined(&PT_R18);
    eval 'sub PT_R19 () {19;}' unless defined(&PT_R19);
    eval 'sub PT_R20 () {20;}' unless defined(&PT_R20);
    eval 'sub PT_R21 () {21;}' unless defined(&PT_R21);
    eval 'sub PT_R22 () {22;}' unless defined(&PT_R22);
    eval 'sub PT_R23 () {23;}' unless defined(&PT_R23);
    eval 'sub PT_R24 () {24;}' unless defined(&PT_R24);
    eval 'sub PT_R25 () {25;}' unless defined(&PT_R25);
    eval 'sub PT_R26 () {26;}' unless defined(&PT_R26);
    eval 'sub PT_R27 () {27;}' unless defined(&PT_R27);
    eval 'sub PT_R28 () {28;}' unless defined(&PT_R28);
    eval 'sub PT_R29 () {29;}' unless defined(&PT_R29);
    eval 'sub PT_R30 () {30;}' unless defined(&PT_R30);
    eval 'sub PT_R31 () {31;}' unless defined(&PT_R31);
    eval 'sub PT_NIP () {32;}' unless defined(&PT_NIP);
    eval 'sub PT_MSR () {33;}' unless defined(&PT_MSR);
    eval 'sub PT_ORIG_R3 () {34;}' unless defined(&PT_ORIG_R3);
    eval 'sub PT_CTR () {35;}' unless defined(&PT_CTR);
    eval 'sub PT_LNK () {36;}' unless defined(&PT_LNK);
    eval 'sub PT_XER () {37;}' unless defined(&PT_XER);
    eval 'sub PT_CCR () {38;}' unless defined(&PT_CCR);
    unless(defined(&__powerpc64__)) {
	eval 'sub PT_MQ () {39;}' unless defined(&PT_MQ);
    } else {
	eval 'sub PT_SOFTE () {39;}' unless defined(&PT_SOFTE);
    }
    eval 'sub PT_TRAP () {40;}' unless defined(&PT_TRAP);
    eval 'sub PT_DAR () {41;}' unless defined(&PT_DAR);
    eval 'sub PT_DSISR () {42;}' unless defined(&PT_DSISR);
    eval 'sub PT_RESULT () {43;}' unless defined(&PT_RESULT);
    eval 'sub PT_REGS_COUNT () {44;}' unless defined(&PT_REGS_COUNT);
    eval 'sub PT_FPR0 () {48;}' unless defined(&PT_FPR0);
    unless(defined(&__powerpc64__)) {
	eval 'sub PT_FPR31 () {( &PT_FPR0 + 2*31);}' unless defined(&PT_FPR31);
	eval 'sub PT_FPSCR () {( &PT_FPR0 + 2*32+ 1);}' unless defined(&PT_FPSCR);
    } else {
	eval 'sub PT_FPSCR () {( &PT_FPR0 + 32);}' unless defined(&PT_FPSCR);
	eval 'sub PT_VR0 () {82;}' unless defined(&PT_VR0);
	eval 'sub PT_VSCR () {( &PT_VR0 + 32*2+ 1);}' unless defined(&PT_VSCR);
	eval 'sub PT_VRSAVE () {( &PT_VR0 + 33*2);}' unless defined(&PT_VRSAVE);
	eval 'sub PT_VSR0 () {150;}' unless defined(&PT_VSR0);
	eval 'sub PT_VSR31 () {( &PT_VSR0 + 2*31);}' unless defined(&PT_VSR31);
    }
    eval 'sub PTRACE_GETVRREGS () {18;}' unless defined(&PTRACE_GETVRREGS);
    eval 'sub PTRACE_SETVRREGS () {19;}' unless defined(&PTRACE_SETVRREGS);
    eval 'sub PTRACE_GETEVRREGS () {20;}' unless defined(&PTRACE_GETEVRREGS);
    eval 'sub PTRACE_SETEVRREGS () {21;}' unless defined(&PTRACE_SETEVRREGS);
    eval 'sub PTRACE_GETVSRREGS () {27;}' unless defined(&PTRACE_GETVSRREGS);
    eval 'sub PTRACE_SETVSRREGS () {28;}' unless defined(&PTRACE_SETVSRREGS);
    eval 'sub PTRACE_GET_DEBUGREG () {25;}' unless defined(&PTRACE_GET_DEBUGREG);
    eval 'sub PTRACE_SET_DEBUGREG () {26;}' unless defined(&PTRACE_SET_DEBUGREG);
    eval 'sub PTRACE_GETREGS () {12;}' unless defined(&PTRACE_GETREGS);
    eval 'sub PTRACE_SETREGS () {13;}' unless defined(&PTRACE_SETREGS);
    eval 'sub PTRACE_GETFPREGS () {14;}' unless defined(&PTRACE_GETFPREGS);
    eval 'sub PTRACE_SETFPREGS () {15;}' unless defined(&PTRACE_SETFPREGS);
    eval 'sub PTRACE_GETREGS64 () {22;}' unless defined(&PTRACE_GETREGS64);
    eval 'sub PTRACE_SETREGS64 () {23;}' unless defined(&PTRACE_SETREGS64);
    eval 'sub PPC_PTRACE_GETREGS () {0x99;}' unless defined(&PPC_PTRACE_GETREGS);
    eval 'sub PPC_PTRACE_SETREGS () {0x98;}' unless defined(&PPC_PTRACE_SETREGS);
    eval 'sub PPC_PTRACE_GETFPREGS () {0x97;}' unless defined(&PPC_PTRACE_GETFPREGS);
    eval 'sub PPC_PTRACE_SETFPREGS () {0x96;}' unless defined(&PPC_PTRACE_SETFPREGS);
    eval 'sub PPC_PTRACE_PEEKTEXT_3264 () {0x95;}' unless defined(&PPC_PTRACE_PEEKTEXT_3264);
    eval 'sub PPC_PTRACE_PEEKDATA_3264 () {0x94;}' unless defined(&PPC_PTRACE_PEEKDATA_3264);
    eval 'sub PPC_PTRACE_POKETEXT_3264 () {0x93;}' unless defined(&PPC_PTRACE_POKETEXT_3264);
    eval 'sub PPC_PTRACE_POKEDATA_3264 () {0x92;}' unless defined(&PPC_PTRACE_POKEDATA_3264);
    eval 'sub PPC_PTRACE_PEEKUSR_3264 () {0x91;}' unless defined(&PPC_PTRACE_PEEKUSR_3264);
    eval 'sub PPC_PTRACE_POKEUSR_3264 () {0x90;}' unless defined(&PPC_PTRACE_POKEUSR_3264);
    eval 'sub PTRACE_SINGLEBLOCK () {0x100;}' unless defined(&PTRACE_SINGLEBLOCK);
}
1;
