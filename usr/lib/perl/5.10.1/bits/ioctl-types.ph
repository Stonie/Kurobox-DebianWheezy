require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_SYS_IOCTL_H)) {
    die("Never use <bits/ioctl-types.h> directly; include <sys/ioctl.h> instead.");
}
require 'termios.ph';
1;
