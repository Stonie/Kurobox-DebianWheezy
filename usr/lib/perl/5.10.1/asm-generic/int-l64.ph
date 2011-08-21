require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_GENERIC_INT_L64_H)) {
    eval 'sub _ASM_GENERIC_INT_L64_H () {1;}' unless defined(&_ASM_GENERIC_INT_L64_H);
    require 'asm/bitsperlong.ph';
    unless(defined(&__ASSEMBLY__)) {
    }
}
1;
