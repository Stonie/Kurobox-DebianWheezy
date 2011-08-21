require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined (defined(&__powerpc64__) ? &__powerpc64__ : undef)) {
    eval 'sub __WORDSIZE () {64;}' unless defined(&__WORDSIZE);
    eval 'sub __WORDSIZE_COMPAT32 () {1;}' unless defined(&__WORDSIZE_COMPAT32);
} else {
    eval 'sub __WORDSIZE () {32;}' unless defined(&__WORDSIZE);
}
if(!defined (defined(&__NO_LONG_DOUBLE_MATH) ? &__NO_LONG_DOUBLE_MATH : undef)  && !defined (defined(&__LONG_DOUBLE_MATH_OPTIONAL) ? &__LONG_DOUBLE_MATH_OPTIONAL : undef)) {
    eval 'sub __LONG_DOUBLE_MATH_OPTIONAL () {1;}' unless defined(&__LONG_DOUBLE_MATH_OPTIONAL);
    unless(defined(&__LONG_DOUBLE_128__)) {
	eval 'sub __NO_LONG_DOUBLE_MATH () {1;}' unless defined(&__NO_LONG_DOUBLE_MATH);
    }
}
1;
