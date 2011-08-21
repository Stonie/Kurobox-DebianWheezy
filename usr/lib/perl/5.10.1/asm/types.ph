require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_TYPES_H)) {
    eval 'sub _ASM_POWERPC_TYPES_H () {1;}' unless defined(&_ASM_POWERPC_TYPES_H);
    if(defined( &__powerpc64__)  && !defined( &__KERNEL__)) {
	require 'asm-generic/int-l64.ph';
    } else {
	require 'asm-generic/int-ll64.ph';
    }
    unless(defined(&__ASSEMBLY__)) {
	if(defined(&__powerpc64__)) {
	} else {
	}
    }
}
1;
