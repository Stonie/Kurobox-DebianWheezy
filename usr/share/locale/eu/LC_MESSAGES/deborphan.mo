��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     �  (  L   �  #   8     \  �   w  ,   &  T   S      �  $   �  +   �  6     &  Q     x  B   �  O   �  J   &  4   q  A   �  A   �  I   *  I   t  I   �  E     o   N  E   �  G     <   L  F   �  G   �  H     F   a  O   �  I   �  R   B   0   �   (   �   +   �   _   !  6   {!  4   �!  >   �!  =   &"  5   d"  l   �"  3   #     ;#  h   T#  a   �#  B   $  >   b$  $   �$  #   �$  \   �$  '   G%  '   o%  �   �%     &&      F&     g&  
   �&  5   �&  C   �&  -   '  K   :'     �'  ;   �'  �   �'  =   �(  %   �(        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
           >       A   4   <                 "      	   B   $   :                     9       7       @         +    
See also: deborphan(1), orphaner(8)
Report bugs to: 
The following options are available:
 "apt" got removed.  Exiting. "apt" is not installed, broken dependencies found or could not open lock file, are you root?  Printing "apt-get" commandline and exiting: "apt-get" returned with exitcode %s. "apt-get" tries to remove more packages than requested by "orphaner".  Exiting. "deborphan" got removed.  Exiting. "deborphan" returned with error. "dialog" returned with exitcode %s. "find-circular" is currently not supported by "orphaner".  Exiting. %s %s - Find packages without other packages depending on them
Distributed under the terms of the Artistic License.

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 %s: Invalid option: %s. %s: You need "dialog" in $PATH to run this frontend. --df-keep                   Read debfoster's "keepers" file.
 --find-config               Find "orphaned" configuration files.
 --guess-all                 Try all of the above.
 --guess-common              Try to report common packages.
 --guess-data                Try to report data packages.
 --guess-debug               Try to report debugging libraries.
 --guess-dev                 Try to report development packages.
 --guess-doc                 Try to report documentation packages.
 --guess-dummy               Try to report dummy packages.
 --guess-interpreters        Try to report interpreter libraries.
 --guess-kernel              Try to report kernel modules.
 --guess-mono                Try to report mono libraries.
 --guess-only                Use --guess options only.
 --guess-perl                Try to report perl libraries.
 --guess-pike                Try to report pike libraries.
 --guess-python              Try to report python libraries.
 --guess-ruby                Try to report ruby libraries.
 --guess-section             Try to report libraries in wrong sections.
 --libdevel                  Search in libdevel in addition to libs and oldlibs.
 --no-df-keep                Do not read debfoster's "keepers" file.
 --no-show-section           Do not show sections.
 -A PKGS.. Never report PKGS.
 -H        Ignore hold flags.
 -L        List the packages that are never reported.
 -P        Show priority of packages found.
 -R PKGS.. Remove PKGS from the "keep" file.
 -Z        Remove all packages from the "keep" file.
 -a        Compare all packages, not just libs.
 -d        Show dependencies for packages that have them.
 -e LIST   Work as if packages in LIST were not installed.
 -f FILE   Use FILE as statusfile.
 -h        This help.
 -k FILE   Use FILE to get/store info about kept packages.
 -n        Disable checks for `recommends' and `suggests'.
 -n        Enable checks for `recommends' and `suggests'.
 -p PRIOR  Select only packages with priority >= PRIOR.
 -s        Show the sections the packages are in.
 -v        Version information.
 -z        Show installed size of packages found.
 Disable checks for `recommends'.
 Disable checks for `suggests'.
 Explicitly specified status file or requested calling "apt-get" to be skipped.  Printing "apt-get" commandline and exiting: Invalid basename: %s. No orphaned packages found. Press enter to continue. Removing %s Screen too small or set $LINES and $COLUMNS. See orphaner(8) and deborphan(1) for a list of valid options. Select packages for removal or cancel to quit: Select packages that should never be recommended for removal in deborphan: Simulate Status file is probably invalid. Exiting.
 The status file is in an improper state.
One or more packages are marked as half-installed, half-configured,
unpacked, triggers-awaited or triggers-pending. Exiting.
 Usage: %s [--help|--purge|--skip-apt] [deborphan options] Usage: %s [OPTIONS] [PACKAGE]...
 Project-Id-Version: deborphan_1.7.28+nmu1_eu
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-05-13 22:28+0000
PO-Revision-Date: 2010-11-20 17:05+0100
Last-Translator: Iñaki Larrañaga Murgoitio <dooteo@euskalgnu.org>
Language-Team: Basque <debian-l10n-basque@lists.debian.org>
Language: eu
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.11.4
Plural-Forms: nplurals=2; plural=(n != 1);
 
Irakurri: deborphan(1), orphaner(8)
Erroreei buruzko txostenak hona bidali: 
Honako aukerak daude erabilgarri:
 "apt" ezabatuta. Irtetzen. "apt" ez dago instalatuta, hautsitako mendekotasunak aurkitu dira edo ezin izan da blokeoko fitxategia ireki, 'root' al zara? "apt-get" komando-lerroa erakusten eta irtetzen: "apt-get"-ek irteerako '%s' kodea itzuli du. "orphaner"-ek eskatutako baino pakete gehiago kentzen saiatu da "apt-get". Irtetzen. "deborphan" ezabatuta. Irtetzen. "deborphan"-ek errore bat itzuli du. "dialog"-ek irteerako '%s' kodea itzuli du. "orphaner"-ek ez du "find-circular"onartzen. Irtetzen. %s%s - Beste paketeen gain mendekotasunik sortzen ez dituzten paketeak bilatu
"Artistic License" lizentziaren baldintzetan banatua.

PAKETE HAU "HONELA" BANATZEN DA INOLAKO BERMERIK GABE;
ERA BEREAN EZ DA BERMATZEN BERAREN EGOKITASUNA MERKATURATZEKO
EDO HELBURU PARTIKULARRETARAKO ERABILTZEKO.
 %s: aukera baliogabea: %s. %s: "dialog" $PATH aldagaian behar duzu interfaze hau erabiltzeko. --df-keep                   Irakurri debfoster-en 'mantentzaileak' fitxategia.
 --find-config               Bilatu konfigurazioko fitxategi "umezurtzak".
 --guess-all                 Saiatu goiko guztiekin.
 --guess-common              Saiatu pakete arrunten berri ematen.
 --guess-data                Saiatu datuen paketeen berri ematen.
 --guess-debug               Saiatu arazketako liburutegien berri ematen.
 --guess-dev                 Saiatu garapeneko liburutegien berri ematen.
 --guess-doc                 Saiatu dokumentazioen paketeen berri ematen.
 --guess-dummy               Saiatu gezurrezko paketeen berri ematen.
 --guess-interpreters        Saiatu interpretatzailearen liburutegien berri
                            ematen.
 --guess-kernel              Saiatu kernelaren moduluen berri ematen.
 --guess-mono                Saiatu mono-ren liburutegien berri ematen.
 --guess-only                Erabili --guess aukerak soilik.
 --guess-perl                Saiatu perl-en liburutegien berri ematen.
 --guess-pike                Saiatu pike-ren liburutegien berri ematen.
 --guess-python              Saiatu python-en liburutegien berri ematen.
 --guess-ruby                Saiatu rubyren liburutegien berri ematen.
 --guess-section             Saiatu okerreko ataleko liburutegien berri ematen.
 --libdevel                  Bilatu libdevel-en libs eta oldlibs-ez gain.
 --no-df-keep                Ez irakurri debfoster-en 'mantentzaileak' fitxategia.
 --no-show-section           Ez erakutsi atalak.
 -A PKTK.. Inoiz ez PKTK-ren berri eman.
 -H        Ezikusi egin mantentze-banderei.
 -L        Zerrendatu paketeak (hauen berri inoiz eman ez
                            direnak).
 -P        Erakutsi aurkitutako paketeen lehentasunak.
 -R PKTK.. Kendu PKTK 'mantenimenduko' fitxategitik.
 -Z        Kendu pakete guztiak 'mantenimenduko' fitxategitik.
 -a        Parekatu pakete guztiak, ez liburutegiak bakarrik.
 -d        Erakutsi paketeek dituzten mendekotasunak.
 -e EZ     Zerrendako pakete guztiak instalaturik EZ
                            baleude bezala funtzionatu.
 -f FITX   Erabili FITX egoeraren fitxategi bezala.
 -h        Laguntza hau.
 -k FITX   Erabili FITX paketeei buruzko informazioa
                            eskuratzeko/gordetzeko.
 -n        Desgaitu 'iradokitutako' eta 'gomendatutako'
                            egiaztapenak.
 -n        Gaitu 'iradokitutako' eta 'gomendatutako' egiaztapenak.
 -p LEHEN  Hautatu lehentasuna >= LEHEN duten paketeak soilik.
 -s        Erakutsi paketeen atalak.
 -v        Bertsioaren informazioa.
 -z        Erakutsi aurkitutako paketeen instalatutako
                            tamainak.
 Desgaitu 'gomendatutako' egiaztapenak.
 Desgaitu 'iradokitutako' egiaztapenak.
 Esplizitoki zehaztutako egoeraren fitxategia edo eskatutako "apt-get" deia saltatu egingo da. "apt-get" komando-lerroa erakusten eta irtetzen: Oinarrizko izen baliogabea: %s. Ez da pakete umezurtzik aurkitu. Sakatu Sartu tekla jarraitzeko. %s kentzen Pantaila txikiegia da edo ezarri $LINES eta $COLUMNS. Ikus ophaner(8) eta deborphan(1) aukera erabilgarrien zerrendarako. Hautatu paketeak kentzeko edo utzi irtetzeko: Hautatu paketeak (deborphan-en ezabatzea inoiz gomendatu behar ez direnak): Simulatu Egoeraren fitxategia baliteke baliogabea izatea. Irtetzen.
 Egoeraren fitxategia egoera desegoki batean dago.
Pakete bat edo gehiago erdi instalatuta, erdi konfiguratuta, 
deskonprimituta, abiarazlearen zain edo abiarazlearen erabakiaren zain
bezala markatuta dago. Irtetzen.
 Erabilera: %s [--help|--purge|--skip-apt] [deborphan aukerak] Erabilera: %s [AUKERAK] [PAKETEA]...
 