��       �     �   �  	�      �  �  �   h  �   �  
  i  �   �  e     �        %  !   5  G     }     �     �   !  �     �     �     �                6     W     r   	  �     �   6  �   '  �   '  	   "  1   4  T   *  �   .  �     �   
  �     �               .     @     ]     u     �     �     �     �     �     �               4     I     b     u     }     �     �     �     �     �          *   %  J   &  p   #  �   #  �   #  �   !     (  %   <  N   %  �     �      �     �   #       3     S   #  k   %  �   ?  �   	  �     �   %       9     I     Y     k     �     �     �     �     �     �     �                    4  8     m          �     �     �     �     �     �          %     .     C     L     ]   '  b     �   &  �   	  �     �     �     �     �     �             "  /     R     _     l     u   *  ~   $  �   +  �   #  �   7     %  V   "  |   4  �   (  �   (  �      &      6      I      ]      n            �      �      �   
   �   &   �   '   �   ,  !     !E     !Z     !^      !z  �  !�  �  #5   v  &*    &�  �  '�   �  )R     *     *   ,  *6   C  *c     *�     *�     *�   ,  *�     *�     +     +'     +@     +W     +o     +�   !  +�     +�     +�   @  +�   1  ,9   1  ,k   %  ,�   @  ,�   *  -   1  -/     -a     -q     -     -�     -�     -�     -�     -�     .     .     .+     .>     .R     .g     .{     .�     .�     .�   $  .�     .�     /   #  /     /2     /9     /X   "  /l   (  /�   )  /�   0  /�   -  0   /  0A   ,  0q   *  0�   /  0�   1  0�   4  1+   K  1`   7  1�   %  1�   *  2
   $  25   *  2Z   &  2�   !  2�   +  2�   1  2�   H  3,     3u     3�   )  3�     3�     3�     3�     3�     4     40     4G     4X     4k     4�     4�     4�     4�     4�   =  4�     57     5L     5^   !  5u     5�     5�     5�     5�     6      6     6     66   #  6?     6c   )  6h     6�   +  6�     6�     6�     6�     7     7	     7     77     7<   $  7[   
  7�   	  7�   	  7�     7�   (  7�   '  7�   2  7�   "  8,   =  8O   *  8�   (  8�   >  8�   &  9    '  9G     9o     9�     9�     9�     9�     9�     9�     9�     9�     :   .  :   /  :F   4  :v     :�     :�   #  :�   (  :�                  $                  y   M   C   E                 �           :   ~   6   |   9      �   �      m                      K       W   }   k   ^   �      �   "   X       =   p   -   I   t      �   2   V       F   �   \   �   	   �           #       b   J          /   e   i   �   H   c       1   _         5   g             T   ?                    @   l   {              +   <   �       '   A   
   *   q       [   a               �   .   �   f   L   U       0          n   G   v   �   �   (                 �       w   )           4       o       7       B   !   �          ;   &   Y               �   u       S           �   8      %   s   �   R   d   Q   N       >   j           �   x   ,   z          �       ]      �   O      D      �   Z   r   `   P               �   �   h              3           -h --help            Show this help
    -V --version         Show version
    -D --browse-domains  Browse for browsing domains instead of services
    -a --all             Show all services, regardless of the type
    -d --domain=DOMAIN   The domain to browse in
    -v --verbose         Enable verbose mode
    -t --terminate       Terminate after dumping a more or less complete list
    -c --cache           Terminate after dumping all entries from the cache
    -l --ignore-local    Ignore local services
    -r --resolve         Resolve services found
    -f --no-fail         Don't fail if the daemon is not available
    -p --parsable        Output in parsable format
     -k --no-db-lookup    Don't lookup service types
    -b --dump-db         Dump service type database
 %s [options]

    -h --help            Show this help
    -s --ssh             Browse SSH servers
    -v --vnc             Browse VNC servers
    -S --shell           Browse both SSH and VNC
    -d --domain=DOMAIN   The domain to browse in
 %s [options] %s <host name ...>
%s [options] %s <address ... >

    -h --help            Show this help
    -V --version         Show version
    -n --name            Resolve host name
    -a --address         Resolve address
    -v --verbose         Enable verbose mode
    -6                   Lookup IPv6 address
    -4                   Lookup IPv4 address
 %s [options] <new host name>

    -h --help            Show this help
    -V --version         Show version
    -v --verbose         Enable verbose mode
 : All for now
 : Cache exhausted
 <i>No service currently selected.</i> A NULL terminated list of service types to browse for Access denied Address Address family An unexpected D-Bus error occured Avahi Discovery Avahi SSH Server Browser Avahi VNC Server Browser Avahi Zeroconf Browser Avahi client failure: %s Avahi domain browser failure: %s Avahi resolver failure: %s Bad number of arguments
 Bad state Browse Service Types Browse for Zeroconf services available on your network Browse for Zeroconf-enabled SSH Servers Browse for Zeroconf-enabled VNC Servers Browse service type list is empty! Browsing for service type %s in domain %s failed: %s Browsing for services in domain <b>%s</b>: Browsing for services on <b>local network</b>: Browsing... Canceled.
 Change domain Choose SSH server Choose Shell Server Choose VNC server Client failure, exiting: %s
 Connecting to '%s' ...
 DNS failure: FORMERR DNS failure: NOTAUTH DNS failure: NOTIMP DNS failure: NOTZONE DNS failure: NXDOMAIN DNS failure: NXRRSET DNS failure: REFUSED DNS failure: SERVFAIL DNS failure: YXDOMAIN DNS failure: YXRRSET Daemon connection failed Daemon not running Desktop Disconnected, reconnecting ...
 Domain E Ifce Prot %-*s %-20s Domain
 E Ifce Prot Domain
 Established under name '%s'
 Failed to add address: %s
 Failed to add service: %s
 Failed to add subtype '%s': %s
 Failed to connect to Avahi server: %s Failed to create address resolver: %s
 Failed to create browser for %s: %s Failed to create client object: %s
 Failed to create domain browser: %s Failed to create entry group: %s
 Failed to create host name resolver: %s
 Failed to create resolver for %s of type %s in domain %s: %s Failed to create simple poll object.
 Failed to parse address '%s'
 Failed to parse port number: %s
 Failed to query host name: %s
 Failed to query version string: %s
 Failed to read Avahi domain: %s Failed to register: %s
 Failed to resolve address '%s': %s
 Failed to resolve host name '%s': %s
 Failed to resolve service '%s' of type '%s' in domain '%s': %s
 Host Name Host name conflict
 Host name successfully changed to %s
 Initializing... Invalid DNS TTL Invalid DNS class Invalid DNS return code Invalid DNS type Invalid Error Code Invalid RDATA Invalid address Invalid argument Invalid configuration Invalid domain name Invalid flags Invalid host name Invalid interface index Invalid number of arguments, expecting exactly one.
 Invalid operation Invalid packet Invalid port number Invalid protocol specification Invalid record Invalid record key Invalid service name Invalid service subtype Invalid service type Is empty Local name collision Location Memory exhausted Name Name collision, picking new name '%s'.
 No command specified.
 No suitable network protocol available Not found Not permitted Not supported OK OS Error Operation failed Port Resource record key is pattern Server version: %s; Host name: %s
 Service Name Service Type TXT Data Terminal The IP port number of the resolved service The TXT data of the resolved service The address family for host name resolution The address of the resolved service The domain to browse in, or NULL for the default domain The host name of the resolved service The object passed in was not valid The requested operation is invalid because redundant The service name of the selected service The service type of the selected service Timeout reached Too few arguments
 Too many arguments
 Too many clients Too many entries Too many objects Type Version mismatch Waiting for daemon ...
 _Domain... avahi_domain_browser_new() failed: %s
 avahi_service_browser_new() failed: %s
 avahi_service_type_browser_new() failed: %s
 execlp() failed: %s
 n/a service_browser failed: %s
 service_type_browser failed: %s
 Project-Id-Version: audit-viewer
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2010-07-13 03:02+0200
PO-Revision-Date: 2009-04-18 22:48+0100
Last-Translator: Cornelius Neckenig <tbull@fedoraproject.org>
Language-Team: German <fedora-trans-de@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Poedit-Language: German
     -h --help            Zeigt diese Hilfe an
    -V --version         Zeigt die Version an
    -D --browse-domains  Durchsuche nach suchenden Domain statt nach Diensten
    -a --all             Zeigt alle Dienste, ohne Rücksicht auf die Typen
    -d --domain=DOMAIN   Die Domain zum Durchsuchen
    -v --verbose         Aktiviert detaillierten Modus
    -t --terminate       Beenden nach Ausgeben einer mehr oder weniger kompletten Liste
    -c --cache           Beenden nach Ausgeben aller Einträge aus dem Cache
    -l --ignore-local    Ignoriere lokale Dienste
    -r --resolve         Löse gefundene Dienste auf
    -f --no-fail         Schlägt nicht fehl, wenn der Daemon nicht verfügbar ist
    -p --parsable        Ausgabe in parsbaren Format
     -k --no-db-lookup    Schlage Dienst-Typen nicht nach
    -b --dump-db         Anzeigen der Dienst-Typen-Datenbank
 %s [options]

    -h --help            Zeigt diese Hilfe an
    -s --ssh             Durchsuchen nach SSH-Servern
    -v --vnc             Durchsuchen nach VNC-Server
    -S --shell           Durchsuchen nach beiden (SSH und VNC)
    -d --domain=DOMAIN   Die Domain zum Durchsuchen
 %s [options] %s <host name ...>
%s [options] %s <address ... >

    -h --help            Zeigt diese Hilfe an
    -V --version         Zeigt die Version an
    -n --name            Löst Hostname auf
    -a --address         Löst Addresse auf
    -v --verbose         Aktiviert detaillierten Modus
    -6                   Schlägt IPv6-Addresse nach
    -4                   Schlägt IPv4-Addresse nach
 %s [options] <new host name>

    -h --help            Zeigt diese Hilfe an
    -V --version         Zeigt die Version an
    -v --verbose         Aktiviert detaillierten Modus
 : Alle Einträge bisher
 : Datencache erschöpft
 <i>Momentan ist kein Dienst ausgewählt.</i> Ein mit NULL abgeschlossene Liste der Dienst-Typen zum Durchsuchen  Zugriff verweigert Adresse Adress-Familie Ein unerwarteter DBus-Fehler ist aufgetreten Avahi Discovery Avahi SSH Server Browser Avahi VNC-Server-Browser Avahi Zeroconf Browser Avahi-Client-Fehler: %s Avahi-Domainbrowser-Fehler: %s Avahi-Auflösungsfehler: %s Ungültige Anzahl von Argumenten
 Ungültiger Zustand Durchsuche Dienst-Typen Durchsuchen nach Zeroconf-aktivierten Diensten in Ihrem Netzwerk Durchsuchen nach Zeroconf-aktivierten SSH-Servern Durchsuchen nach Zeroconf-aktivierten VNC-Servern Die Liste der Service-Typen ist leer! Durchsuchen nach Dienst-Typen %s in Domain %s fehlgeschlagen: %s Durchsuche Domain <b>%s</b> nach Diensten: Durchsuche <b>lokales Netzwerk</b> nach Diensten: Durchsuchen ... Abgebrochen.
 Domain ändern SSH-Dienst auswählen Shell-Server auswählen VNC-Server auswählen Client-Fehler, beende: %s
 Verbinde zu '%s' ...
 DNS-Fehler: FORMERR DNS-Fehler: NOTAUTH DNS-Fehler: NOTIMP DNS-Fehler: NOTZONE DNS-Fehler: NXDOMAIN DNS-Fehler: NXRRSET DNS-Fehler: REFUSED DNS-Fehler: SERVFAIL DNS-Fehler: YXDOMAIN DNS-Fehler: YXRRSET Verbindung zum Daemon fehlgeschlagen Daemon läuft nicht Desktop Nicht verbunden, neu verbinden ...
 Domain E Ifce Prot %-*s %-20s-Domain
 E Ifce Prot-Domain
 Eingerichtet unter dem Namen '%s'
 Fehler beim Hinzufügen der Adresse: %s
 Fehler beim Hinzufügen des Dienstes: %s
 Fehler beim Hinzufügen des Untertyps: '%s': %s
 Verbindung zu Avahi-Server fehlgeschlagen: %s Fehler beim Erzeugen des Adress-Auflösers: %s
 Browser-Erzeugung für %s fehlgeschlagen: %s Clientobjekt-Erzeugung fehlgeschlagen: %s
 Erzeugen eines Domainbrowser fehlgeschlagen: %s Fehler bei der Erzeugung der Einstiegsgruppe: %s
 Fehler beim Erzeugen des Rechneramen-Auflösers: %s
 Erzeugen eines Resolvers für %s vom Typ %s in Domain %s fehlgeschlagen: %s Fehler beim Erzeugen eines einfachen Abfrage-Objekts: 
 Fehler beim Parsern der Adresse '%s'
 Parsen der Port-Nummer fehlgeschlagen: %s
 Hostname-Abfrage fehlgeschlagen: %s
 Versionsstring-Abfrage fehlgeschlagen: %s
 Fehler beim Lesen der Avahi-Domain: %s Registrierung fehlgeschlagen: %s
 Fehler beim Auflösen der Adresse '%s': %s
 Fehler beim Auflösen des Rechnernamens '%s': %s
 Fehler beim Auflösen des Dienstes '%s' des Typ '%s' in Domain '%s': %s
 Rechner-Name Rechnername-Konflikt
 Rechnername erfolgreich geändert auf %s
 Initialisieren ... Ungültige DNS-TTL Ungültige DNS-Klasse Ungültiger DNS-Rückgabewert Ungültiger DNS-Typ Ungültiger Fehlercode Ungültige RDATA Ungültige Adresse Ungültiges Argument Ungültige Konfiguration Ungültiger Domainname Ungültige Flags Ungültiger Rechnername Ungültiger Schnittstellenindex Ungültige Anzahl von Argumenten, erwartet wird genau eines.
 Ungültige Operation Ungültiges Paket Ungültige Port-Nummer Ungültige Protokollspezifikation Ungültiger Datensatz Ungültiger Datensatzschlüssel Ungültiger Dienstname Ungültiger Dienst-Untertyp Ungültiger Diensttyp ist leer Lokale Namenskollision Standort Verfügbarer Speicher ausgeschöpft Name Namenskollision, wähle neuen Name '%s'.
 Kein Befehl angegeben.
 Kein passendes Netzwerkprotokoll verfügbar Nicht gefunden Nicht erlaubt Nicht unterstützt OK Betriebssystemfehler Operation fehlgeschlagen Port Datensatzschlüssel ist Muster Server-Version: %s; Rechnername: %s
 Dienstname Diensttyp TXT-Daten Terminal Die IP-Port-Nummer des Auflösungsdienst Die TXT-Daten des aufgelösten Dienstes Die Adress-Familie zum Auflösen der Rechner-Namen Die Adresse des Auflösungsdiensts DIe Domain zum Durchsuchen oder NULL für die Standard-Domain Der Rechner-Name des aufgelösten Dienstes Das übergebene Objekt ist nicht gültig Die angeforderte Operation ist ungültig, da sie redundant ist Der Dienst-Name des gewählten Diensts Der Service-Type des gewählten Diensts Auszeit erreicht Zu wenige Argumente
 Zu viele Argumente
 Zu viele Clients Zu viele Einträge Zu viele Objekte Typ Unpassende Version Warte auf Daemon ...
 _Domain ... avahi_domain_browser_new() fehlgeschlagen: %s
 avahi_service_browser_new() fehlgeschlagen: %s
 avahi_service_type_browser_new() fehlgeschlagen: %s
 execlp() fehlgeschlagen: %s
 k.A. service_browser fehlgeschlagen: %s
 service_type_browser fehlgeschlagen: %s
 