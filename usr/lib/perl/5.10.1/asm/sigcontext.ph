require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_SIGCONTEXT_H)) {
    eval 'sub _ASM_POWERPC_SIGCONTEXT_H () {1;}' unless defined(&_ASM_POWERPC_SIGCONTEXT_H);
    require 'asm/ptrace.ph';
    if(defined(&__powerpc64__)) {
	require 'asm/elf.ph';
    }
    if(defined(&__powerpc64__)) {
    }
    if(defined(&__powerpc64__)) {
    }
}
1;
