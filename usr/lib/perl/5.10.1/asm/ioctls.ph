require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_POWERPC_IOCTLS_H)) {
    eval 'sub _ASM_POWERPC_IOCTLS_H () {1;}' unless defined(&_ASM_POWERPC_IOCTLS_H);
    require 'asm/ioctl.ph';
    eval 'sub FIOCLEX () { &_IO(ord(\'f\'), 1);}' unless defined(&FIOCLEX);
    eval 'sub FIONCLEX () { &_IO(ord(\'f\'), 2);}' unless defined(&FIONCLEX);
    eval 'sub FIOASYNC () { &_IOW(ord(\'f\'), 125, \'int\');}' unless defined(&FIOASYNC);
    eval 'sub FIONBIO () { &_IOW(ord(\'f\'), 126, \'int\');}' unless defined(&FIONBIO);
    eval 'sub FIONREAD () { &_IOR(ord(\'f\'), 127, \'int\');}' unless defined(&FIONREAD);
    eval 'sub TIOCINQ () { &FIONREAD;}' unless defined(&TIOCINQ);
    eval 'sub FIOQSIZE () { &_IOR(ord(\'f\'), 128,  &loff_t);}' unless defined(&FIOQSIZE);
    eval 'sub TIOCGETP () { &_IOR(ord(\'t\'), 8, 1;}' unless defined(&TIOCGETP);
    eval 'sub TIOCSETP () { &_IOW(ord(\'t\'), 9, 1;}' unless defined(&TIOCSETP);
    eval 'sub TIOCSETN () { &_IOW(ord(\'t\'), 10, 1;}' unless defined(&TIOCSETN);
    eval 'sub TIOCSETC () { &_IOW(ord(\'t\'), 17, 1;}' unless defined(&TIOCSETC);
    eval 'sub TIOCGETC () { &_IOR(ord(\'t\'), 18, 1;}' unless defined(&TIOCGETC);
    eval 'sub TCGETS () { &_IOR(ord(\'t\'), 19, 1;}' unless defined(&TCGETS);
    eval 'sub TCSETS () { &_IOW(ord(\'t\'), 20, 1;}' unless defined(&TCSETS);
    eval 'sub TCSETSW () { &_IOW(ord(\'t\'), 21, 1;}' unless defined(&TCSETSW);
    eval 'sub TCSETSF () { &_IOW(ord(\'t\'), 22, 1;}' unless defined(&TCSETSF);
    eval 'sub TCGETA () { &_IOR(ord(\'t\'), 23, 1;}' unless defined(&TCGETA);
    eval 'sub TCSETA () { &_IOW(ord(\'t\'), 24, 1;}' unless defined(&TCSETA);
    eval 'sub TCSETAW () { &_IOW(ord(\'t\'), 25, 1;}' unless defined(&TCSETAW);
    eval 'sub TCSETAF () { &_IOW(ord(\'t\'), 28, 1;}' unless defined(&TCSETAF);
    eval 'sub TCSBRK () { &_IO(ord(\'t\'), 29);}' unless defined(&TCSBRK);
    eval 'sub TCXONC () { &_IO(ord(\'t\'), 30);}' unless defined(&TCXONC);
    eval 'sub TCFLSH () { &_IO(ord(\'t\'), 31);}' unless defined(&TCFLSH);
    eval 'sub TIOCSWINSZ () { &_IOW(ord(\'t\'), 103, 1;}' unless defined(&TIOCSWINSZ);
    eval 'sub TIOCGWINSZ () { &_IOR(ord(\'t\'), 104, 1;}' unless defined(&TIOCGWINSZ);
    eval 'sub TIOCSTART () { &_IO(ord(\'t\'), 110);}' unless defined(&TIOCSTART);
    eval 'sub TIOCSTOP () { &_IO(ord(\'t\'), 111);}' unless defined(&TIOCSTOP);
    eval 'sub TIOCOUTQ () { &_IOR(ord(\'t\'), 115, \'int\');}' unless defined(&TIOCOUTQ);
    eval 'sub TIOCGLTC () { &_IOR(ord(\'t\'), 116, 1;}' unless defined(&TIOCGLTC);
    eval 'sub TIOCSLTC () { &_IOW(ord(\'t\'), 117, 1;}' unless defined(&TIOCSLTC);
    eval 'sub TIOCSPGRP () { &_IOW(ord(\'t\'), 118, \'int\');}' unless defined(&TIOCSPGRP);
    eval 'sub TIOCGPGRP () { &_IOR(ord(\'t\'), 119, \'int\');}' unless defined(&TIOCGPGRP);
    eval 'sub TIOCEXCL () {0x540c;}' unless defined(&TIOCEXCL);
    eval 'sub TIOCNXCL () {0x540d;}' unless defined(&TIOCNXCL);
    eval 'sub TIOCSCTTY () {0x540e;}' unless defined(&TIOCSCTTY);
    eval 'sub TIOCSTI () {0x5412;}' unless defined(&TIOCSTI);
    eval 'sub TIOCMGET () {0x5415;}' unless defined(&TIOCMGET);
    eval 'sub TIOCMBIS () {0x5416;}' unless defined(&TIOCMBIS);
    eval 'sub TIOCMBIC () {0x5417;}' unless defined(&TIOCMBIC);
    eval 'sub TIOCMSET () {0x5418;}' unless defined(&TIOCMSET);
    eval 'sub TIOCM_LE () {0x1;}' unless defined(&TIOCM_LE);
    eval 'sub TIOCM_DTR () {0x2;}' unless defined(&TIOCM_DTR);
    eval 'sub TIOCM_RTS () {0x4;}' unless defined(&TIOCM_RTS);
    eval 'sub TIOCM_ST () {0x8;}' unless defined(&TIOCM_ST);
    eval 'sub TIOCM_SR () {0x10;}' unless defined(&TIOCM_SR);
    eval 'sub TIOCM_CTS () {0x20;}' unless defined(&TIOCM_CTS);
    eval 'sub TIOCM_CAR () {0x40;}' unless defined(&TIOCM_CAR);
    eval 'sub TIOCM_RNG () {0x80;}' unless defined(&TIOCM_RNG);
    eval 'sub TIOCM_DSR () {0x100;}' unless defined(&TIOCM_DSR);
    eval 'sub TIOCM_CD () { &TIOCM_CAR;}' unless defined(&TIOCM_CD);
    eval 'sub TIOCM_RI () { &TIOCM_RNG;}' unless defined(&TIOCM_RI);
    eval 'sub TIOCM_OUT1 () {0x2000;}' unless defined(&TIOCM_OUT1);
    eval 'sub TIOCM_OUT2 () {0x4000;}' unless defined(&TIOCM_OUT2);
    eval 'sub TIOCM_LOOP () {0x8000;}' unless defined(&TIOCM_LOOP);
    eval 'sub TIOCGSOFTCAR () {0x5419;}' unless defined(&TIOCGSOFTCAR);
    eval 'sub TIOCSSOFTCAR () {0x541a;}' unless defined(&TIOCSSOFTCAR);
    eval 'sub TIOCLINUX () {0x541c;}' unless defined(&TIOCLINUX);
    eval 'sub TIOCCONS () {0x541d;}' unless defined(&TIOCCONS);
    eval 'sub TIOCGSERIAL () {0x541e;}' unless defined(&TIOCGSERIAL);
    eval 'sub TIOCSSERIAL () {0x541f;}' unless defined(&TIOCSSERIAL);
    eval 'sub TIOCPKT () {0x5420;}' unless defined(&TIOCPKT);
    eval 'sub TIOCPKT_DATA () {0;}' unless defined(&TIOCPKT_DATA);
    eval 'sub TIOCPKT_FLUSHREAD () {1;}' unless defined(&TIOCPKT_FLUSHREAD);
    eval 'sub TIOCPKT_FLUSHWRITE () {2;}' unless defined(&TIOCPKT_FLUSHWRITE);
    eval 'sub TIOCPKT_STOP () {4;}' unless defined(&TIOCPKT_STOP);
    eval 'sub TIOCPKT_START () {8;}' unless defined(&TIOCPKT_START);
    eval 'sub TIOCPKT_NOSTOP () {16;}' unless defined(&TIOCPKT_NOSTOP);
    eval 'sub TIOCPKT_DOSTOP () {32;}' unless defined(&TIOCPKT_DOSTOP);
    eval 'sub TIOCNOTTY () {0x5422;}' unless defined(&TIOCNOTTY);
    eval 'sub TIOCSETD () {0x5423;}' unless defined(&TIOCSETD);
    eval 'sub TIOCGETD () {0x5424;}' unless defined(&TIOCGETD);
    eval 'sub TCSBRKP () {0x5425;}' unless defined(&TCSBRKP);
    eval 'sub TIOCSBRK () {0x5427;}' unless defined(&TIOCSBRK);
    eval 'sub TIOCCBRK () {0x5428;}' unless defined(&TIOCCBRK);
    eval 'sub TIOCGSID () {0x5429;}' unless defined(&TIOCGSID);
    eval 'sub TIOCGRS485 () {0x542e;}' unless defined(&TIOCGRS485);
    eval 'sub TIOCSRS485 () {0x542f;}' unless defined(&TIOCSRS485);
    eval 'sub TIOCGPTN () { &_IOR(ord(\'T\'),0x30, \'unsigned int\');}' unless defined(&TIOCGPTN);
    eval 'sub TIOCSPTLCK () { &_IOW(ord(\'T\'),0x31, \'int\');}' unless defined(&TIOCSPTLCK);
    eval 'sub TIOCSERCONFIG () {0x5453;}' unless defined(&TIOCSERCONFIG);
    eval 'sub TIOCSERGWILD () {0x5454;}' unless defined(&TIOCSERGWILD);
    eval 'sub TIOCSERSWILD () {0x5455;}' unless defined(&TIOCSERSWILD);
    eval 'sub TIOCGLCKTRMIOS () {0x5456;}' unless defined(&TIOCGLCKTRMIOS);
    eval 'sub TIOCSLCKTRMIOS () {0x5457;}' unless defined(&TIOCSLCKTRMIOS);
    eval 'sub TIOCSERGSTRUCT () {0x5458;}' unless defined(&TIOCSERGSTRUCT);
    eval 'sub TIOCSERGETLSR () {0x5459;}' unless defined(&TIOCSERGETLSR);
    eval 'sub TIOCSER_TEMT () {0x1;}' unless defined(&TIOCSER_TEMT);
    eval 'sub TIOCSERGETMULTI () {0x545a;}' unless defined(&TIOCSERGETMULTI);
    eval 'sub TIOCSERSETMULTI () {0x545b;}' unless defined(&TIOCSERSETMULTI);
    eval 'sub TIOCMIWAIT () {0x545c;}' unless defined(&TIOCMIWAIT);
    eval 'sub TIOCGICOUNT () {0x545d;}' unless defined(&TIOCGICOUNT);
}
1;
