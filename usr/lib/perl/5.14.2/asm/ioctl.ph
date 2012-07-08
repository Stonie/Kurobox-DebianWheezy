require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_IOCTL_H)) {
    eval 'sub _ASM_POWERPC_IOCTL_H () {1;}' unless defined(&_ASM_POWERPC_IOCTL_H);
    eval 'sub _IOC_SIZEBITS () {13;}' unless defined(&_IOC_SIZEBITS);
    eval 'sub _IOC_DIRBITS () {3;}' unless defined(&_IOC_DIRBITS);
    eval 'sub _IOC_NONE () {1;}' unless defined(&_IOC_NONE);
    eval 'sub _IOC_READ () {2;}' unless defined(&_IOC_READ);
    eval 'sub _IOC_WRITE () {4;}' unless defined(&_IOC_WRITE);
    require 'asm-generic/ioctl.ph';
}
1;
