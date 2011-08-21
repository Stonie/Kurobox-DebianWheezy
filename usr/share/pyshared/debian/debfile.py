# DebFile: a Python representation of Debian .deb binary packages.
# Copyright (C) 2007-2008   Stefano Zacchiroli  <zack@debian.org>
# Copyright (C) 2007        Filippo Giunchedi   <filippo@debian.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import gzip
import tarfile

from arfile import ArFile, ArError
from changelog import Changelog
from deb822 import Deb822

DATA_PART = 'data.tar'      # w/o extension
CTRL_PART = 'control.tar'
PART_EXTS = ['gz', 'bz2']   # possible extensions
INFO_PART = 'debian-binary'
MAINT_SCRIPTS = ['preinst', 'postinst', 'prerm', 'postrm', 'config']

CONTROL_FILE = 'control'
CHANGELOG_NATIVE = 'usr/share/doc/%s/changelog.gz'  # with package stem
CHANGELOG_DEBIAN = 'usr/share/doc/%s/changelog.Debian.gz'
MD5_FILE = 'md5sums'


class DebError(ArError):
    pass


class DebPart(object):
    """'Part' of a .deb binary package.
    
    A .deb package is considered as made of 2 parts: a 'data' part
    (corresponding to the 'data.tar.gz' archive embedded in a .deb) and a
    'control' part (the 'control.tar.gz' archive). Each of them is represented
    by an instance of this class. Each archive should be a compressed tar
    archive; supported compression formats are: .tar.gz, .tar.bz2 .

    When referring to file members of the underlying .tar.gz archive, file
    names can be specified in one of 3 formats "file", "./file", "/file". In
    all cases the file is considered relative to the root of the archive. For
    the control part the preferred mechanism is the first one (as in
    deb.control.get_content('control') ); for the data part the preferred
    mechanism is the third one (as in deb.data.get_file('/etc/vim/vimrc') ).
    """

    def __init__(self, member):
        self.__member = member  # arfile.ArMember file member
        self.__tgz = None

    def tgz(self):
        """Return a TarFile object corresponding to this part of a .deb
        package.
        
        Despite the name, this method gives access to various kind of
        compressed tar archives, not only gzipped ones.
        """

        if self.__tgz is None:
            name = self.__member.name
            if name.endswith('.gz'):
                gz = gzip.GzipFile(fileobj=self.__member, mode='r')
                self.__tgz = tarfile.TarFile(fileobj=gz, mode='r')
            elif name.endswith('.bz2'):
                # Tarfile's __init__ doesn't allow for r:bz2 modes, but the
                # open() classmethod does ...
                self.__tgz = tarfile.open(fileobj=self.__member, mode='r:bz2')
            else:
                raise DebError("part '%s' has unexpected extension" % name)
        return self.__tgz

    @staticmethod
    def __normalize_member(fname):
        """ try (not so hard) to obtain a member file name in a form relative
        to the .tar.gz root and with no heading '.' """

        if fname.startswith('./'):
            fname = fname[2:]
        elif fname.startswith('/'):
            fname = fname[1:]
        return fname

    # XXX in some of the following methods, compatibility among >= 2.5 and <<
    # 2.5 python versions had to be taken into account. TarFile << 2.5 indeed
    # was buggied and returned member file names with an heading './' only for
    # the *first* file member. TarFile >= 2.5 fixed this and has the heading
    # './' for all file members.

    def has_file(self, fname):
        """Check if this part contains a given file name."""

        fname = DebPart.__normalize_member(fname)
        names = self.tgz().getnames()
        return (('./' + fname in names) \
                or (fname in names)) # XXX python << 2.5 TarFile compatibility

    def get_file(self, fname):
        """Return a file object corresponding to a given file name."""

        fname = DebPart.__normalize_member(fname)
        try:
            return (self.tgz().extractfile('./' + fname))
        except KeyError:    # XXX python << 2.5 TarFile compatibility
            return (self.tgz().extractfile(fname))

    def get_content(self, fname):
        """Return the string content of a given file, or None (e.g. for
        directories)."""

        f = self.get_file(fname)
        content = None
        if f:   # can be None for non regular or link files
            content = f.read()
            f.close()
        return content

    # container emulation

    def __iter__(self):
        return iter(self.tgz().getnames())

    def __contains__(self, fname):
        return self.has_file(fname)

    def has_key(self, fname):
        return self.has_file(fname)

    def __getitem__(self, fname):
        return self.get_content(fname)


