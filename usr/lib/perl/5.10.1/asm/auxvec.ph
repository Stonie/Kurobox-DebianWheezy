require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_AUXVEC_H)) {
    eval 'sub _ASM_POWERPC_AUXVEC_H () {1;}' unless defined(&_ASM_POWERPC_AUXVEC_H);
    eval 'sub AT_DCACHEBSIZE () {19;}' unless defined(&AT_DCACHEBSIZE);
    eval 'sub AT_ICACHEBSIZE () {20;}' unless defined(&AT_ICACHEBSIZE);
    eval 'sub AT_UCACHEBSIZE () {21;}' unless defined(&AT_UCACHEBSIZE);
    eval 'sub AT_IGNOREPPC () {22;}' unless defined(&AT_IGNOREPPC);
    eval 'sub AT_SYSINFO_EHDR () {33;}' unless defined(&AT_SYSINFO_EHDR);
}
1;
