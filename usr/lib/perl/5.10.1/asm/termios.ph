require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_TERMIOS_H)) {
    eval 'sub _ASM_POWERPC_TERMIOS_H () {1;}' unless defined(&_ASM_POWERPC_TERMIOS_H);
    require 'asm/ioctls.ph';
    require 'asm/termbits.ph';
    eval 'sub NCC () {10;}' unless defined(&NCC);
    eval 'sub _VINTR () {0;}' unless defined(&_VINTR);
    eval 'sub _VQUIT () {1;}' unless defined(&_VQUIT);
    eval 'sub _VERASE () {2;}' unless defined(&_VERASE);
    eval 'sub _VKILL () {3;}' unless defined(&_VKILL);
    eval 'sub _VEOF () {4;}' unless defined(&_VEOF);
    eval 'sub _VMIN () {5;}' unless defined(&_VMIN);
    eval 'sub _VEOL () {6;}' unless defined(&_VEOL);
    eval 'sub _VTIME () {7;}' unless defined(&_VTIME);
    eval 'sub _VEOL2 () {8;}' unless defined(&_VEOL2);
    eval 'sub _VSWTC () {9;}' unless defined(&_VSWTC);
}
1;
