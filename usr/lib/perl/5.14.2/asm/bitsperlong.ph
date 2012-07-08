require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ASM_POWERPC_BITSPERLONG_H)) {
    eval 'sub __ASM_POWERPC_BITSPERLONG_H () {1;}' unless defined(&__ASM_POWERPC_BITSPERLONG_H);
    if(defined(&__powerpc64__)) {
	eval 'sub __BITS_PER_LONG () {64;}' unless defined(&__BITS_PER_LONG);
    } else {
	eval 'sub __BITS_PER_LONG () {32;}' unless defined(&__BITS_PER_LONG);
    }
    require 'asm-generic/bitsperlong.ph';
}
1;
