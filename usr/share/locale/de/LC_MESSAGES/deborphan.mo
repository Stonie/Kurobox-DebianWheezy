��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     �  (  <   �  )   �     #  �   A  )   �  X   (  #   �  '   �  .   �  I   �  j  F     �  B   �  G     H   W  :   �  C   �  =     H   ]  B   �  F   �  >   0  J   o  >   �  C   �  <   =  C   z  C   �  E     C   H  p   �  x   �  M   v   9   �      �   +   !  :   I!  8   �!  0   �!  7   �!  :   &"  ?   a"  e   �"  )   #     1#  h   I#  <   �#  6   �#  >   &$  :   e$  "   �$  :   �$  *   �$  (   )%  �   R%     �%  !   &  /   $&     T&  8   e&  F   �&  D   �&  M   *'  
   x'  0   �'  �   �'  ;   p(  !   �(        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
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
 Project-Id-Version: deborphan 1.7.28+nmu1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-05-13 22:28+0000
PO-Revision-Date: 2010-11-21 18:30+0100
Last-Translator: Helge Kreutzmann <debian@helgefjell.de>
Language-Team: de <debian-l10n-german@lists.debian.org>
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 
Siehe auch: deborphan(1), orphaner(8)
Melden Sie Fehler an: 
Die folgenden Optionen sind verfügbar:
 »apt« wurde entfernt. Ende. »apt« ist nicht installiert, defekte Abhängigkeiten wurden gefunden oder die Lock-Datei konnte nicht geöffnet werden. Sind Sie root? Befehlszeile von »apt-get« wird ausgegeben. Ende: »apt-get« gab den Exit-Code %s zurück. »apt-get« versucht mehr Pakete zu entfernen, als von »orphaner« erbeten wurde. Ende. »deborphan« wurde entfernt. Ende. »deborphan« gab einen Fehler zurück. »dialog« gab den Beendigungscode %s zurück. »find-circular« wird derzeit vom »orphaner« nicht unterstützt. Ende. %s %s - Findet Pakete, von denen keine anderen Pakete abhängen FIXME
Vertrieben unter den Bedingungen der »Artistic License«.

DIE SOFTWARE WIRD »WIE VORLIEGEND« GELIEFERT, OHNE JEGLICHE GEWÄHRLEISTUNG,
WEDER AUSDRÜCKLICH NOCH STILLSCHWEIGEND, EINSCHLIESSLICH, ABER NICHT
BESCHRÄNKT AUF, MÄNGELGEWÄHRLEISTUNGEN UND EIGNUNG FÜR EINEN BESTIMMTEN ZWECK.
 %s: Ungültige Option: %s. %s: Für diese Oberfläche muss sich »dialog« im $PATH befinden. --df-keep                   Liest die »keepers«-Datei von debfoster.
 --find-config               Findet »verwaiste« Konfigurationsdateien.
 --guess-all                 Versucht alles oben genannte.
 --guess-common              Versucht, allgemeine Pakete zu melden.
 --guess-data                Versucht, Datenpakete zu melden.
 --guess-debug               Versucht, Debugging-Bibliotheken zu melden.
 --guess-dev                 Versucht, Entwicklerpakete zu melden.
 --guess-doc                 Versucht, Dokumentationspakete zu melden.
 --guess-dummy               Versucht, Pseudopakete zu melden.
 --guess-interpreters        Versucht, Interpreter-Bibliotheken zu melden.
 --guess-kernel              Versucht, Kernelmodule zu melden.
 --guess-mono                Versucht, Mono-Bibliotheken zu melden.
 --guess-only                Verwendet nur Optionen --guess.
 --guess-perl                Versucht, Perl-Bibliotheken zu melden.
 --guess-pike                Versucht, Pike-Bibliotheken zu melden.
 --guess-python              Versucht, Python-Bibliotheken zu melden.
 --guess-ruby                Versucht, Ruby-Bibliotheken zu melden.
 --guess-section             Versucht, Bibliotheken in falschen Bereichen zu
                            melden.
 --libdevel                  Sucht zusätzlich zu »libs« und »oldlibs« ini
                            »libdevel«.
 --no-df-keep                Liest nicht die »keepers«-Datei von debfoster.
 --no-show-section           Zeigt die Bereiche nicht an.
 -A PKT..  Niemals PKT melden.
 -H        Ignoriert »hold«-Markierungen.
 -L        Listet die Pakete auf, die nie gemeldet werden.
 -P        Zeigt die Prioritäten der gefundenen Pakete.
 -R PKGS.. Entfernt PKGS aus der »keep«-Datei.
 -Z        Entfernt alle Pakete aus der »keep«-Datei.
 -a        Vergleicht alle Pakete, nicht nur Bibliotheken.
 -d        Zeigt Abhängigkeiten für Pakete, die welche haben.
 -e LISTE  Funktioniert, als ob Pakete in LISTE nicht
                            installiert wären.
 -f DATEI  Benutzt DATEI als Statusdatei.
 -h        Diese Hilfe.
 -k DATEI  Benutzt DATEI als Informationsspeicher für zu
                            behaltende Pakete.
 -n        Prüft nicht auf »Recommends« und »Suggests«.
 -n        Prüft auf »Recommends« und »Suggests«.
 -p PRIO   Wählt nur Pakete mit einer Priorität >= PRIO aus.
 -s        Zeigt die Bereiche, in welchen die Pakete sind.
 -v        Versions-Informationen.
 -z        Zeigt den Platzverbrauch der gefundenen Pakete.
 Prüfungen auf »Recommends« abschalten.
 Prüfungen auf »Suggests« abschalten.
 Explizit angegebene Statusdatei oder Anweisung, den Aufruf von »apt-get« zu überspringen. Befehlszeile für »apt-get« wird ausgegeben. Ende: Ungültiger Programmname: %s. Keine verwaisten Pakete gefunden. Drücken Sie die Eingabetaste, um fortzufahren. %s wird entfernt Bildschirm zu klein oder setzen Sie $LINES und $COLUMNS. Siehe orphaner(8) und deborphan(1) für eine Liste gültiger Optionen. Wählen Sie die Pakete zum Entfernen oder »Abbrechen« zum Beenden: Wählen Sie die Pakete, die Deborphan niemals zum Entfernen vorschlagen soll: Simulieren Statusdatei ist wahrscheinlich ungültig. Ende.
 Die Statusdatei ist in einem ungültigen Zustand.
Ein oder mehrere Pakete sind als halb-installiert, halb-konfiguriert,
entpackt, Trigger-erwartend oder Trigger-anhängig markiert. Ende.
 Aufruf: %s [--help|--purge|--skip-apt] [deborphan-Optionen] Aufruf: %s [OPTIONEN] [PAKET]...
 