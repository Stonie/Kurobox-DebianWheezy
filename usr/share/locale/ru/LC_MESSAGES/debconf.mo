��    G      T  a   �        o     ?   �  �   �  .   X  #   �     �  '   �     �     �          +  (   :     c  K   z     �     �     �  -   �     	     ,	     4	     B	  8   Y	  M   �	  k   �	  8   L
  (   �
     �
     �
  u   �
     H     M  X   R  @   �     �       ;     6   [  7   �  �   �  /   S  4   �  =   �  Y   �  �  P  )     7   >     v  1   �  '   �  .   �  C     F  b     �  �   �     D     J  n   j     �  @   �     3  &   P     w     z  '   �     �  !   �     �  a        m  �  q  �   ]  n   8  �   �  t   �  N     Q   i  k   �     '  6   A  '   x     �  S   �  [     �   m     �  ;        J  ^   [  (   �     �     �  %   �  R   !  �   t  �   �  �   �  ?   k      �   O   �   �   !  
   "  
   "  �   "  m   �"     :#  E   Z#  k   �#  �   $  P   �$  �   �$  \   �%  b   &  Y   �&  �   �&  �  u'  i   +  O   m+  =   �+  [   �+  \   W,  Q   �,  h   -  �  o-  -   �/    !0     71  9   =1  �   w1  Y   !2  o   {2  8   �2  v   $3     �3  4   �3  O   �3  .   '4  K   V4  9   �4  �   �4     �5        4      '       B                    >                       0      A                    ?       *                  (       3   =   ,   ;                 8   /   <   6               -      E   .   C           9       1                            +   2   #          D   G         :      %      7          !       $   "   )   
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
       --no-reload		Do not reload templates. (Use with caution.) Valid priorities are: %s You are using the editor-based debconf frontend to configure your system. See the end of this document for detailed instructions. _Help apt-extracttemplates failed: %s debconf-mergetemplate: This utility is deprecated. You should switch to using po-debconf's po2debconf program. debconf: can't chmod: %s delaying package configuration, since apt-utils is not installed falling back to frontend: %s must specify some debs to preconfigure no none of the above please specify a package to reconfigure template parse error: %s unable to initialize frontend: %s unable to re-open stdin: %s warning: possible database corruption. Will attempt to repair by adding back missing question %s. yes Project-Id-Version: 1.5.29
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-19 19:05-0400
PO-Revision-Date: 2010-03-09 20:37+0300
Last-Translator: Yuri Kozlov <yuray@komyakino.ru>
Language-Team: Russian <debian-l10n-russian@lists.debian.org>
Language: ru
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.11.4
Plural-Forms:  nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
 
        --outdated		Выполнять объединение даже с устаревшими переводами.
	--drop-old-templates	Выкидывать устаревшие шаблоны полностью. 
  -o,  --owner=пакет		Указать пакет, которому принадлежит команда.   -f,  --frontend		Задать желаемый debconf интерфейс.
  -p,  --priority		Указать желаемый приоритет задаваемых вопросов.
       --terse			Включить лаконичный режим.
 не удалось выполнить начальную настройку пакета %s, код ошибки %s Пакет %s сломан или установлен не полностью %s имеет нечёткий перевод начиная с %s байта: %s %s имеет нечёткий перевод начиная с %s байта: %s; отбрасывание отсутствует %s отсутствует %s; отбрасывание %s Пакет %s не установлен Пакет %s устарел Пакет %s устарел; игнорирование всего шаблона! %s требует выполнения с правами суперпользователя (Укажите необходимое количество элементов, разделяя их запятой с пробелом (', ').) Возврат Ошибка чтения файла состояния: %s Варианты База данных настройки не указана в файле настройки. Настраивается пакет %s Debconf Debconf на %s Debconf, работающий на %s Интерфейс dialog не совместим с shelll буферами emacs Интерфейс dialog требует экран не менее 13 строк в высоту и 31 колонок в ширину. Интерфейс dialog не будет работать на неуправляемом (dumb) терминале, из буфера emacs'а, или в отсутствие контролирующего терминала. Укажите буквы, соответствующие выбранным вариантам, разделяя их пробелами. Извлечение шаблонов из пакетов: %d%% Подсказка Игнорирование неправильного приоритета "%s" Входное значение "%s" на найдено среди вариантов локали С! Это не должно было случиться. Возможно, шаблоны были неправильно переведены. Далее Далее Ни одна из dialog-подобных программ не установлена, поэтому вы не можете использовать dialog-интерфейс. Замечание: используется веб-интерфейс. Откройте http://localhost:%i/ Настройка пакета Предварительная настройка пакетов ...
 Проблемы при настройке базы данных, заданной строфой %s в %s. Не установлена переменная TERM, поэтому запустить интерфейс dialog нельзя. Шаблон номер %s в %s не содержит строки `Template:'
 Шаблон номер %s в %s содержит повторяющееся поле "%s" с другим значением "%s". Вероятно, два шаблона не разделены пустой строкой.
 База данных шаблонов не указана в файле настройки. Ошибка разбора шаблона около `%s', в строфе номер %s из %s
 Term::ReadLine::GNU не может работать из-под буферов emacs'а. Параметры Sigils и Smileys в файле настройки устарели и больше не используются. Удалите их. Интерфейс к debconf, использующий текстовый редактор, предлагает вам редактировать один или несколько текстовых файлов. Перед вами один из таких файлов. Его формат схож с форматом стандартных файлов настройки Unix: параметры и их значения идут вперемешку с описывающими их комментариями. Вы должны изменить этот файл в соответствии с вашими потребностями, сохранить его и выйти из редактора. Затем программа debconf прочитает изменённый файл и использует введённые вами параметры для настройки системы. Этот интерфейс работает только с управляющего терминала. Не удалось загрузить Debconf::Element::%s. Причина: %s Не удалось запустить интерфейс: %s Неизвестное поле шаблона `%s', в строфе номер %s из %s
 Использование: debconf [параметры] команда [аргументы] Использование: debconf-communicate [параметры] [пакет] Использование: debconf-mergetemplate [параметры] [templates.ll ...] шаблоны Использование: dpkg-reconfigure [параметры] пакеты
  -a,  --all			Перенастройка всех пакетов.
  -u,  --unseen-only		Показывать только ещё не просмотренные вопросы.
       --default-priority	Использовать приоритет по умолчанию
                         	вместо низкого.
       --force			Принудительная перенастройка сломанных
              			пакетов.
       --no-reload		Не перезагружать шаблоны. (используйте осторожно.) Допустимые приоритеты: %s Вы указали пакету debconf, что для настройки системы необходимо использовать текстовый редактор. Подробную информацию вы найдете в конце этого документа. _Help ошибка при работе apt-extracttemplates: %s debconf-mergetemplate: Эта программа устарела. Используйте вместо неё программу po2debconf из пакета po-debconf. debconf: не удалось изменить режим доступа к файлу: %s так как не установлен apt-utils, настройка пакетов откладывается будет использован интерфейс: %s для предварительной настройки нужно указать несколько deb-файлов нет ни один из предложенных выше укажите пакет, который нужно перенастроить ошибка разбора шаблона: %s не удалось инициализировать интерфейс: %s не удалось заново открыть stdin: %s внимание: возможно, повреждена база данных. Будет сделана попытка исправить её, добавив отсутствующий вопрос %s. да 