require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TERMIOS_H)) {
    eval 'sub _TERMIOS_H () {1;}' unless defined(&_TERMIOS_H);
    require 'features.ph';
    if(defined (&__USE_UNIX98) || defined (&__USE_XOPEN2K8)) {
	require 'bits/types.ph';
	unless(defined(&__pid_t_defined)) {
	    eval 'sub __pid_t_defined () {1;}' unless defined(&__pid_t_defined);
	}
    }
    require 'bits/termios.ph';
    if(defined(&__USE_BSD)) {
	eval 'sub CCEQ {
	    my($val, $c) = @_;
    	    eval q((($c) == ($val)  && ($val) !=  &_POSIX_VDISABLE));
	}' unless defined(&CCEQ);
    }
    if(defined(&__USE_BSD)) {
    }
    if(defined(&__USE_BSD)) {
    }
    if(defined(&__USE_UNIX98)) {
    }
    if(defined(&__USE_BSD)) {
	require 'sys/ttydefaults.ph';
    }
}
1;
