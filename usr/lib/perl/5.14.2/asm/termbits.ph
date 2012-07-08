require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_TERMBITS_H)) {
    eval 'sub _ASM_POWERPC_TERMBITS_H () {1;}' unless defined(&_ASM_POWERPC_TERMBITS_H);
    eval 'sub NCCS () {19;}' unless defined(&NCCS);
    eval 'sub VINTR () {0;}' unless defined(&VINTR);
    eval 'sub VQUIT () {1;}' unless defined(&VQUIT);
    eval 'sub VERASE () {2;}' unless defined(&VERASE);
    eval 'sub VKILL () {3;}' unless defined(&VKILL);
    eval 'sub VEOF () {4;}' unless defined(&VEOF);
    eval 'sub VMIN () {5;}' unless defined(&VMIN);
    eval 'sub VEOL () {6;}' unless defined(&VEOL);
    eval 'sub VTIME () {7;}' unless defined(&VTIME);
    eval 'sub VEOL2 () {8;}' unless defined(&VEOL2);
    eval 'sub VSWTC () {9;}' unless defined(&VSWTC);
    eval 'sub VWERASE () {10;}' unless defined(&VWERASE);
    eval 'sub VREPRINT () {11;}' unless defined(&VREPRINT);
    eval 'sub VSUSP () {12;}' unless defined(&VSUSP);
    eval 'sub VSTART () {13;}' unless defined(&VSTART);
    eval 'sub VSTOP () {14;}' unless defined(&VSTOP);
    eval 'sub VLNEXT () {15;}' unless defined(&VLNEXT);
    eval 'sub VDISCARD () {16;}' unless defined(&VDISCARD);
    eval 'sub IGNBRK () {0000001;}' unless defined(&IGNBRK);
    eval 'sub BRKINT () {0000002;}' unless defined(&BRKINT);
    eval 'sub IGNPAR () {0000004;}' unless defined(&IGNPAR);
    eval 'sub PARMRK () {0000010;}' unless defined(&PARMRK);
    eval 'sub INPCK () {0000020;}' unless defined(&INPCK);
    eval 'sub ISTRIP () {0000040;}' unless defined(&ISTRIP);
    eval 'sub INLCR () {0000100;}' unless defined(&INLCR);
    eval 'sub IGNCR () {0000200;}' unless defined(&IGNCR);
    eval 'sub ICRNL () {0000400;}' unless defined(&ICRNL);
    eval 'sub IXON () {0001000;}' unless defined(&IXON);
    eval 'sub IXOFF () {0002000;}' unless defined(&IXOFF);
    eval 'sub IXANY () {0004000;}' unless defined(&IXANY);
    eval 'sub IUCLC () {0010000;}' unless defined(&IUCLC);
    eval 'sub IMAXBEL () {0020000;}' unless defined(&IMAXBEL);
    eval 'sub IUTF8 () {0040000;}' unless defined(&IUTF8);
    eval 'sub OPOST () {0000001;}' unless defined(&OPOST);
    eval 'sub ONLCR () {0000002;}' unless defined(&ONLCR);
    eval 'sub OLCUC () {0000004;}' unless defined(&OLCUC);
    eval 'sub OCRNL () {0000010;}' unless defined(&OCRNL);
    eval 'sub ONOCR () {0000020;}' unless defined(&ONOCR);
    eval 'sub ONLRET () {0000040;}' unless defined(&ONLRET);
    eval 'sub OFILL () {00000100;}' unless defined(&OFILL);
    eval 'sub OFDEL () {00000200;}' unless defined(&OFDEL);
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
    eval 'sub XTABS () {00006000;}' unless defined(&XTABS);
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
    eval 'sub VTDLY () {00200000;}' unless defined(&VTDLY);
    eval 'sub VT0 () {00000000;}' unless defined(&VT0);
    eval 'sub VT1 () {00200000;}' unless defined(&VT1);
    eval 'sub CBAUD () {0000377;}' unless defined(&CBAUD);
    eval 'sub B0 () {0000000;}' unless defined(&B0);
    eval 'sub B50 () {0000001;}' unless defined(&B50);
    eval 'sub B75 () {0000002;}' unless defined(&B75);
    eval 'sub B110 () {0000003;}' unless defined(&B110);
    eval 'sub B134 () {0000004;}' unless defined(&B134);
    eval 'sub B150 () {0000005;}' unless defined(&B150);
    eval 'sub B200 () {0000006;}' unless defined(&B200);
    eval 'sub B300 () {0000007;}' unless defined(&B300);
    eval 'sub B600 () {0000010;}' unless defined(&B600);
    eval 'sub B1200 () {0000011;}' unless defined(&B1200);
    eval 'sub B1800 () {0000012;}' unless defined(&B1800);
    eval 'sub B2400 () {0000013;}' unless defined(&B2400);
    eval 'sub B4800 () {0000014;}' unless defined(&B4800);
    eval 'sub B9600 () {0000015;}' unless defined(&B9600);
    eval 'sub B19200 () {0000016;}' unless defined(&B19200);
    eval 'sub B38400 () {0000017;}' unless defined(&B38400);
    eval 'sub EXTA () { &B19200;}' unless defined(&EXTA);
    eval 'sub EXTB () { &B38400;}' unless defined(&EXTB);
    eval 'sub CBAUDEX () {0000000;}' unless defined(&CBAUDEX);
    eval 'sub B57600 () {00020;}' unless defined(&B57600);
    eval 'sub B115200 () {00021;}' unless defined(&B115200);
    eval 'sub B230400 () {00022;}' unless defined(&B230400);
    eval 'sub B460800 () {00023;}' unless defined(&B460800);
    eval 'sub B500000 () {00024;}' unless defined(&B500000);
    eval 'sub B576000 () {00025;}' unless defined(&B576000);
    eval 'sub B921600 () {00026;}' unless defined(&B921600);
    eval 'sub B1000000 () {00027;}' unless defined(&B1000000);
    eval 'sub B1152000 () {00030;}' unless defined(&B1152000);
    eval 'sub B1500000 () {00031;}' unless defined(&B1500000);
    eval 'sub B2000000 () {00032;}' unless defined(&B2000000);
    eval 'sub B2500000 () {00033;}' unless defined(&B2500000);
    eval 'sub B3000000 () {00034;}' unless defined(&B3000000);
    eval 'sub B3500000 () {00035;}' unless defined(&B3500000);
    eval 'sub B4000000 () {00036;}' unless defined(&B4000000);
    eval 'sub BOTHER () {00037;}' unless defined(&BOTHER);
    eval 'sub CIBAUD () {077600000;}' unless defined(&CIBAUD);
    eval 'sub IBSHIFT () {16;}' unless defined(&IBSHIFT);
    eval 'sub CSIZE () {00001400;}' unless defined(&CSIZE);
    eval 'sub CS5 () {00000000;}' unless defined(&CS5);
    eval 'sub CS6 () {00000400;}' unless defined(&CS6);
    eval 'sub CS7 () {00001000;}' unless defined(&CS7);
    eval 'sub CS8 () {00001400;}' unless defined(&CS8);
    eval 'sub CSTOPB () {00002000;}' unless defined(&CSTOPB);
    eval 'sub CREAD () {00004000;}' unless defined(&CREAD);
    eval 'sub PARENB () {00010000;}' unless defined(&PARENB);
    eval 'sub PARODD () {00020000;}' unless defined(&PARODD);
    eval 'sub HUPCL () {00040000;}' unless defined(&HUPCL);
    eval 'sub CLOCAL () {00100000;}' unless defined(&CLOCAL);
    eval 'sub CMSPAR () {010000000000;}' unless defined(&CMSPAR);
    eval 'sub CRTSCTS () {020000000000;}' unless defined(&CRTSCTS);
    eval 'sub ISIG () {0x80;}' unless defined(&ISIG);
    eval 'sub ICANON () {0x100;}' unless defined(&ICANON);
    eval 'sub XCASE () {0x4000;}' unless defined(&XCASE);
    eval 'sub ECHO () {0x8;}' unless defined(&ECHO);
    eval 'sub ECHOE () {0x2;}' unless defined(&ECHOE);
    eval 'sub ECHOK () {0x4;}' unless defined(&ECHOK);
    eval 'sub ECHONL () {0x10;}' unless defined(&ECHONL);
    eval 'sub NOFLSH () {0x80000000;}' unless defined(&NOFLSH);
    eval 'sub TOSTOP () {0x400000;}' unless defined(&TOSTOP);
    eval 'sub ECHOCTL () {0x40;}' unless defined(&ECHOCTL);
    eval 'sub ECHOPRT () {0x20;}' unless defined(&ECHOPRT);
    eval 'sub ECHOKE () {0x1;}' unless defined(&ECHOKE);
    eval 'sub FLUSHO () {0x800000;}' unless defined(&FLUSHO);
    eval 'sub PENDIN () {0x20000000;}' unless defined(&PENDIN);
    eval 'sub IEXTEN () {0x400;}' unless defined(&IEXTEN);
    eval 'sub EXTPROC () {0x10000000;}' unless defined(&EXTPROC);
    eval 'sub TCOOFF () {0;}' unless defined(&TCOOFF);
    eval 'sub TCOON () {1;}' unless defined(&TCOON);
    eval 'sub TCIOFF () {2;}' unless defined(&TCIOFF);
    eval 'sub TCION () {3;}' unless defined(&TCION);
    eval 'sub TCIFLUSH () {0;}' unless defined(&TCIFLUSH);
    eval 'sub TCOFLUSH () {1;}' unless defined(&TCOFLUSH);
    eval 'sub TCIOFLUSH () {2;}' unless defined(&TCIOFLUSH);
    eval 'sub TCSANOW () {0;}' unless defined(&TCSANOW);
    eval 'sub TCSADRAIN () {1;}' unless defined(&TCSADRAIN);
    eval 'sub TCSAFLUSH () {2;}' unless defined(&TCSAFLUSH);
}
1;
