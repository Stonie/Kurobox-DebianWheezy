require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_POSIX_TYPES_H)) {
    eval 'sub _ASM_POWERPC_POSIX_TYPES_H () {1;}' unless defined(&_ASM_POWERPC_POSIX_TYPES_H);
    if(defined(&__powerpc64__)) {
    } else {
    }
    if(defined(&__powerpc64__)) {
    } else {
	if(defined(&__GNUC__)) {
	}
    }
    unless(defined(&__GNUC__)) {
	eval 'sub __FD_SET {
	    my($d, $set) = @_;
    	    eval q((($set)-> $fds_bits[ &__FDELT($d)] |=  &__FDMASK($d)));
	}' unless defined(&__FD_SET);
	eval 'sub __FD_CLR {
	    my($d, $set) = @_;
    	    eval q((($set)-> $fds_bits[ &__FDELT($d)] &= ~ &__FDMASK($d)));
	}' unless defined(&__FD_CLR);
	eval 'sub __FD_ISSET {
	    my($d, $set) = @_;
    	    eval q(((($set)-> $fds_bits[ &__FDELT($d)] &  &__FDMASK($d)) != 0));
	}' unless defined(&__FD_ISSET);
	eval 'sub __FD_ZERO {
	    my($set) = @_;
    	    eval q((( &void)  &memset (( &void *) ($set), 0, $sizeof{ &__kernel_fd_set})));
	}' unless defined(&__FD_ZERO);
    } else {
    }
}
1;
