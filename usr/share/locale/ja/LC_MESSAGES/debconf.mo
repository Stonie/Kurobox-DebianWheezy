Þ    G      T  a           o     ?        Á  .   X  #        «  '   Æ     î     ü          +  (   :     c  K   z     Æ     Ë     ç  -   ï     	     ,	     4	     B	  8   Y	  M   	  k   à	  8   L
  (   
     ®
     ³
  u   Ò
     H     M  X   R  @   «     ì       ;     6   [  7        Ê  /   S  4     =   ¸  Y   ö  Ã  P  )     7   >     v  1     '   Ç  .   ï  C     F  b     ©     Â     D     J  n   j     Ù  @   ò     3  &   P     w     z  '        ´  !   Í     ï  a        m  b  q     Ô  ]   m  Ç   Ë  :     K   Î  ,     =   G       -     -   É  !   ÷  C     0   ]  d        ó  7   ú     2  N   9          ¤     ¬     »  \   Ô  r   1  ¾   ¤  Q   c  E   µ  	   û  0     ×   6            ¤     m   Á     /   2   H   e   {   o   á   G   Q!  å   !  Z   "  _   Ú"  l   :#  w   §#  ª  $  Y   Ê&  H   $'  =   m'  U   «'  :   (  B   <(  e   (  Ë  å(  4   ±*  Ã   æ*     ª+  .   ¸+     ç+  "   |,  f   ,  :   -  <   A-  	   ~-     -  9   -  4   Ï-  :   .  1   ?.     q.     /        4      '       B                    >                       0      A                    ?       *                  (       3   =   ,   ;                 8   /   <   6               -      E   .   C           9       1                            +   2   #          D   G         :      %      7          !       $   "   )   
      F      	   5   @   &    
        --outdated		Merge in even outdated translations.
	--drop-old-templates	Drop entire outdated templates. 
  -o,  --owner=package		Set the package that owns the command.   -f,  --frontend		Specify debconf frontend to use.
  -p,  --priority		Specify minimum priority question to show.
       --terse			Enable terse mode.
 %s failed to preconfigure, with exit status %s %s is broken or not fully installed %s is fuzzy at byte %s: %s %s is fuzzy at byte %s: %s; dropping it %s is missing %s is missing; dropping %s %s is not installed %s is outdated %s is outdated; dropping whole template! %s must be run as root (Enter zero or more items separated by a comma followed by a space (', ').) Back Cannot read status file: %s Choices Config database not specified in config file. Configuring %s Debconf Debconf on %s Debconf, running at %s Dialog frontend is incompatible with emacs shell buffers Dialog frontend requires a screen at least 13 lines tall and 31 columns wide. Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal. Enter the items you want to select, separated by spaces. Extracting templates from packages: %d%% Help Ignoring invalid priority "%s" Input value, "%s" not found in C choices! This should never happen. Perhaps the templates were incorrectly localized. More Next No usable dialog-like program is installed, so the dialog based frontend cannot be used. Note: Debconf is running in web mode. Go to http://localhost:%i/ Package configuration Preconfiguring packages ...
 Problem setting up the database defined by stanza %s of %s. TERM is not set, so the dialog frontend is not usable. Template #%s in %s does not contain a 'Template:' line
 Template #%s in %s has a duplicate field "%s" with new value "%s". Probably two templates are not properly separated by a lone newline.
 Template database not specified in config file. Template parse error near `%s', in stanza #%s of %s
 Term::ReadLine::GNU is incompatable with emacs shell buffers. The Sigils and Smileys options in the config file are no longer used. Please remove them. The editor-based debconf frontend presents you with one or more text files to edit. This is one such text file. If you are familiar with standard unix configuration files, this file will look familiar to you -- it contains comments interspersed with configuration items. Edit the file, changing any items as necessary, and then save it and exit. At that point, debconf will read the edited file, and use the values you entered to configure the system. This frontend requires a controlling tty. Unable to load Debconf::Element::%s. Failed because: %s Unable to start a frontend: %s Unknown template field '%s', in stanza #%s of %s
 Usage: debconf [options] command [args] Usage: debconf-communicate [options] [package] Usage: debconf-mergetemplate [options] [templates.ll ...] templates Usage: dpkg-reconfigure [options] packages
  -a,  --all			Reconfigure all packages.
  -u,  --unseen-only		Show only not yet seen questions.
       --default-priority	Use default priority instead of low.
       --force			Force reconfiguration of broken packages.
       --no-reload		Do not reload templates. (Use with caution.) Valid priorities are: %s You are using the editor-based debconf frontend to configure your system. See the end of this document for detailed instructions. _Help apt-extracttemplates failed: %s debconf-mergetemplate: This utility is deprecated. You should switch to using po-debconf's po2debconf program. debconf: can't chmod: %s delaying package configuration, since apt-utils is not installed falling back to frontend: %s must specify some debs to preconfigure no none of the above please specify a package to reconfigure template parse error: %s unable to initialize frontend: %s unable to re-open stdin: %s warning: possible database corruption. Will attempt to repair by adding back missing question %s. yes Project-Id-Version: debconf
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-19 19:05-0400
PO-Revision-Date: 2010-03-09 00:08+0900
Last-Translator: Kenshi Muto <kmuto@debian.org>
Language-Team: Debian Japanese list <debian-japanese@lists.debian.org>
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
        --outdated		æä»£éãã®ç¿»è¨³ã§ããã¼ã¸ããã
	--drop-old-templates	ãã¹ã¦ã®æä»£éãã®ãã³ãã¬ã¼ããç ´æ£ããã 
  -o,  --owner=ããã±ã¼ã¸		ã³ãã³ããææããããã±ã¼ã¸ãè¨­å®ããã   -f,  --frontend		å©ç¨ãã debconf ãã­ã³ãã¨ã³ããæå®ããã
  -p,  --priority		è¡¨ç¤ºããæå°åªååº¦ãæå®ããã
       --terse			ç°¡æ½ã¢ã¼ããæå¹ã«ããã
 %s ã¯çµäºã³ã¼ã %s ã§åè¨­å®ã«å¤±æãã¾ãã %s ã¯å£ãã¦ããããå®å¨ã«ã¤ã³ã¹ãã¼ã«ããã¦ãã¾ãã %s ã¯ %s ãã¤ãã§ãã¡ã¸ã¼ã§ã: %s %s ã¯ %s ãã¤ãã§ãã¡ã¸ã¼ã§ã: %s; ç¡è¦ãã¾ã %s ãããã¾ãã %s ãããã¾ããã%s ãç¡è¦ãã¾ã %s ã¯ã¤ã³ã¹ãã¼ã«ããã¦ãã¾ãã %s ã®ç¿»è¨³ã¯å¤ããã®ã§ã %s ã¯å¤ããã®ã§ããå¨ãã³ãã¬ã¼ããç¡è¦ãã¾ã! %s ã¯ root ã§å®è¡ããå¿è¦ãããã¾ã (ã³ã³ãã¨ç©ºç½ (', ') ã§åºåããªãã 0 åä»¥ä¸ã®é ç®ãå¥åãã¦ãã ããã) æ»ã ã¹ãã¼ã¿ã¹ãã¡ã¤ã«ãèª­ã¿è¾¼ãã¾ãã: %s é¸æ è¨­å®ãã¼ã¿ãã¼ã¹ãè¨­å®ãã¡ã¤ã«ã§æå®ããã¦ãã¾ããã %s ãè¨­å®ãã¦ãã¾ã Debconf %s ã® Debconf Debconf, %s ã«ã¦å®è¡ Dialog ãã­ã³ãã¨ã³ãã¯ emacs ã®ã·ã§ã«ãããã¡ã¨äºææ§ãããã¾ãã Dialog ãã­ã³ãã¨ã³ãã¯ãããªãã¨ã 13 è¡ãããå¹ 31 æå­ããç»é¢ãå¿è¦ã¨ãã¾ãã Dialog ãã­ã³ãã¨ã³ãã¯ãã ã¿ã¼ããã«ãemacs ã®ã·ã§ã«ãããã¡ããããã¯ã¦ã¼ã¶ãå¶å¾¡ãã¦ããã¿ã¼ããã«ã§ã¯ãªãå ´åã«ã¯åä½ãã¾ããã ç©ºç½ã§åºåããªãããé¸æãããé ç®ãå¥åãã¦ãã ããã ããã±ã¼ã¸ãããã³ãã¬ã¼ããå±éãã¦ãã¾ã: %d%% ãã«ã ä¸æ­£ãªãã­ããã£ "%s" ãç¡è¦ãã¾ã å¥åå¤ "%s" ã¯ C ã«ãããé¸æè¢ã«ã¯ããã¾ãã! ããã¯èµ·ããã¯ãããªããã¨ã§ãããã³ãã¬ã¼ããã¡ã¤ã«ãæ­£ããã­ã¼ã«ã©ã¤ãºããã¦ããªãæããããã¾ãã ç§»å æ¬¡ã¸ å©ç¨å¯è½ãª dialog ç³»ã®ãã­ã°ã©ã ãã¤ã³ã¹ãã¼ã«ããã¦ããªãããããã¤ã¢ã­ã°å½¢å¼ã®ãã­ã³ãã¨ã³ãã¯ä½¿ç¨ã§ãã¾ããã æ³¨æ: Debconf ã¯ã¦ã§ãã¢ã¼ãã§åä½ãã¦ãã¾ããhttp://localhost:%i/ ããè¦§ãã ããã ããã±ã¼ã¸ã®è¨­å® ããã±ã¼ã¸ãäºåè¨­å®ãã¦ãã¾ã ...
 %2$s ã® %1$s ã§å®ç¾©ããããã¼ã¿ãã¼ã¹ãè¨­å®ããã®ã«åé¡ãçºçãã¾ããã TERM ãè¨­å®ããã¦ããªãã®ã§ãdialog ãã­ã³ãã¨ã³ããå©ç¨ãããã¨ã¯ã§ãã¾ããã %2$s ã®ãã³ãã¬ã¼ã #%1$s ã« `Template:' è¡ãããã¾ãã
 %2$s ã®ãã³ãã¬ã¼ã #%1$s ã«ãæ°ããå¤ "%4$s" ã "%3$s" ã®ãã£ã¼ã«ãã«éè¤ãã¦ããã¾ãã2ã¤ã®ãã³ãã¬ã¼ãã1ã¤ã®æ¹è¡ã«ããæ­£ããåå²ããã¦ããªãã®ããããã¾ããã
 ãã³ãã¬ã¼ããã¼ã¿ãã¼ã¹ãè¨­å®ãã¡ã¤ã«ã§æå®ããã¦ãã¾ããã %3$s ã®ã¹ã¿ã³ã¶ %2$s ã® `%1$s' ä»è¿ã§ãã³ãã¬ã¼ãã®è§£æã«å¤±æãã¾ãã
 Term::ReadLine::GNU ãã­ã³ãã¨ã³ãã¯ emacs ã®ã·ã§ã«ãããã¡ã¨äºææ§ãããã¾ããã è¨­å®ãã¡ã¤ã«ã® Sigils ã¨ Smileys ãªãã·ã§ã³ã¯ä½¿ãããªããªãã¾ãããåé¤ãã¦ãã ããã ã¨ãã£ã¿ãã¼ã¹ã® debconf ãã­ã³ãã¨ã³ãã¯ã1 ã¤ä»¥ä¸ã®ãã­ã¹ããã¡ã¤ã«ãç·¨éç¨ã«æä¾ãã¾ããããã¯ãã®ç·¨éç¨ãã¡ã¤ã«ã® 1 ã¤ã§ããããªããæ¨æºçãª UNIX ã®è¨­å®ãã¡ã¤ã«ã«æ£ãã¦ããã°ããã®ãã¡ã¤ã«ã¯ããããããã§ãããããã®ãã¡ã¤ã«ã«ã¯ãè¨­å®é ç®ã¨ã¨ãã«ã¨ããã©ããã«ã³ã¡ã³ããããã¾ãããã¡ã¤ã«ãç·¨éãã¦å¿è¦ã«å¿ãã¦é ç®ãå¤æ´ãããã¡ã¤ã«ãä¿å­ãã¦ã¨ãã£ã¿ãçµäºãã¦ä¸ããããã®ã¨ããdebconf ã¯ç·¨éããããã¡ã¤ã«ãèª­ã¿è¾¼ã¿ãå¥åãããå¤ãã·ã¹ãã ã®è¨­å®ã«å©ç¨ãã¾ãã ãã®ãã­ã³ãã¨ã³ãã¯ã¦ã¼ã¶ãæä½ãã¦ãã tty ãå¿è¦ã¨ãã¾ãã Debconf::Element::%s ãã­ã¼ãã§ãã¾ãã. å¤±æããçç±: %s ãã­ã³ãã¨ã³ãã®èµ·åãã§ãã¾ããã§ãã: %s ä¸æãªãã³ãã¬ã¼ããã£ã¼ã«ã '%1$s' ã %3$s ã® #%2$s ã«ããã¾ã
 ä½¿ãæ¹: debconf [ãªãã·ã§ã³] ã³ãã³ã [å¼æ°] ä½¿ãæ¹: debconf-communicate [ãªãã·ã§ã³] [ããã±ã¼ã¸] ä½¿ãæ¹: debconf-mergetemplate [ãªãã·ã§ã³] [ãã³ãã¬ã¼ã.è¨èª ...] ãã³ãã¬ã¼ã Usage: dpkg-reconfigure [ãªãã·ã§ã³] ããã±ã¼ã¸
  -a,  --all			ãã¹ã¦ã®ããã±ã¼ã¸ãåè¨­å®ããã
  -u,  --unseen-only		ã¾ã ç¤ºãã¦ããªãè³ªåã®ã¿ãè¡¨ç¤ºããã
       --default-priority	low ã®ä»£ããã«ããã©ã«ãã®åªååº¦ãä½¿ãã
       --force			å£ããããã±ã¼ã¸ã®åè¨­å®ãå¼·å¶çã«è¡ãã
       --no-reload		ãã³ãã¬ã¼ããåèª­ã¿è¾¼ã¿ããªãã(æ³¨æãã¦å©ç¨ã®ãã¨) æå¹ãªãã­ããã£ã¯æ¬¡ã®ã¨ããã§ã: %s ã·ã¹ãã ãè¨­å®ããããã«ãã¨ãã£ã¿ãã¼ã¹ã® debconf ãã­ã³ãã¨ã³ããä½¿ç¨ãã¦ãã¾ããè©³ããèª¬æã¯ãã®ãã­ã¥ã¡ã³ãã®æå¾ãè¦ã¦ãã ããã ãã«ã(_H) apt-extracttemplates ã«å¤±æãã¾ãã: %s debconf-mergetemplate: ãã®ã¦ã¼ãã£ãªãã£ã¯å¤ããã®ã§ããpo-debconf ã® po2debconf ãã­ã°ã©ã ã«åãæ¿ããã¹ãã§ãã debconf: chmod ã§ãã¾ãã: %s apt-utilsãã¤ã³ã¹ãã¼ã«ããã¦ããªããããããã±ã¼ã¸ã®è¨­å®ãéããã¾ãã ãã­ã³ãã¨ã³ãããã©ã¼ã«ããã¯ãã¾ã: %s preconfigureããdebãã¡ã¤ã«ãæå®ãã¦ãã ãã ããã ä¸è¨ä»¥å¤ åè¨­å®ããããã±ã¼ã¸ãæå®ãã¦ãã ãã ãã³ãã¬ã¼ãã®è§£æã«å¤±æãã¾ãã: %s ãã­ã³ãã¨ã³ãã®åæåã«å¤±æãã¾ãã: %s æ¨æºå¥åãåãªã¼ãã³ã§ãã¾ãã: %s è­¦å: ãã¼ã¿ãã¼ã¹ãç ´å£ããã¦ããæããããã¾ããè¶³ããªãè³ªå %s ãè¿½å ãããã¨ã«ããä¿®æ­£ãããã¨è©¦ã¿ã¾ãã ã¯ã 