class DebData(DebPart):

    pass


class DebControl(DebPart):

    def scripts(self):
        """ Return a dictionary of maintainer scripts (postinst, prerm, ...)
        mapping script names to script text. """

        scripts = {}
        for fname in MAINT_SCRIPTS:
            if self.has_file(fname):
                scripts[fname] = self.get_content(fname)

        return scripts

    def debcontrol(self):
        """ Return the debian/control as a Deb822 (a Debian-specific dict-like
        class) object.
        
        For a string representation of debian/control try
        .get_content('control') """

        return Deb822(self.get_content(CONTROL_FILE))

    def md5sums(self):
        """ Return a dictionary mapping filenames (of the data part) to
        md5sums. Fails if the control part does not contain a 'md5sum' file.

        Keys of the returned dictionary are the left-hand side values of lines
        in the md5sums member of control.tar.gz, usually file names relative to
        the file system root (without heading '/' or './'). """

        if not self.has_file(MD5_FILE):
            raise DebError("'%s' file not found, can't list MD5 sums" %
                    MD5_FILE)

        md5_file = self.get_file(MD5_FILE)
        sums = {}
        for line in md5_file.readlines():
            # we need to support spaces in filenames, .split() is not enough
            md5, fname = line.rstrip('\r\n').split(None, 1)
            sums[fname] = md5
        md5_file.close()
        return sums


class DebFile(ArFile):
    """Representation of a .deb file (a Debian binary package)

    DebFile objects have the following (read-only) properties:
        - version       debian .deb file format version (not related with the
                        contained package version), 2.0 at the time of writing
                        for all .deb packages in the Debian archive
        - data          DebPart object corresponding to the data.tar.gz (or
                        other compressed tar) archive contained in the .deb
                        file
        - control       DebPart object corresponding to the control.tar.gz (or
                        other compressed tar) archive contained in the .deb
                        file
    """

    def __init__(self, filename=None, mode='r', fileobj=None):
        ArFile.__init__(self, filename, mode, fileobj)
        actual_names = set(self.getnames())

        def compressed_part_name(basename):
            global PART_EXTS
            candidates = [ '%s.%s' % (basename, ext) for ext in PART_EXTS ]
            parts = actual_names.intersection(set(candidates))
            if not parts:
                raise DebError("missing required part in given .deb" \
                        " (expected one of: %s)" % candidates)
            elif len(parts) > 1:
                raise DebError("too many parts in given .deb" \
                        " (was looking for only one of: %s)" % candidates)
            else:   # singleton list
                return list(parts)[0]

        if not INFO_PART in actual_names:
            raise DebError("missing required part in given .deb" \
                    " (expected: '%s')" % INFO_PART)

        self.__parts = {}
        self.__parts[CTRL_PART] = DebControl(self.getmember(
                compressed_part_name(CTRL_PART)))
        self.__parts[DATA_PART] = DebData(self.getmember(
                compressed_part_name(DATA_PART)))
        self.__pkgname = None   # updated lazily by __updatePkgName

        f = self.getmember(INFO_PART)
        self.__version = f.read().strip()
        f.close()

    def __updatePkgName(self):
        self.__pkgname = self.debcontrol()['package']

    version = property(lambda self: self.__version)
    data = property(lambda self: self.__parts[DATA_PART])
    control = property(lambda self: self.__parts[CTRL_PART])

    # proxy methods for the appropriate parts

    def debcontrol(self):
        """ See .control.debcontrol() """
        return self.control.debcontrol()

    def scripts(self):
        """ See .control.scripts() """
        return self.control.scripts()

    def md5sums(self):
        """ See .control.md5sums() """
        return self.control.md5sums()

    def changelog(self):
        """ Return a Changelog object for the changelog.Debian.gz of the
        present .deb package. Return None if no changelog can be found. """

        if self.__pkgname is None:
            self.__updatePkgName()

        for fname in [ CHANGELOG_DEBIAN % self.__pkgname,
                CHANGELOG_NATIVE % self.__pkgname ]:
            if self.data.has_file(fname):
                gz = gzip.GzipFile(fileobj=self.data.get_file(fname))
                raw_changelog = gz.read()
                gz.close()
                return Changelog(raw_changelog)
        return None


if __name__ == '__main__':
    import sys
    deb = DebFile(filename=sys.argv[1])
    tgz = deb.control.tgz()
    print tgz.getmember('control')

