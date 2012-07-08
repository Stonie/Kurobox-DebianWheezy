require '_h2ph_pre.ph';

no warnings qw(redefine misc);

if(defined (&__powerpc64__)) {
    eval 'sub __WORDSIZE () {64;}' unless defined(&__WORDSIZE);
    eval 'sub __WORDSIZE_COMPAT32 () {1;}' unless defined(&__WORDSIZE_COMPAT32);
} else {
    eval 'sub __WORDSIZE () {32;}' unless defined(&__WORDSIZE);
}
if(!defined (&__NO_LONG_DOUBLE_MATH)  && !defined (&__LONG_DOUBLE_MATH_OPTIONAL)) {
    eval 'sub __LONG_DOUBLE_MATH_OPTIONAL () {1;}' unless defined(&__LONG_DOUBLE_MATH_OPTIONAL);
    unless(defined(&__LONG_DOUBLE_128__)) {
	eval 'sub __NO_LONG_DOUBLE_MATH () {1;}' unless defined(&__NO_LONG_DOUBLE_MATH);
    }
}
1;
