��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     Z  (  8   �  %   �      �  �     -   �  V   �  &   *  !   Q  .   s  J   �  A  �     /  E   I  =   �  F   �  ;     @   P  <   �  J   �  B     F   \  =   �  F   �  >   (  A   g  6   �  A   �  A   "  C   d  A   �  Q   �  O   <  B   �  0   �  !          "   :   @   +   {   )   �   0   �   9   !  5   <!  >   r!  "   �!     �!  ;   �!  B   )"  @   l"  3   �"  .   �"     #  8   0#  (   i#  &   �#  |   �#     6$  '   N$     v$  
   �$  3   �$  G   �$  >   %  G   Z%     �%  /   �%  �   �%  <   �&     �&        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
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
 Project-Id-Version: deborphan
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-05-13 22:28+0000
PO-Revision-Date: 2010-11-26 22:45+0200
Last-Translator: Joe Hansen <joedalton2@yahoo.dk>
Language-Team: Danish <debian-l10n-danish@lists.debian.org> 
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Se også: deborphan(1), orphaner(8)
Rapporter fejl til: 
Følgende tilvalg er tilgængelige:
 »apt« blev fjernet. Afslutter. »apt« er ikke installeret, ødelagte afhængigheder fundet eller kunne ikke åbne låsefil, er du administrator? Viser kommandolinjen »apt-get« og afslutter: »apt-get« returnede med afslutningskode %s. »apt-get« forsøger at fjerne flere pakker end anmodt om af »orphaner«. Afslutter. »deborphan« blev fjernet. Afslutter. »deborphan« returnede med fejl. »dialog« returnerede med afslutningskode %s. »find-circular« er aktuelt ikke understøttet af »orphaner«. Afslutter %s %s - Find pakker der ingen pakker har, som afhænger af dem
Distributeret under betingelserne i den artistiske licens.

DENNE PAKKE TILBYDES »SOM DEN ER« OG UDEN NOGEN DIREKTE ELLER
INDIREKTE GARANTIER, INKLUSIVE, UDEN BEGRÆNSNING, DE UNDERFORSTÅENDE
GARANTIER FOR SALGSBARHED OG EGNETHED TIL ET SPECIFIK FORMÅL.
 %s: Ugyldigt tilvalg: %s. %s: Du skal bruge »dialog« i $PATH for at køre denne grænseflade. --df-keep                   Læs debfosters fil »keepers«.
 --find-config               Find »forældreløse« opsætningsfiler.
 --guess-all                 Prøv alle af de ovenstående.
 --guess-common              Prøv at rapportere fælles pakker.
 --guess-data                Prøv at rapportere datapakker.
 --guess-debug               Prøv at rapportere fejlsøgningsbiblioteker.
 --guess-dev                 Prøv at rapportere udviklingspakker.
 --guess-doc                 Prøv at rapportere dokumentationspakker.
 --guess-dummy               Prøv at rapportere dummypakker.
 --guess-interpreters        Prøv at rapportere fortolkerbiblioteker.
 --guess-kernel              Prøv at rapportere kernemoduler.
 --guess-mono                Prøv at rapportere monobiblioteker.
 --guess-only                Brug kun --guess tilvalg.
 --guess-perl                Prøv at rapportere perlbiblioteker.
 --guess-pike                Prøv at rapportere pikebiblioteker.
 --guess-python              Prøv at rapportere pythonbiblioteker.
 --guess-ruby                Prøv at rapportere rubybiblioteker.
 --guess-section             Prøv at rapporter biblioteker i forkerte sektioner.
 --libdevel                  Søg i libdevel udover de normale libs og oldlibs.
 --no-df-keep                Læs ikke debfosters fil »keepers«.
 --no-show-section           Vis ikke sektioner.
 -A PKGR.. Rapporter aldrig PKGR.
 -H        Ignorer hold flag.
 -L        Vis de pakker som aldrig er blevet rapporteret.
 -P        Vis prioritet på fundne pakker.
 -R PKGS.. Fjern PKGS fra filen »keep«.
 -Z        Fjern alle pakker fra filen »keep«.
 -a        Sammenlign alle pakker, ikke bare biblioteker.
 -d        Vis afhængigheder for pakker der har dem.
 -e LIST   Virker som hvis pakker i LIST ikke var installeret.
 -f FIL    Brug FIL som statusfil.
 -h        Denne hjælp.
 -k FIL    Brug FIL til at hente/lagre info omkring pakker.
 -n        Deaktiver kontrol efter »recommends« og »suggests«.
 -n        Aktiver kontrol efter »recommends« og »suggests«.
 -p PRIOR  Vælg kun pakker med prioritet >= PRIOR.
 -s        Vis de sektioner som pakkerne er i.
 -v        Versionsinformation.
 -z        Vis installeret størrelse på fundne pakker.
 Deaktiver kontrol efter »recommends«.
 Deaktiver kontrol efter »suggests«.
 Eksplicit specificeret statusfil eller anmodt kald »apt-get« springes over. Viser kommandolinjen »apt-get« og afslutter: Ugyldigt basisnavn: %s. Ingen »forældreløse« pakker fundet. Tryk retur for at fortsætte. Fjerner %s Skærm for lille, eller indstil $LINES og $COLUMNS. Se orphaner(8) og deborphan(1) for en liste over tilgængelige tilvalg. Vælg pakker der skal fjernes, eller annuller for at afslutte: Vælg pakker der aldrig skal blive anbefalet til fjernelse i deborphan: Simuler Statusfil er sandsynligvis ugyldig. Afslutter.
 Statusfilen er i en uheldig tilstand.
En eller flere pakker er markeret som værende delvis installeret,
delvis konfigureret, uudpakket, udløserventet eller udløserafventende.
Afslutter.
 Brug: %s [--help|--purge|--skip-apt] [tilvalg for deborphan] Brug: %s [TILVALG] [PAKKE]...
 