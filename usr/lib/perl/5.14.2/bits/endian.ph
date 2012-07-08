require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ENDIAN_H)) {
    die("Never use <bits/endian.h> directly; include <endian.h> instead.");
}
if(defined (&__BIG_ENDIAN__) || defined (&_BIG_ENDIAN)) {
    if(defined (&__LITTLE_ENDIAN__) || defined (&_LITTLE_ENDIAN)) {
	die("Both\ BIG_ENDIAN\ and\ LITTLE_ENDIAN\ defined\!");
    }
    eval 'sub __BYTE_ORDER () { &__BIG_ENDIAN;}' unless defined(&__BYTE_ORDER);
} else {
    if(defined (&__LITTLE_ENDIAN__) || defined (&_LITTLE_ENDIAN)) {
	eval 'sub __BYTE_ORDER () { &__LITTLE_ENDIAN;}' unless defined(&__BYTE_ORDER);
    } else {
	warn("Cannot\ determine\ current\ byte\ order\,\ assuming\ big\-endian\.");
	eval 'sub __BYTE_ORDER () { &__BIG_ENDIAN;}' unless defined(&__BYTE_ORDER);
    }
}
1;
