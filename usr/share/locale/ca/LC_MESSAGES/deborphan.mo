��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     f  (  ?   �  )   �  &   �  �      -   �  Z     ,   c  !   �  ,   �  S   �  B  3     v  I   �  H   �  F   )  =   p  B   �  D   �  P   6  N   �  L   �  A   #  P   e  B   �  J   �  A   D  J   �  J   �  L     J   i  v   �  H   +   M   t   5   �   #   �   3   !  :   P!  6   �!  .   �!  8   �!  @   *"  @   k"  j   �"  .   #     F#  ~   `#  g   �#  I   G$  @   �$  8   �$  %   %  ;   1%  1   m%  2   �%  �   �%     �&     �&     �&     �&  :   �&  E   ,'  <   r'  M   �'     �'  :   (  �   ?(  B   )  &   E)        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
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
 Project-Id-Version: deborphan 1.7.28.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-05-13 22:28+0000
PO-Revision-Date: 2010-12-12 19:43+0100
Last-Translator: Jordi Mallach <jordi@debian.org>
Language-Team: Catalan <debian-l10n-catalan@lists.debian.org>
Language: ca
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Vegeu també: debophan(1), orphaner(8)
Informeu dels errors a: 
Les següents opcions són disponibles:
 S'ha suprimit «apt». S'està eixint. L'«apt» no és instaŀlat, s'ha trobat dependències trencades o no s'ha pogut el fitxer de blocatge. Sou l'usuari «root»? Es mostrarà la línia d'ordres d'«apt-get» i s'eixirà: «apt-get» ha tornat amb el codi d'error %s. «apt-get» vol suprimir més paquets que els demanats per l'«orphaner». S'està eixint. S'ha suprimit «deborphan». S'està eixint. «deborphan» ha tornat un error. «dialog» ha tornat amb el codi d'error %s. «find-circular» no és implementat actualment per l'«orphaner». S'està eixint. %s %s - Troba paquets dels quals no depenen altres paquets
Distribuït sota els termes de la Llicència Artística.

AQUEST PAQUET ES PROVEEIX «COM ESTÀ» I SENSE CAP GARANTIA EXPRESSA
O IMPLÍCITA, INCLOENT, SENSE CAP LIMITACIÓ, LES GARANTIES IMPLÍCITES
DE COMERCIABILITAT I ADEQUACIÓ PER A UN PROPÒSIT PARTICULAR.
 %s: L'opció és invàlida: %s. %s: Necessiteu «dialog» en el $PATH per a executar aquesta interfície. -df-keep                    Llegeix el fitxer «keepers» de debfoster.
 --find-config               Troba fitxers de configuració «orfes».
 --guess-all                 Intenta fer totes les anteriors.
 --guess-common              Intenta informar dels paquets comuns.
 --guess-data                Intenta informar dels paquets de dades.
 --guess-debug               Intenta informar de les biblioteques de depuració.
 --guess-dev                 Intenta informar dels paquets de desenvolupament.
 --guess-doc                 Intenta informar dels paquets de documentació.
 --guess-dummy               Intenta informar dels paquets buits.
 --gues-interpreters         Intenta informar de les biblioteques d'intèrprets.
 --guess-kernel              Intenta informar de mòduls de nucli.
 --guess-mono                Intenta informar de les biblioteques de mono.
 --guess-only                Utilitza només les opcions --guess.
 --guess-perl                Intenta informar de les biblioteques de perl.
 --guess-pike                Intenta informar de les biblioteques de pike.
 --guess-python              Intenta informar de les biblioteques de python.
 --guess-ruby                Intenta informar de les biblioteques de ruby.
 --guess-section             Intenta informar de les biblioteques en seccions
                            incorrectes.
 --libdevel                  Cerca en libdevel a més de libs i oldlibs.
 --no-df-keep                No llegeixes el fitxer «keepers» de debfoster.
 --no-show-section           No mostres les seccions.
 -A PQTS.. No informes mai de PQTS.
 -H        Descarta els senyaladors de congelació.
 -L        Llista els paquets dels quals no s'informa mai.
 -P        Mostra les prioritats dels paquets trobats.
 -R PQTS.. Suprimeix PQTS del fitxer «keep».
 -Z        Elimina tots els paquets del fitxer «keep».
 -a        Compara tots els paquets, no només les biblioteques.
 -d        Mostra les dependències dels paquets que en tinguen.
 -e LLISTA Treballa com si els paquets de la LLISTA no
                            estigueren instaŀlats.
 -f FITXER Utilitza FITXER com fitxer d'estat.
 -h        Aquesta ajuda.
 -k FITXER Utilitza FITXER per a obtenir/emmagatzemar la
                            informació sobre els paquets conservats.
 -n        Inhabilita les comprovacions per a «recomana» i
                            «suggereix».
 -n        Habilita les comprovacions per a «recomana» i «suggereix».
 -p PRIOR  Selecciona només els paquets amb prioritat >= PRIOR.
 -s        Mostra les seccions on es troben els paquets.
 -v        Informació de la versió.
 -z        Mostra la mida instaŀlada dels paquets trobats.
 Inhabilita les comprovacions per a «recomana».
 Inhabilita les comprovacions per a «suggereix».
 S'ha especificat explícitament un fitxer «status», o s'ha demanat l'omisió de l'execució de l'«apt-get». Es mostrarà la línia d'ordres de l'«apt-get» i s'eixirà: El nom base és invàlid: %s. No s'ha trobat cap paquet orfe. Premeu Intro per a continuar. S'està suprimint %s La pantalla és massa petita o establiu $LINES i $COLUMNS. Vegeu orphaner(8) i deborphan(1) per a una llista d'opcions vàlides. Seleccioneu els paquets a suprimir o canceŀleu per a eixir: Seleccioneu els paquets els quals deborphan mai hauria de recomanar eliminar: Simula El fitxer «status» sembla ser invàlid. S'està eixint.
 El fitxer «status» és en un estat incorrecte.
Un o més paquets estan marcats com a mig-instaŀlat, mig-configurat, desempaquetat, espera-d'activadors o pendent-d'activadors. S'està eixint.
 Forma d'ús: %s [--help|--purge|--skip-apt] [opcions de deborphan] Forma d'ús: %s [OPCIONS] [PAQUET]…
 