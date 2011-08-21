require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_TERMIOS_H)) {
    die("Never include <bits/termios.h> directly; use <termios.h> instead.");
}
unless(defined(&NCCS)) {
    sub NCCS () {	32;}
}
unless(defined(&_HAVE_STRUCT_TERMIOS_C_ISPEED)) {
    sub _HAVE_STRUCT_TERMIOS_C_ISPEED () {	1;}
}
unless(defined(&_HAVE_STRUCT_TERMIOS_C_OSPEED)) {
    sub _HAVE_STRUCT_TERMIOS_C_OSPEED () {	1;}
}
unless(defined(&VINTR)) {
    sub VINTR () {	0;}
}
unless(defined(&VQUIT)) {
    sub VQUIT () {	1;}
}
unless(defined(&VERASE)) {
    sub VERASE () {	2;}
}
unless(defined(&VKILL)) {
    sub VKILL () {	3;}
}
unless(defined(&VEOF)) {
    sub VEOF () {	4;}
}
unless(defined(&VMIN)) {
    sub VMIN () {	5;}
}
unless(defined(&VEOL)) {
    sub VEOL () {	6;}
}
unless(defined(&VTIME)) {
    sub VTIME () {	7;}
}
unless(defined(&VEOL2)) {
    sub VEOL2 () {	8;}
}
unless(defined(&VSWTC)) {
    sub VSWTC () {	9;}
}
unless(defined(&VWERASE)) {
    sub VWERASE () {	10;}
}
unless(defined(&VREPRINT)) {
    sub VREPRINT () {	11;}
}
unless(defined(&VSUSP)) {
    sub VSUSP () {	12;}
}
unless(defined(&VSTART)) {
    sub VSTART () {	13;}
}
unless(defined(&VSTOP)) {
    sub VSTOP () {	14;}
}
unless(defined(&VLNEXT)) {
    sub VLNEXT () {	15;}
}
unless(defined(&VDISCARD)) {
    sub VDISCARD () {	16;}
}
unless(defined(&IGNBRK)) {
    sub IGNBRK () {	0000001;}
}
unless(defined(&BRKINT)) {
    sub BRKINT () {	0000002;}
}
unless(defined(&IGNPAR)) {
    sub IGNPAR () {	0000004;}
}
unless(defined(&PARMRK)) {
    sub PARMRK () {	0000010;}
}
unless(defined(&INPCK)) {
    sub INPCK () {	0000020;}
}
unless(defined(&ISTRIP)) {
    sub ISTRIP () {	0000040;}
}
unless(defined(&INLCR)) {
    sub INLCR () {	0000100;}
}
unless(defined(&IGNCR)) {
    sub IGNCR () {	0000200;}
}
unless(defined(&ICRNL)) {
    sub ICRNL () {	0000400;}
}
unless(defined(&IXON)) {
    sub IXON () {	0001000;}
}
unless(defined(&IXOFF)) {
    sub IXOFF () {	0002000;}
}
unless(defined(&IXANY)) {
    sub IXANY () {	0004000;}
}
unless(defined(&IUCLC)) {
    sub IUCLC () {	0010000;}
}
unless(defined(&IMAXBEL)) {
    sub IMAXBEL () {	0020000;}
}
unless(defined(&IUTF8)) {
    sub IUTF8 () {	0040000;}
}
unless(defined(&OPOST)) {
    sub OPOST () {	0000001;}
}
unless(defined(&ONLCR)) {
    sub ONLCR () {	0000002;}
}
unless(defined(&OLCUC)) {
    sub OLCUC () {	0000004;}
}
unless(defined(&OCRNL)) {
    sub OCRNL () {	0000010;}
}
unless(defined(&ONOCR)) {
    sub ONOCR () {	0000020;}
}
unless(defined(&ONLRET)) {
    sub ONLRET () {	0000040;}
}
unless(defined(&OFILL)) {
    sub OFILL () {	00000100;}
}
unless(defined(&OFDEL)) {
    sub OFDEL () {	00000200;}
}
if(defined (defined(&__USE_MISC) ? &__USE_MISC : undef) || defined (defined(&__USE_XOPEN) ? &__USE_XOPEN : undef)) {
    eval 'sub NLDLY () {00001400;}' unless defined(&NLDLY);
    eval 'sub NL0 () {00000000;}' unless defined(&NL0);
    eval 'sub NL1 () {00000400;}' unless defined(&NL1);
    eval 'sub NL2 () {00001000;}' unless defined(&NL2);
    eval 'sub NL3 () {00001400;}' unless defined(&NL3);
    eval 'sub TABDLY () {00006000;}' unless defined(&TABDLY);
    eval 'sub TAB0 () {00000000;}' unless defined(&TAB0);
    eval 'sub TAB1 () {00002000;}' unless defined(&TAB1);
    eval 'sub TAB2 () {00004000;}' unless defined(&TAB2);
    eval 'sub TAB3 () {00006000;}' unless defined(&TAB3);
    eval 'sub CRDLY () {00030000;}' unless defined(&CRDLY);
    eval 'sub CR0 () {00000000;}' unless defined(&CR0);
    eval 'sub CR1 () {00010000;}' unless defined(&CR1);
    eval 'sub CR2 () {00020000;}' unless defined(&CR2);
    eval 'sub CR3 () {00030000;}' unless defined(&CR3);
    eval 'sub FFDLY () {00040000;}' unless defined(&FFDLY);
    eval 'sub FF0 () {00000000;}' unless defined(&FF0);
    eval 'sub FF1 () {00040000;}' unless defined(&FF1);
    eval 'sub BSDLY () {00100000;}' unless defined(&BSDLY);
    eval 'sub BS0 () {00000000;}' unless defined(&BS0);
    eval 'sub BS1 () {00100000;}' unless defined(&BS1);
}
unless(defined(&VTDLY)) {
    sub VTDLY () {	00200000;}
}
unless(defined(&VT0)) {
    sub VT0 () {	00000000;}
}
unless(defined(&VT1)) {
    sub VT1 () {	00200000;}
}
if(defined(&__USE_MISC)) {
    eval 'sub XTABS () {00006000;}' unless defined(&XTABS);
}
if(defined(&__USE_MISC)) {
    eval 'sub CBAUD () {0000377;}' unless defined(&CBAUD);
}
unless(defined(&B0)) {
    sub B0 () {	0000000;}
}
unless(defined(&B50)) {
    sub B50 () {	0000001;}
}
unless(defined(&B75)) {
    sub B75 () {	0000002;}
}
unless(defined(&B110)) {
    sub B110 () {	0000003;}
}
unless(defined(&B134)) {
    sub B134 () {	0000004;}
}
unless(defined(&B150)) {
    sub B150 () {	0000005;}
}
unless(defined(&B200)) {
    sub B200 () {	0000006;}
}
unless(defined(&B300)) {
    sub B300 () {	0000007;}
}
unless(defined(&B600)) {
    sub B600 () {	0000010;}
}
unless(defined(&B1200)) {
    sub B1200 () {	0000011;}
}
unless(defined(&B1800)) {
    sub B1800 () {	0000012;}
}
unless(defined(&B2400)) {
    sub B2400 () {	0000013;}
}
unless(defined(&B4800)) {
    sub B4800 () {	0000014;}
}
unless(defined(&B9600)) {
    sub B9600 () {	0000015;}
}
unless(defined(&B19200)) {
    sub B19200 () {	0000016;}
}
unless(defined(&B38400)) {
    sub B38400 () {	0000017;}
}
if(defined(&__USE_MISC)) {
    eval 'sub EXTA () { &B19200;}' unless defined(&EXTA);
    eval 'sub EXTB () { &B38400;}' unless defined(&EXTB);
    eval 'sub CBAUDEX () {0000020;}' unless defined(&CBAUDEX);
}
unless(defined(&B57600)) {
    sub B57600 () {	00020;}
}
unless(defined(&B115200)) {
    sub B115200 () {	00021;}
}
unless(defined(&B230400)) {
    sub B230400 () {	00022;}
}
unless(defined(&B460800)) {
    sub B460800 () {	00023;}
}
unless(defined(&B500000)) {
    sub B500000 () {	00024;}
}
unless(defined(&B576000)) {
    sub B576000 () {	00025;}
}
unless(defined(&B921600)) {
    sub B921600 () {	00026;}
}
unless(defined(&B1000000)) {
    sub B1000000 () {	00027;}
}
unless(defined(&B1152000)) {
    sub B1152000 () {	00030;}
}
unless(defined(&B1500000)) {
    sub B1500000 () {	00031;}
}
unless(defined(&B2000000)) {
    sub B2000000 () {	00032;}
}
unless(defined(&B2500000)) {
    sub B2500000 () {	00033;}
}
unless(defined(&B3000000)) {
    sub B3000000 () {	00034;}
}
unless(defined(&B3500000)) {
    sub B3500000 () {	00035;}
}
unless(defined(&B4000000)) {
    sub B4000000 () {	00036;}
}
unless(defined(&__MAX_BAUD)) {
    sub __MAX_BAUD () {	 &B4000000;}
}
unless(defined(&CSIZE)) {
    sub CSIZE () {	00001400;}
}
unless(defined(&CS5)) {
    sub CS5 () {	00000000;}
}
unless(defined(&CS6)) {
    sub CS6 () {	00000400;}
}
unless(defined(&CS7)) {
    sub CS7 () {	00001000;}
}
unless(defined(&CS8)) {
    sub CS8 () {	00001400;}
}
unless(defined(&CSTOPB)) {
    sub CSTOPB () {	00002000;}
}
unless(defined(&CREAD)) {
    sub CREAD () {	00004000;}
}
unless(defined(&PARENB)) {
    sub PARENB () {	00010000;}
}
unless(defined(&PARODD)) {
    sub PARODD () {	00020000;}
}
unless(defined(&HUPCL)) {
    sub HUPCL () {	00040000;}
}
unless(defined(&CLOCAL)) {
    sub CLOCAL () {	00100000;}
}
if(defined(&__USE_MISC)) {
    eval 'sub CMSPAR () {010000000000;}' unless defined(&CMSPAR);
    eval 'sub CRTSCTS () {020000000000;}' unless defined(&CRTSCTS);
}
unless(defined(&ISIG)) {
    sub ISIG () {	0x80;}
}
unless(defined(&ICANON)) {
    sub ICANON () {	0x100;}
}
if(defined (defined(&__USE_MISC) ? &__USE_MISC : undef) || defined (defined(&__USE_XOPEN) ? &__USE_XOPEN : undef)) {
    eval 'sub XCASE () {0x4000;}' unless defined(&XCASE);
}
unless(defined(&ECHO)) {
    sub ECHO () {	0x8;}
}
unless(defined(&ECHOE)) {
    sub ECHOE () {	0x2;}
}
unless(defined(&ECHOK)) {
    sub ECHOK () {	0x4;}
}
unless(defined(&ECHONL)) {
    sub ECHONL () {	0x10;}
}
unless(defined(&NOFLSH)) {
    sub NOFLSH () {	0x80000000;}
}
unless(defined(&TOSTOP)) {
    sub TOSTOP () {	0x400000;}
}
if(defined(&__USE_MISC)) {
    eval 'sub ECHOCTL () {0x40;}' unless defined(&ECHOCTL);
    eval 'sub ECHOPRT () {0x20;}' unless defined(&ECHOPRT);
    eval 'sub ECHOKE () {0x1;}' unless defined(&ECHOKE);
    eval 'sub FLUSHO () {0x800000;}' unless defined(&FLUSHO);
    eval 'sub PENDIN () {0x20000000;}' unless defined(&PENDIN);
}
unless(defined(&IEXTEN)) {
    sub IEXTEN () {	0x400;}
}
unless(defined(&TCOOFF)) {
    sub TCOOFF () {	0;}
}
unless(defined(&TCOON)) {
    sub TCOON () {	1;}
}
unless(defined(&TCIOFF)) {
    sub TCIOFF () {	2;}
}
unless(defined(&TCION)) {
    sub TCION () {	3;}
}
unless(defined(&TCIFLUSH)) {
    sub TCIFLUSH () {	0;}
}
unless(defined(&TCOFLUSH)) {
    sub TCOFLUSH () {	1;}
}
unless(defined(&TCIOFLUSH)) {
    sub TCIOFLUSH () {	2;}
}
unless(defined(&TCSANOW)) {
    sub TCSANOW () {	0;}
}
unless(defined(&TCSADRAIN)) {
    sub TCSADRAIN () {	1;}
}
unless(defined(&TCSAFLUSH)) {
    sub TCSAFLUSH () {	2;}
}
unless(defined(&TIOCPKT_DATA)) {
    sub TIOCPKT_DATA () {	0;}
}
unless(defined(&TIOCPKT_FLUSHREAD)) {
    sub TIOCPKT_FLUSHREAD () {	1;}
}
unless(defined(&TIOCPKT_FLUSHWRITE)) {
    sub TIOCPKT_FLUSHWRITE () {	2;}
}
unless(defined(&TIOCPKT_STOP)) {
    sub TIOCPKT_STOP () {	4;}
}
unless(defined(&TIOCPKT_START)) {
    sub TIOCPKT_START () {	8;}
}
unless(defined(&TIOCPKT_NOSTOP)) {
    sub TIOCPKT_NOSTOP () {	16;}
}
unless(defined(&TIOCPKT_DOSTOP)) {
    sub TIOCPKT_DOSTOP () {	32;}
}
unless(defined(&NCC)) {
    sub NCC () {	10;}
}
unless(defined(&_VINTR)) {
    sub _VINTR () {	0;}
}
unless(defined(&_VQUIT)) {
    sub _VQUIT () {	1;}
}
unless(defined(&_VERASE)) {
    sub _VERASE () {	2;}
}
unless(defined(&_VKILL)) {
    sub _VKILL () {	3;}
}
unless(defined(&_VEOF)) {
    sub _VEOF () {	4;}
}
unless(defined(&_VMIN)) {
    sub _VMIN () {	5;}
}
unless(defined(&_VEOL)) {
    sub _VEOL () {	6;}
}
unless(defined(&_VTIME)) {
    sub _VTIME () {	7;}
}
unless(defined(&_VEOL2)) {
    sub _VEOL2 () {	8;}
}
unless(defined(&_VSWTC)) {
    sub _VSWTC () {	9;}
}
unless(defined(&TIOCM_LE)) {
    sub TIOCM_LE () {	0x1;}
}
unless(defined(&TIOCM_DTR)) {
    sub TIOCM_DTR () {	0x2;}
}
unless(defined(&TIOCM_RTS)) {
    sub TIOCM_RTS () {	0x4;}
}
unless(defined(&TIOCM_ST)) {
    sub TIOCM_ST () {	0x8;}
}
unless(defined(&TIOCM_SR)) {
    sub TIOCM_SR () {	0x10;}
}
unless(defined(&TIOCM_CTS)) {
    sub TIOCM_CTS () {	0x20;}
}
unless(defined(&TIOCM_CAR)) {
    sub TIOCM_CAR () {	0x40;}
}
unless(defined(&TIOCM_RNG)) {
    sub TIOCM_RNG () {	0x80;}
}
unless(defined(&TIOCM_DSR)) {
    sub TIOCM_DSR () {	0x100;}
}
unless(defined(&TIOCM_CD)) {
    sub TIOCM_CD () {	 &TIOCM_CAR;}
}
unless(defined(&TIOCM_RI)) {
    sub TIOCM_RI () {	 &TIOCM_RNG;}
}
unless(defined(&TIOCSER_TEMT)) {
    sub TIOCSER_TEMT () {	0x1;}
}
unless(defined(&N_TTY)) {
    sub N_TTY () {	0;}
}
unless(defined(&N_SLIP)) {
    sub N_SLIP () {	1;}
}
unless(defined(&N_MOUSE)) {
    sub N_MOUSE () {	2;}
}
unless(defined(&N_PPP)) {
    sub N_PPP () {	3;}
}
unless(defined(&N_STRIP)) {
    sub N_STRIP () {	4;}
}
unless(defined(&N_AX25)) {
    sub N_AX25 () {	5;}
}
unless(defined(&N_X25)) {
    sub N_X25 () {	6;}
}
unless(defined(&N_6PACK)) {
    sub N_6PACK () {	7;}
}
unless(defined(&N_MASC)) {
    sub N_MASC () {	8;}
}
unless(defined(&N_R3964)) {
    sub N_R3964 () {	9;}
}
unless(defined(&N_PROFIBUS_FDL)) {
    sub N_PROFIBUS_FDL () {	10;}
}
unless(defined(&N_IRDA)) {
    sub N_IRDA () {	11;}
}
unless(defined(&N_SMSBLOCK)) {
    sub N_SMSBLOCK () {	12;}
}
unless(defined(&N_HDLC)) {
    sub N_HDLC () {	13;}
}
unless(defined(&N_SYNC_PPP)) {
    sub N_SYNC_PPP () {	14;}
}
unless(defined(&N_HCI)) {
    sub N_HCI () {	15;}
}
1;
