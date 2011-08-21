require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_UCONTEXT_H)) {
    eval 'sub _SYS_UCONTEXT_H () {1;}' unless defined(&_SYS_UCONTEXT_H);
    require 'features.ph';
    require 'signal.ph';
    require 'bits/sigcontext.ph';
    if((defined(&__WORDSIZE) ? &__WORDSIZE : undef) == 32) {
	eval 'sub NGREG () {48;}' unless defined(&NGREG);
    } else {
	eval 'sub NGREG () {48;}' unless defined(&NGREG);
	eval 'sub NFPREG () {33;}' unless defined(&NFPREG);
	eval 'sub NVRREG () {34;}' unless defined(&NVRREG);
    }
    if((defined(&__WORDSIZE) ? &__WORDSIZE : undef) == 32) {
    } else {
    }
}
1;
