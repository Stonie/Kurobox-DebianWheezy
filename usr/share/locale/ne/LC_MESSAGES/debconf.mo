��    F      L  a   |         o     ?   q  �   �  .   H  #   w     �  '   �     �     �            (   *     S  K   j     �     �     �  -   �     	     	     $	     2	  8   I	  M   �	  k   �	  8   <
  (   u
     �
     �
  u   �
     8     =  X   B  @   �     �     �  ;     6   K  7   �  �   �  /   C  4   s  =   �  Y   �  �  @  )     7   .     f  1   �  '   �  .   �  C        R  �   k     �     �  n        �  @   �     �  &   �           #  '   5     ]  !   v     �  a   �       �    (  �  �   �  �  Y  �   �  |   �  2     X   :     �  3   �  /   �  =     ~   O  B   �  �          U        m  �   z  +   *     V     ^  %   p  x   �  �     -  �  �   !  f   �!     V"  L   f"  (  �"  	   �#     �#    �#  �   %  4   �%  P   �%  �   0&  �   �&  �   L'  E  �'  �   )  v   �)  d   $*  #  �*  U  �+  u   1  l   y1  L   �1  d   32  4   �2  X   �2  b   &3  I   �3  �  �3     c5  /   s5    �5  V   �6  �   �6  A   �7     �7     K8  6   X8  �   �8  Y   9  R   u9  6   �9  �   �9     �:        4      '       A                    =                       0      @                    >       *                  (       3   <   ,   :                 7   /   ;   F               -      D   .   B           8       1                            +   2   #          C             9      %      6          !       $   "   )   
      E      	   5   ?   &    
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
 Usage: debconf [options] command [args] Usage: debconf-communicate [options] [package] Usage: debconf-mergetemplate [options] [templates.ll ...] templates Valid priorities are: %s You are using the editor-based debconf frontend to configure your system. See the end of this document for detailed instructions. _Help apt-extracttemplates failed: %s debconf-mergetemplate: This utility is deprecated. You should switch to using po-debconf's po2debconf program. debconf: can't chmod: %s delaying package configuration, since apt-utils is not installed falling back to frontend: %s must specify some debs to preconfigure no none of the above please specify a package to reconfigure template parse error: %s unable to initialize frontend: %s unable to re-open stdin: %s warning: possible database corruption. Will attempt to repair by adding back missing question %s. yes Project-Id-Version: debconf_po
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-19 19:05-0400
PO-Revision-Date: 2007-07-31 17:23+0545
Last-Translator: Nabin Gautam <nabin@mpp.org.np>
Language-Team: Nepali <info@mpp.org.np>
Language: ne
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2;plural=(n!=1)
X-Generator: KBabel 1.11.4
 
        --outdated		म्याद समाप्त भएका अनुवादमा पनि गाभ्नुहोस् ।
	--drop-old-templates	सम्पूर्ण म्याद समाप्त भएका टेम्प्लेट छोड्नुहोस् । 
  -o,  --owner=package		आदेश स्वीकार गर्ने प्याकेज सेट गर्नुहोस् ।   -f,  --frontend		प्रयोग गरिने debconf फ्रन्टइन्ड निर्दिष्ट गर्नुहोस् ।
  -p,  --priority		देखाइने न्यून प्राथमिकताका प्रश्न निर्दिष्ट गर्नुहोस् ।
       --terse			उत्तम मोड सक्षम पार्नुहोस् ।
 बाहिरिने वस्तुस्थिति %s सँग, %s पहिला कन्फिगर गर्न असफल %s विच्छेद भएको छ वा पूर्णरुपमा स्थापना भएको छैन बाइट %s मा %s फज्जी छ : %s बाइट %s मा %s फज्जी छ: %s; यसलाई छोड्दैछ %s छुटेको छ %s छुटेको छ; %s छोड्दैछ %s स्थापना भएको छैन %s को म्याद समाप्त भएको छ %s को म्याद समाप्त भएको छ; पूरै टेम्प्लेट छोड्दैछ! %s मूलका रुपमा चल्नु पर्दछ (खाली स्थानले पछ्याउने शून्य वा धेरै वस्तु अल्पविरामद्वारा छुट्यायर प्रविष्ट गर्नुहोस् (', ').) पछाडि वस्तुस्थिति फाइल पढ्न सकिँदैन: %s छनौट कन्फिगरेसन फाइलमा निर्दिष्ट नगरिएका डाटाबेस कन्फिगर गर्नुहोस् । %s कन्फिगर गर्दैछ Debconf Debconf को %s Debconf, %s मा चल्दैछ संवाद फ्रन्टइन्ड इमाक्स शेल बफरसँग नमिल्दो छ संवाद फ्रन्टइन्डलाई कम्तिमा १३ लाइन उचाइ र ३१ स्तम्भ चौडाइ भएको पर्दा आवश्यक हुन्छ । संवाद फ्रन्टइन्डले कार्य नगर्ने टर्मिनल, इमाक्स शेल बफर मा कार्य गर्दैन, वा नियन्त्रण टर्मिनल बिना कार्य गर्दैन । तपाईँले चयन गर्न चाहेका वस्तु, खालीस्थानद्वारा छुट्यायर प्रविष्ट गर्नुहोस् । प्याकेजबाट टेम्प्लेट उद्धरण गर्दैछ: %d%% मद्दत अवैध प्राथमिकताको उपेक्षा "%s" आगत मान, "%s" C छनौटमा फेला परेन! यस्तो कहिले पनि हुनुहुँदैन । सम्भवत टेम्प्लेट गलत तरिकाले स्थानीयकरण गरिएको थियो । बढी पछिल्लो उपयोगी संवाद-जस्तो कार्यक्रम स्थापान गरिएको छैन, त्यसैले संवाद आधारित फ्रन्टइन्ड प्रयोग गर्न सकिने छैन । द्रष्टब्य: Debconf वेब मोडमा चलिरहेको छ । http://localhost:%i/ मा जानुहोस् प्याकेज कन्फिगरेसन पहिले कन्फिगर गर्ने प्याकेज ...
 %2$s को %1$s चरणद्वारा परिभाषित समस्या सेटिङ डाटाबेस । TERM सेट गरिएको छैन, त्यसैले फ्रन्टइन्डको संवाद उपयोगी छैन । टेम्प्लेट %s को #%s मा 'टेम्प्लेट:' लाइन समाविष्ट छैन
 टेम्प्लेट %s को #%s मा "%s" नयाँ मान भएको "%s" नक्कली फिल्ड छ ।सम्भवत नयाँ एकल लाइनद्वारा दुइ टेम्प्लेट ठीक तरिकाले छुट्याइएको छैन ।
 कन्फिगरेसन फाइलमा निर्दिष्ट नगरिएका टेम्प्लेट डाटाबेस । चरण #%s को %s मा,`%s' नजिक टेम्प्लेट पदवर्णन त्रुटि
 इमाक्स शेल बफरसँग Term::ReadLine::GNU मिलेको छैन । कन्फिगरेसन फाइलका सिगिल्स र स्माइली विकल्प लामो समयसम्म प्रयोग गरिएका छैनन् । कृपया तिनीहरूलाई हटाउनुहोस् । सम्पादक-आधारित debconf फ्रन्टइन्डले सम्पादन गर्न तपाईँसँग एक वा बढी फाइल भएको पाठसँग प्रस्तुत हुन्छ । यो एउटा त्यस्तै पाठ फाइल हो । यदि तपाईँ मानक युनिक्स कन्फिगरेसन फाइलसँग परिचित हुनुहुन्छ भने, यो फाइल पनि तपाईँलाई परिचित लाग्दछ -- यसमा कन्फिगरेसन वस्तुसँग छरिएका टिप्पणी समाविष्ट हुन्छन् । आवश्यकता अनुरुप कुनै पनि वस्तु परिर्तन गरेर फाइल सम्पादन गर्नुहोस्, र त्यसपछि यसलाई बचत गर्नुहोस् र बाहिरिनुहोस् । यस्तो अवस्था���[��\_~��>o��q�+�9P9if�����z���ٓ��,p�l'sk��X�$��	�F��(΋�O�8I�
]^�R�Z�f7:E:���5�m�/��h$����s����H�}��h, 7ֺ�w� ��@�aqB���Z�����ޖZaY��ȍo��IS��;�f�y]ecsÙ:���Z"թ�K^w�۱nSh@R��8����k�kY�v^��|rL�M�u�ߢ�ø�x��E���?��Z���:_�x�bu��E0�{灕�TR�@��6�����Kd���(��o77���m1����bhP�R�~��&��>�6tY�5`�"��<V�KrMx�a	��ץ^�Q=�U&Zf�8�[�Ҩ��+a�Y_T@Hr���{�⠥��K�l"�UX��Z�B���?�xӵ�Y�+��^x2�`�F�Yq���dF�$�ƨ�U8���-oϪ+�˃��l������[��Ȓ;����	sduO1hS���S��'����}���W��o9�l��ab����h��]3�ص�A^���~K��|�0��Q��ŕ�f'��D��Ҩ@hDn¢�pG�1"G�6[m�&X�AV���#v�~L��$�����q���꥗I��Ar��C7�e�b�p��,P��u��0��u��P���^���f�����|�p�#owgZf.4���apC*qY��8�z��c�m�w��e�x�M|qJ�H�<���Ċޙ(���*�=i�S�m��aV��&"0�f��V��J�Қ���5O��S��#q&p��̚c�y����d!Ф���X��ũ{�"\�Ĝ|5|@���s���M��M�K��֒R(	+����F���ܙ�"ݖ['*�k�X���Bd�0=�մ$�,��9�z��S��W�u��@-.��P��-
o�5A��͏4q~'��_p�1W�R4���?������ޖ�ք�u`��|B��#�~w+�����V�L�i0WQ9Cp^��d�t����A���r)Ȏ**�� ��Oz����S=�Y�����&�D�R]��WO�9��6`*E�"�NuJ��M� ��Ռ�[RkY��l�V8:��CO؂�Q=�ݨ����,���`H�"u���T�Fm��:;�+g2��S�W ��w��MD�Q$a�L��;���'V�ē�D�85��Z���GV��JDjg��?�Pv��[j�=n���i+�L�Mi]���+��d0�aJ��৿�#�E^��v����[DC�žIB6�ķ�4^��V��(c�R��֚$����CP
�ׄ��$N6�����t���W���
�
�n��LSpr�%�>m���K��/ʘ�WQ�d�%�(� �6"!��둔ånh�ц1�c:b�!b��t0o�#�E�ݶ$K��@eM��lٽPs:��b��/�~cz�\�oϨ}"q.wL6��t��9V��!f�{ě�6$T��?�տβX���tT��7���^�1vW�=�x)�ҭ���G��Z��1�Jx�\5��>4 -����E�*1�ȩ��h�6�<%��һ\>Ą½=%�Au��j�n��ꈜGLj������E�k�9�0�a/C�{*;�"1�D�r�?�\Cuhl�wiBr��>��c�^ڜ�J#�qL�R�R3��S�h��ƒ�	^�*=?5�@"�k�1���6�A����&O9���%��9!�7�3�1֌�Gqtz������+-9-��Qj�����4'��)su,�q���b;Wg��l�O��w&:J�bPPp�z�S�A#q7_�]�P�c�#�i�ȧZ�I�Gs��(f�5+���!/��A,W��Bji��gn2�g(
;��8L��9�i↶��O��c�{F���)�J#���d��!�r�n"kO�ץ��zM����%+x17�g`?/i�Q�/c�&�rˋ���Ly��x{Ɇ���&��p�^�����m��!�ك�sJ�JX��$e]7�:\o��̃�Q%R����jƥ��8��aZ�!�)\ft3�خ��Ʊ�U�'Jd���Sw�dw�NcBD3{Ȉ���ʬ����d�����n�$�P����Ȗ?w�M�M�t>%E��MVA��c�n6T��ߣTa���|HN}���K�qO�����B?ٽ�1-z���J��,��J�0�O��@A ��+	/H"r%$sH�$�v��8"d	�$�i���C��{'�?VZ/����t�-�Ӄ6� '<s!�j�l4�{����N�Q1���t$?�F�)P>x�(�Z
d�, ��
C�� �2^{����#�r)Q�'�L��F䝊ɹd��%Su�c-B�be'�TDN�	�>I�$�o�V.j{zp<Q��)��
��~b\����-{�rQʬ���m�'��#���.��(60J���*��&�@�3x�s�
G��[8?h�T_�	��s��3ZHaσ~�+3�����6�d񃘰��i�{!R,6e��|��ۚ���&�kMm:��4����Vq,}����ph��Mu���5�k���I�����T
��ܼ��0k��^h���7���n��U^q)�wލw�,�jV��v������t�e[L�
��t���eAsX���%�Y�5����
��>#���&�򄳙�Ȕ���-,��ϩ�k^����S��Á�7�9]E������wp� ������P
1�R'�M��%>+=`�����Ҳ���{������D���B2�ǚ(X#l��wV/j�����HXn�]�nsr�qV��r�.