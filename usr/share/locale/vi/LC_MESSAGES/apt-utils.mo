��    7      �  I   �      �  )   �     �  "   �          8     I     d     �     �     �     �  1   �     )  ,   8  m   e  #   �  (   �           $     =     Z  %   x     �  '   �     �     �  #   �  "   "     E     [     u     �     �     �  #   �     �  "   	     *	  5   ?	  !   u	     �	     �	     �	     �	     �	  "   
     +
  '  C
  &  k  H  �     �     �     �  #     �  9  1   �     '  '   G  3   o     �  )   �  /   �  /     .   H     w  (   �  P   �       5      �   V  <     Y   H     �  +   �  &   �  &   �  =   $  "   b  :   �  )   �     �  *     &   /  ,   V  *   �  $   �  4   �  %     @   .  ,   o  .   �  %   �  #   �  A     (   W  &   �     �     �  8   �       )   ,     V    q  ]	  w  �  �(     �*  &   �*  4   �*  F   +                /   &       3   7                         6   	         2           +      ,   *         )             "   -   4   1            0   .         #      
       5   !                                 $   '                     (                       %      %s has no binary override entry either
   %s has no override entry
   %s has no source override entry
   %s maintainer is %s not %s
  DeLink %s [%s]
  DeLink limit of %sB hit.
 %s %s for %s compiled on %s %s
 %s not a valid DEB package. *** Failed to link %s to %s Archive had no package field Archive has no control record Cannot get debconf version. Is debconf installed? Compress child Compressed output %s needs a compression set DB format is invalid. If you upgraded from an older version of apt, please remove and re-create the database. DB is old, attempting to upgrade %s DB was corrupted, file renamed to %s.old E:  E: Errors apply to file  Error processing contents %s Error processing directory %s Error writing header to contents file Failed to create FILE* Failed to create IPC pipe to subprocess Failed to fork Failed to open %s Failed to read the override file %s Failed to read while computing MD5 Failed to readlink %s Failed to rename %s to %s Failed to resolve %s Failed to stat %s Failed to unlink %s IO to subprocess/file failed Internal error, failed to create %s No selections matched Package extension list is too long Problem unlinking %s Some files are missing in the package file group `%s' Source extension list is too long Tree walking failed Unable to get a cursor Unable to open %s Unable to open DB file %s: %s Unable to write to %s Unknown compression algorithm '%s' Unknown package record! Usage: apt-extracttemplates file1 [file2 ...]

apt-extracttemplates is a tool to extract config and template info
from debian packages

Options:
  -h   This help text
  -t   Set the temp dir
  -c=? Read this configuration file
  -o=? Set an arbitrary configuration option, eg -o dir::cache=/tmp
 Usage: apt-ftparchive [options] command
Commands: packages binarypath [overridefile [pathprefix]]
          sources srcpath [overridefile [pathprefix]]
          contents path
          release path
          generate config [groups]
          clean config

apt-ftparchive generates index files for Debian archives. It supports
many styles of generation from fully automated to functional replacements
for dpkg-scanpackages and dpkg-scansources

apt-ftparchive generates Package files from a tree of .debs. The
Package file contains the contents of all the control fields from
each package as well as the MD5 hash and filesize. An override file
is supported to force the value of Priority and Section.

Similarly apt-ftparchive generates Sources files from a tree of .dscs.
The --source-override option can be used to specify a src override file

The 'packages' and 'sources' command should be run in the root of the
tree. BinaryPath should point to the base of the recursive search and 
override file should contain the override flags. Pathprefix is
appended to the filename fields if present. Example usage from the 
Debian archive:
   apt-ftparchive packages dists/potato/main/binary-i386/ > \
               dists/potato/main/binary-i386/Packages

Options:
  -h    This help text
  --md5 Control MD5 generation
  -s=?  Source override file
  -q    Quiet
  -d=?  Select the optional caching database
  --no-delink Enable delinking debug mode
  --contents  Control contents file generation
  -c=?  Read this configuration file
  -o=?  Set an arbitrary configuration option Usage: apt-sortpkgs [options] file1 [file2 ...]

apt-sortpkgs is a simple tool to sort package files. The -s option is used
to indicate what kind of file it is.

Options:
  -h   This help text
  -s   Use source file sorting
  -c=? Read this configuration file
  -o=? Set an arbitrary configuration option, eg -o dir::cache=/tmp
 W:  W: Unable to read directory %s
 W: Unable to stat %s
 realloc - Failed to allocate memory Project-Id-Version: apt 0.8.0~pre1
Report-Msgid-Bugs-To: deity@lists.debian.org
POT-Creation-Date: 2012-04-11 17:55+0200
PO-Revision-Date: 2010-09-29 21:36+0930
Last-Translator: Clytie Siddall <clytie@riverland.net.au>
Language-Team: Vietnamese <vi-VN@googlegroups.com>
Language: vi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Generator: LocFactoryEditor 1.8
   %s cũng không có mục ghi đè nhị phân
   %s không có mục ghi đè
   %s không có mục ghi đè nguồn
   người bảo quản %s là %s không phải %s
  Bỏ liên kết %s [%s]
  Hết hạn bỏ liên kết của %sB.
 %s %s cho %s được biên dịch trên %s %s
 %s không phải là một gói DEB hợp lệ. *** Việc liên kết %s đến %s bị lỗi Kho không có trường gói Kho không có mục ghi điều khiển Không thể lấy phiên bản debconf. Debconf có được cài đặt chưa? Nén điều con Dữ liệu xuất đã nén %s cần một bộ nén Định dạng co sở dữ liệu không hợp lệ. Nếu bạn đã nâng cấp từ một phiên bản apt cũ, hãy gỡ bỏ nó và sau đó tạo lại co sở dữ liệu. Cơ sở dữ liệu cũ nên đang cố nâng cấp lên %s Cơ sở dữ liệu bị hỏng nên đã đổi tên tâp tin thành %s.old (old: cũ). LỖI:  LỖI: có lỗi áp dụng vào tập tin  Gặp lỗi khi xử lý nội dung %s Gặp lỗi khi xử lý thư mục %s Gặp lỗi khi ghi phần đầu vào tập tin nộị dung Việc tạo TẬP_TIN* bị lỗi Việc tạo ống IPC đến tiến trình con bị lỗi Việc tạo tiến trình con bị lỗi Việc mở %s bị lỗi Việc đọc tập tin đè %s bị lỗi Việc đọc khi tính MD5 bị lỗi Việc tạo liên kết lại %s bị lỗi Việc đổi tên %s thành %s bị lỗi Việc quyết định %s bị lỗi Việc lấy thông tin toàn bộ cho %s bị lỗi Việc bỏ liên kết %s bị lỗi việc nhập/xuất vào tiến trình con/tập tin bị lỗi Lỗi nội bộ, việc tạo %s bị lỗi Không có điều đã chọn khớp được Danh sách mở rộng gói quá dài Gặp lỗi khi bỏ liên kết %s Thiếu một số tập tin trong nhóm tập tin gói « %s ». Danh sách mở rộng nguồn quá dài Việc di chuyển qua cây bị lỗi Không thể lấy con chạy Không thể mở %s Không thể mở tập tin cơ sở dữ liệu %s: %s. Không thể ghi vào %s Không biết thuật toán nén « %s » Không rõ mục ghi gói. Cách sử dụng: apt-extracttemplates tập_tin1 [tập_tin2 ...]

[extract: 		rút;
templates: 	những biểu mẫu]

apt-extracttemplates là một công cụ rút thông tin kiểu cấu hình
	và biểu mẫu đều từ gói Debian

Tùy chọn:
  -h   		_Trợ giúp_ này
  -t   		Lập thư muc tạm thời
		[temp, tmp: viết tắt cho từ « temporary »: tạm thời]
  -c=? 		Đọc tập tin cấu hình này
  -o=? 		Lập một tùy chọn cấu hình nhiệm ý, v.d. « -o dir::cache=/tmp »
 Sử dụng: apt-ftparchive [tùy_chọn...] lệnh

[ftparchive: FTP archive: kho FTP]

Lệnh: 	packages binarypath [tập_tin_đè [tiền_tố_đường_dẫn]]
          	sources srcpath [tập_tin_đè[tiền_tố_đường_dẫn]]
          	contents path
         	release path
          	generate config [groups]
          	clean config

[packages: 	những gói;
binarypath: 	đường dẫn nhị phân;
sources: 		những nguồn;
srcpath: 		đường dẫn nguồn;
contents path: đường dẫn nội dụng;
release path: 	đường dẫn bản đã phát hành;
generate config [groups]: tạo ra cấu hình [nhóm];
clean config: 	cấu hình toàn mới)

apt-ftparchive (kho ftp) thì tạo ra tập tin chỉ mục cho kho Debian.
Nó hỗ trợ nhiều cách tạo ra, từ cách tự động toàn bộ
đến cách thay thế điều hoặt động cho dpkg-scanpackages (dpkg-quét_gói)
và dpkg-scansources (dpkg-quét_nguồn).

apt-ftparchive tạo ra tập tin Gói ra cây các .deb.
Tập tin gói chứa nội dung các trường điều khiển từ mỗi gói,
cùng với băm MD5 và kích cỡ tập tin.
Hỗ trợ tập tin đè để buộc giá trị Ưu tiên và Phần

Tương tự, apt-ftparchive tạo ra tập tin Nguồn ra cây các .dsc
Có thể sử dụng tùy chọn « --source-override » (đè nguồn)
để ghi rõ tập tin đè nguồn

Lnh « packages » (gói) và « sources » (nguồn) nên chạy tại gốc cây.
BinaryPath (đường dẫn nhị phân) nên chỉ tới cơ bản của việc tìm kiếm đệ quy,
và tập tin đè nên chứa những cờ đè.
Pathprefix (tiền tố đường dẫn) được phụ thêm vào
những trường tên tập tin nếu có.
Cách sử dụng thí dụ từ kho Debian:
   apt-ftparchive packages dists/potato/main/binary-i386/ > \
               dists/potato/main/binary-i386/Packages

Tùy chọn:
  -h   		_Trợ giúp_ này
  --md5 		Điều khiển cách tạo ra MD5
  -s=?  		Tập tin đè nguồn
  -q    		_Im_ (không xuất chi tiết)
  -d=?  		Chọn _cơ sở dữ liệu_ nhớ tạm tùy chọn
  --no-delink 	Mở chế độ gỡ lỗi _bỏ liên kết_
  --contents  	Điều khiển cách tạo ra tập tin _nội dung_
  -c=? 		Đọc tập tin cấu hình này
  -o=? 		Lập một tùy chọn cấu hình nhiệm ý, v.d. « -o dir::cache=/tmp » Sử dụng: apt-sortpkgs [tùy_chọn...] tập_tin1 [tập_tin2 ...]

[sortpkgs: sort packages: sắp xếp các gói]

apt-sortpkgs là một công cụ đơn giản để sắp xếp tập tin gói.
Tùy chon « -s » dùng để ngụ ý kiểu tập tin.

Tùy chọn:
  -h   	_Trợ giúp_ này
  -s   	Sắp xếp những tập tin _nguồn_
  -c=? 	Đọc tập tin cấu hình này
  -o=? 	Lập tùy chọn cấu hình nhiệm ý, v.d. « -o dir::cache=/tmp »
 CB:  CB: Không thể đọc thư mục %s
 CB: Không thể lấy thông tin toàn bộ cho %s
 realloc (cấp phát lại) - việc cấp phát bộ nhớ bị lỗi 