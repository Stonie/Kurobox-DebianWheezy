��    G      T  a   �        o     ?   �  �   �  .   X  #   �     �  '   �     �     �          +  (   :     c  K   z     �     �     �  -   �     	     ,	     4	  Q   B	     �	  8   �	  M   �	  k   2
  8   �
  (   �
             u   $     �     �  X   �  @   �     >     T  ;   q  6   �  7   �  �     /   �  4   �  =   
  Y   H  �  �  )   f  7   �     �  1   �  '     .   A  C   p     �  �   �     O     U  n   u     �  @   �     >  &   [     �     �  '   �     �  !   �     �  a        x  l  |  �   �  L   �  �   �  ?   �  9   
  (   D  B   m     �     �     �     �  G     *   `  u   �       0        ?  X   P     �     �     �  y   �     K  H   h  h   �  {     Y   �  3   �     $  8   1  �   j     &     3  �   @  Y   �     -  '   E  i   m  U   �  C   -   �   q   T   E!  X   �!  G   �!  �   ;"  }  �"  D   ;%  I   �%  '   �%  L   �%  4   ?&  ;   t&  P   �&  *   '  �   ,'     �'     �'  �   (  *   �(  J   �(  *   )  A   =)     )  !   �)  >   �)  '   �)  -   *  )   ;*  �   e*     �*        5       (       B                    >                       1      ,                !   ?       +                  )       4   =   -   ;                 8   0   <   G               .      E   /   C           9   A   2                               3   $          D             :      &      7          "       %   #   *   
      F      	   6   @   '    
        --outdated		Merge in even outdated translations.
	--drop-old-templates	Drop entire outdated templates. 
  -o,  --owner=package		Set the package that owns the command.   -f,  --frontend		Specify debconf frontend to use.
  -p,  --priority		Specify minimum priority question to show.
       --terse			Enable terse mode.
 %s failed to preconfigure, with exit status %s %s is broken or not fully installed %s is fuzzy at byte %s: %s %s is fuzzy at byte %s: %s; dropping it %s is missing %s is missing; dropping %s %s is not installed %s is outdated %s is outdated; dropping whole template! %s must be run as root (Enter zero or more items separated by a comma followed by a space (', ').) Back Cannot read status file: %s Choices Config database not specified in config file. Configuring %s Debconf Debconf on %s Debconf was not configured to display this error message, so it mailed it to you. Debconf, running at %s Dialog frontend is incompatible with emacs shell buffers Dialog frontend requires a screen at least 13 lines tall and 31 columns wide. Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal. Enter the items you want to select, separated by spaces. Extracting templates from packages: %d%% Help Ignoring invalid priority "%s" Input value, "%s" not found in C choices! This should never happen. Perhaps the templates were incorrectly localized. More Next No usable dialog-like program is installed, so the dialog based frontend cannot be used. Note: Debconf is running in web mode. Go to http://localhost:%i/ Package configuration Preconfiguring packages ...
 Problem setting up the database defined by stanza %s of %s. TERM is not set, so the dialog frontend is not usable. Template #%s in %s does not contain a 'Template:' line
 Template #%s in %s has a duplicate field "%s" with new value "%s". Probably two templates are not properly separated by a lone newline.
 Template database not specified in config file. Template parse error near `%s', in stanza #%s of %s
 Term::ReadLine::GNU is incompatable with emacs shell buffers. The Sigils and Smileys options in the config file are no longer used. Please remove them. The editor-based debconf frontend presents you with one or more text files to edit. This is one such text file. If you are familiar with standard unix configuration files, this file will look familiar to you -- it contains comments interspersed with configuration items. Edit the file, changing any items as necessary, and then save it and exit. At that point, debconf will read the edited file, and use the values you entered to configure the system. This frontend requires a controlling tty. Unable to load Debconf::Element::%s. Failed because: %s Unable to start a frontend: %s Unknown template field '%s', in stanza #%s of %s
 Usage: debconf [options] command [args] Usage: debconf-communicate [options] [package] Usage: debconf-mergetemplate [options] [templates.ll ...] templates Valid priorities are: %s You are using the editor-based debconf frontend to configure your system. See the end of this document for detailed instructions. _Help apt-extracttemplates failed: %s debconf-mergetemplate: This utility is deprecated. You should switch to using po-debconf's po2debconf program. debconf: can't chmod: %s delaying package configuration, since apt-utils is not installed falling back to frontend: %s must specify some debs to preconfigure no none of the above please specify a package to reconfigure template parse error: %s unable to initialize frontend: %s unable to re-open stdin: %s warning: possible database corruption. Will attempt to repair by adding back missing question %s. yes Project-Id-Version: debconf_po
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2010-07-11 12:57+0100
PO-Revision-Date: 2006-02-21 08:18+0300
Last-Translator: Ossama M. Khayat <okhayat@yahoo.com>
Language-Team: Arabic <support@arabeyes.org>
Language: ar
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.11.2
 
        --outdated		الدمج حتى مع الترجمات الغير محدثة.
	--drop-old-templates	الإهمال التام للقوالب الغير محدثة. 
  -o,  --owner=package		تحديد الحزمة التي تخص الأمر.   -f,  --frontend		تحديد واجهة debconf المطلوب استخدامها.
  -p,  --priority		تحديد أقل مستوى أولوية للأسئلة المطلوب إظهارها.
       --terse			تمكين وضع terse.
 فشلت تهيئة %s مسبقاً، مع حالة خروج %s %s معطوبة أو غير مُثبّتة بالكامل %s مبهمة عند البايت %s: %s %s مبهمة عند البايت %s: %s؛ جاري إسقاطها %s مفقودة %s مفقودة، إسقاط %s %s غير مُثبّتة %s انتهت صلاحيتها %s انتهت صلاحيتها، إسقاط القالب بالكامل يجب تشغيل %s كمستخدم جذر (لا تُدخل أي عنصر أو عنصر أو أكثر مفصولة بفواصل يتبعها مسافة (', ').) السابق لا يمكن قراءة ملف الحالة: %s الخيارات قاعدة بيانات التهيئة غير مُحدّدة في ملف التهيئة. تهيئة %s Debconf Debconf على %s لم تتم تهيئة debconf لعرض رسالة الخطأ هذه، فقام بإرسالها إليك بالبريد. Debconf، يعمل على %s واجهة dialog ليست متوافقة مع مخازن صدفة emacs تتطلب واجهة dialog شاشة بطول 13 سطراً على الأقل وعرض 31 عموداً. لن يعمل dialog على طرفيّة وهمية، أو مخزن صدفة emacs، أو بدون طرفيّة تحكّم. أدخل العناصر التي تريد اختيارها، مفصولة بمسافات. استخراج القوالب من الحزم: %d%% مساعدة تجاهل الأولويّة الغير صالحة "%s" لم يُعثر على قيمة الإدخال، "%s" في خيارات C! يجب أن لا يحدث هذا أبداً. يبدو أن القوالب تُرجمت بشكل غير صحيح. المزيد التالي ليس هناك برنامج مشابه لـdialog مثبّت، لذا لا يمكن استخدام الواجهة المبنيّة على dialog. ملاحظة: يعمل Debconf في وضع الوب. اذهب إلى http://localhost:%i/ تهيئة الحزمة تهيئة الحزم مسبقاً ...
 مشكلة في إعداد قاعدة البيانات المُعرفة في المَقْطع %s من %s. TERM ليست مُعيّنة، لذا لا يمكن استخدام واجهة dialog. القالب #%s في %s لا يحتوي على سطر 'Template:'
 القالب #%s في %s يحتوي حقلاً مُزدوج "%s" بقيمة جديدة "%s". على الأرجح أن القالبين الجديدين غير مفصولين بشكل صحيح بسطر جديد.
 قالب قاعدة البيانات غير مُحدّد في ملف التهيئة. خطأ في إعراب القالب قُرْب `%s'، في المَقْطع #%s من %s
 Term::ReadLine::GNU ليس متوافق مع مخازن صدفة emacs. الخيارات Sigils و Smileys في ملف التهيئة غير مستخدمة بعد الآن. الرجاء إزالتها. واجهة debconf المبنية على المُحرّر تقدم لك ملفاً نصيّاً أو أكثر لتحريرها. وهذا أحد هذه الملفات. إن كنت تألف ملفات تهيئة يونكس القياسيّة، سيكون هذا الملف مألوفاً لك، حيث أنه يحتوي ملاحظات مُدمجة مع عناصر التهيئة. قم بتحرير الملف، بتغيير أي عناصر كما يلزم، ثم احفظ الملف واخرج من البرنامج. عند هذا، سيقرأ debconf الملف، ويستخدم القيم التي أدخلتها لتهيئة نظامك. تحتاج هذه الواجهة إلى مبرقة (tty) تحكّم. لم يمكن تحميل Debconf::Element::%s. فشل ذلك بسبب: %s لم يمكن تشغيل واجهة: %s ## CHECKحقل قالب مجهول '%s'، في المَقْطع #%s من %s
 الاستخدام: debconf [options] command [args] الاستخدام: debconf-communicate [options] [package] الاستخدام: debconf-mergetemplate [options] [templates.ll ...] templates الأولويات الصالحة هي: %s تستخدم الآن واجهة debconf المبنية على المُحرّر لتهيئة نظامك. راجع نهاية هذا المستند للتعليمات المفصلة. _مساعدة فشل apt-extracttemplates: %s debconf-mergetemplate: هذه الأداة ملغاة. عليك بالانتقال إلىبرنامج po2debconf الخاص بـpo-debconf. debconf: لايمكن تنفيذ chmod: %s تأجيل تهيئة الحزم، حيث أن apt-utils غير مثبتة التّراجع إلى الواجهة: %s يجب تحديد بعض حزم deb لتهيئتها مسبقاً لا ليس أياً مما أعلاه الرجاء تحديد حزمة لتهيئتها مسبقاً خطأ في إعراب القالب: %s لم يمكن ابتداء الواجهة: %s لم يمكن إعادة فتح stdin: %s تحذير: احتمال فساد قاعدة البيانات. ستتم محاولة إصلاحها بإعادة السؤال المفقود %s. نعم 