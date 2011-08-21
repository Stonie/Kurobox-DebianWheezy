# debian_support.py -- Python module for Debian metadata
# Copyright (C) 2005 Florian Weimer <fw@deneb.enyo.de>
# Copyright (C) 2010 John Wright <jsw@debian.org>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

"""This module implements facilities to deal with Debian-specific metadata."""

import os
import re
import hashlib
import types

from deprecation import function_deprecated_by

try:
    import apt_pkg
    apt_pkg.init()
    _have_apt_pkg = True
except ImportError:
    _have_apt_pkg = False

class ParseError(Exception):
    """An exception which is used to signal a parse failure.

    Attributes:

    filename - name of the file
    lineno - line number in the file
    msg - error message

    """
    
    def __init__(self, filename, lineno, msg):
        assert type(lineno) == types.IntType
        self.filename = filename
        self.lineno = lineno
        self.msg = msg

    def __str__(self):
        return self.msg

    def __repr__(self):
        return "ParseError(%s, %d, %s)" % (`self.filename`,
                                           self.lineno,
                                           `self.msg`)

    def print_out(self, file):
        """Writes a machine-parsable error message to file."""
        file.write("%s:%d: %s\n" % (self.filename, self.lineno, self.msg))
        file.flush()

    printOut = function_deprecated_by(print_out)

class BaseVersion(object):
    """Base class for classes representing Debian versions

    It doesn't implement any comparison, but it does check for valid versions
    according to Section 5.6.12 in the Debian Policy Manual.  Since splitting
    the version into epoch, upstream_version, and debian_revision components is
    pretty much free with the validation, it sets those fields as properties of
    the object, and sets the raw version to the full_version property.  A
    missing epoch or debian_revision results in the respective property set to
    None.  Setting any of the properties results in the full_version being
    recomputed and the rest of the properties set from that.

    It also implements __str__, just returning the raw version given to the
    initializer.
    """

    re_valid_version = re.compile(
            r"^((?P<epoch>\d+):)?"
             "(?P<upstream_version>[A-Za-z0-9.+:~-]+?)"
             "(-(?P<debian_revision>[A-Za-z0-9+.~]+))?$")
    magic_attrs = ('full_version', 'epoch', 'upstream_version',
                   'debian_revision', 'debian_version')

    def __init__(self, version):
        self.full_version = version

    def _set_full_version(self, version):
        m = self.re_valid_version.match(version)
        if not m:
            raise ValueError("Invalid version string %r" % version)

        self.__full_version = version
        self.__epoch = m.group("epoch")
        self.__upstream_version = m.group("upstream_version")
        self.__debian_revision = m.group("debian_revision")

    def __setattr__(self, attr, value):
        if attr not in self.magic_attrs:
            super(BaseVersion, self).__setattr__(attr, value)
            return

        # For compatibility with the old changelog.Version class
        if attr == "debian_version":
            attr = "debian_revision"

        if attr == "full_version":
            self._set_full_version(str(value))
        else:
            if value is not None:
                value = str(value)
            private = "_BaseVersion__%s" % attr
            old_value = getattr(self, private)
            setattr(self, private, value)
            try:
                self._update_full_version()
            except ValueError:
                # Don't leave it in an invalid state
                setattr(self, private, old_value)
                self._update_full_version()
                raise ValueError("Setting %s to %r results in invalid version"
                                 % (attr, value))

    def __getattr__(self, attr):
        if attr not in self.magic_attrs:
            return super(BaseVersion, self).__getattribute__(attr)

        # For compatibility with the old changelog.Version class
        if attr == "debian_version":
            attr = "debian_revision"

        private = "_BaseVersion__%s" % attr
        return getattr(self, private)

    def _update_full_version(self):
        version = ""
        if self.__epoch is not None:
            version += self.__epoch + ":"
        version += self.__upstream_version
        if self.__debian_revision:
            version += "-" + self.__debian_revision
        self.full_version = version

    def __str__(self):
        return self.full_version

    def __repr__(self):
        return "%s('%s')" % (self.__class__.__name__, self)

    def __cmp__(self, other):
        raise NotImplementedError

    def __hash__(self):
        return hash(str(self))

class AptPkgVersion(BaseVersion):
    """Represents a Debian package version, using apt_pkg.VersionCompare"""

    def __init__(self, version):
        if not _have_apt_pkg:
            raise NotImplementedError("apt_pkg not available; install the "
                                      "python-apt package")
        super(AptPkgVersion, self).__init__(version)

    def __cmp__(self, other):
        return apt_pkg.VersionCompare(str(self), str(other))

# NativeVersion based on the DpkgVersion class by Raphael Hertzog in
# svn://svn.debian.org/qa/trunk/pts/www/bin/common.py r2361
class NativeVersion(BaseVersion):
    """Represents a Debian package version, with native Python comparison"""

    re_all_digits_or_not = re.compile("\d+|\D+")
    re_digits = re.compile("\d+")
    re_digit = re.compile("\d")
    re_alpha = re.compile("[A-Za-z]")

    def __cmp__(self, other):
        # Convert other into an instance of BaseVersion if it's not already.
        # (All we need is epoch, upstream_version, and debian_revision
        # attributes, which BaseVersion gives us.) Requires other's string
        # representation to be the raw version.
        if not isinstance(other, BaseVersion):
            try:
                other = BaseVersion(str(other))
            except ValueError, e:
                raise ValueError("Couldn't convert %r to BaseVersion: %s"
                                 % (other, e))

        res = cmp(int(self.epoch or "0"), int(other.epoch or "0"))
        if res != 0:
            return res
        res = self._version_cmp_part(self.upstream_version,
                                     other.upstream_version)
        if res != 0:
            return res
        return self._version_cmp_part(self.debian_revision or "0",
                                      other.debian_revision or "0")

    @classmethod
    def _order(cls, x):
        """Return an integer value for character x"""
        if x == '~':
            return -1
        elif cls.re_digit.match(x):
            return int(x) + 1
        elif cls.re_alpha.match(x):
            return ord(x)
        else:
            return ord(x) + 256

    @classmethod
    def _version_cmp_string(cls, va, vb):
        la = [cls._order(x) for x in va]
        lb = [cls._order(x) for x in vb]
        while la or lb:
            a = 0
            b = 0
            if la:
                a = la.pop(0)
            if lb:
                b = lb.pop(0)
            res = cmp(a, b)
            if res != 0:
                return res
        return 0

    @classmethod
    def _version_cmp_part(cls, va, vb):
        la = cls.re_all_digits_or_not.findall(va)
        lb = cls.re_all_digits_or_not.findall(vb)
        while la or lb:
            a = "0"
            b = "0"
            if la:
                a = la.pop(0)
            if lb:
                b = lb.pop(0)
            if cls.re_digits.match(a) and cls.re_digits.match(b):
                a = int(a)
                b = int(b)
                res = cmp(a, b)
                if res != 0:
                    return res
            else:
                res = cls._version_cmp_string(a, b)
                if res != 0:
                    return res
        return 0

if _have_apt_pkg:
    class Version(AptPkgVersion):
        pass
else:
    class Version(NativeVersion):
        pass

def version_compare(a, b):
    return cmp(Version(a), Version(b))

class PackageFile:
    """A Debian package file.

    Objects of this class can be used to read Debian's Source and
    Packages files."""

    re_field = re.compile(r'^([A-Za-z][A-Za-z0-9-]+):(?:\s*(.*?))?\s*$')
    re_continuation = re.compile(r'^\s+(?:\.|(\S.*?)\s*)$')

    def __init__(self, name, file_obj=None):
        """Creates a new package file object.

        name - the name of the file the data comes from
        file_obj - an alternate data source; the default is to open the
                  file with the indicated name.
        """
        if file_obj is None:
            file_obj = file(name)
        self.name = name
        self.file = file_obj
        self.lineno = 0

    def __iter__(self):
        line = self.file.readline()
        self.lineno += 1
        pkg = []
        while line:
            if line.strip(' \t') == '\n':
                if len(pkg) == 0:
                    self.raise_syntax_error('expected package record')
                yield pkg
                pkg = []
                line = self.file.readline()
                self.lineno += 1
                continue
            
            match = self.re_field.match(line)
            if not match:
                self.raise_syntax_error("expected package field")
            (name, contents) = match.groups()
            contents = contents or ''

            while True:
                line = self.file.readline()
                self.lineno += 1
                match = self.re_continuation.match(line)
                if match:
                    (ncontents,) = match.groups()
                    if ncontents is None:
                        ncontents = ""
                    contents = "%s\n%s" % (contents, ncontents)
                else:
                    break
            pkg.append((name, contents))
        if pkg:
            yield pkg

    def raise_syntax_error(self, msg, lineno=None):
        if lineno is None:
            lineno = self.lineno
        raise ParseError(self.name, lineno, msg)

    raiseSyntaxError = function_deprecated_by(raise_syntax_error)

class PseudoEnum:
    """A base class for types which resemble enumeration types."""
    def __init__(self, name, order):
        self._name = name
        self._order = order
    def __repr__(self):
        return '%s(%s)'% (self.__class__._name__, `name`)
    def __str__(self):
        return self._name
    def __cmp__(self, other):
        return cmp(self._order, other._order)
    def __hash__(self):
        return hash(self._order)

class Release(PseudoEnum): pass

def list_releases():
    releases = {}
    rels = ("potato", "woody", "sarge", "etch", "lenny", "sid")
    for r in range(len(rels)):
        releases[rels[r]] = Release(rels[r], r)
    Release.releases = releases
    return releases

listReleases = function_deprecated_by(list_releases)

def intern_release(name, releases=list_releases()):
    if releases.has_key(name):
        return releases[name]
    else:
        return None

internRelease = function_deprecated_by(intern_release)

del listReleases
del list_releases

def read_lines_sha1(lines):
    m = hashlib.sha1()
    for l in lines:
        m.update(l)
    return m.hexdigest()

readLinesSHA1 = function_deprecated_by(read_lines_sha1)

def patches_from_ed_script(source,
                        re_cmd=re.compile(r'^(\d+)(?:,(\d+))?([acd])$')):
    """Converts source to a stream of patches.

    Patches are triples of line indexes:

    - number of the first line to be replaced
    - one plus the number of the last line to be replaced
    - list of line replacements

    This is enough to model arbitrary additions, deletions and
    replacements.
    """

    i = iter(source)
    
    for line in i:
        match = re_cmd.match(line)
        if match is None:
            raise ValueError, "invalid patch command: " + `line`

        (first, last, cmd) = match.groups()
        first = int(first)
        if last is not None:
            last = int(last)

        if cmd == 'd':
            first = first - 1
            if last is None:
                last = first + 1
            yield (first, last, [])
            continue

        if cmd == 'a':
            if last is not None:
                raise ValueError, "invalid patch argument: " + `line`
            last = first
        else:                           # cmd == c
            first = first - 1
            if last is None:
                last = first + 1

        lines = []
        for l in i:
            if l == '':
                raise ValueError, "end of stream in command: " + `line`
            if l == '.\n' or l == '.':
                break
            lines.append(l)
        yield (first, last, lines)

patchesFromEdScript = function_deprecated_by(patches_from_ed_script)

def patch_lines(lines, patches):
    """Applies patches to lines.  Updates lines in place."""
    for (first, last, args) in patches:
        lines[first:last] = args

patchLines = function_deprecated_by(patch_lines)

def replace_file(lines, local):

    import os.path

    local_new = local + '.new'
    new_file = file(local_new, 'w+')

    try:
        for l in lines:
            new_file.write(l)
        new_file.close()
        os.rename(local_new, local)
    finally:
        if os.path.exists(local_new):
            os.unlink(local_new)

replaceFile = function_deprecated_by(replace_file)

def download_gunzip_lines(remote):
    """Downloads a file from a remote location and gunzips it.

    Returns the lines in the file."""

    # The implementation is rather crude, but it seems that the gzip
    # module needs a real file for input.

    import gzip
    import tempfile
    import urllib

    (handle, fname) = tempfile.mkstemp()
    try:
        os.close(handle)
        (filename, headers) = urllib.urlretrieve(remote, fname)
        gfile = gzip.GzipFile(filename)
        lines = gfile.readlines()
        gfile.close()
    finally:
        os.unlink(fname)
    return lines

downloadGunzipLines = function_deprecated_by(download_gunzip_lines)

def download_file(remote, local):
    """Copies a gzipped remote file to the local system.

    remote - URL, without the .gz suffix
    local - name of the local file
    """
    
    lines = download_gunzip_lines(remote + '.gz')
    replace_file(lines, local)
    return lines

downloadFile = function_deprecated_by(download_file)

def update_file(remote, local, verbose=None):
    """Updates the local file by downloading a remote patch.

    Returns a list of lines in the local file.
    """

    try:
        local_file = file(local)
    except IOError:
        if verbose:
            print "update_file: no local copy, downloading full file"
        return download_file(remote, local)

    lines = local_file.readlines()
    local_file.close()
    local_hash = read_lines_sha1(lines)
    patches_to_apply = []
    patch_hashes = {}
    
    import urllib
    index_name = remote + '.diff/Index'

    re_whitespace=re.compile('\s+')

    try:
        index_url = urllib.urlopen(index_name)
        index_fields = list(PackageFile(index_name, index_url))
    except ParseError:
        # FIXME: urllib does not raise a proper exception, so we parse
        # the error message.
        if verbose:
            print "update_file: could not interpret patch index file"
        return download_file(remote, local)
    except IOError:
        if verbose:
            print "update_file: could not download patch index file"
        return download_file(remote, local)

    for fields in index_fields:
        for (field, value) in fields:
            if field == 'SHA1-Current':
                (remote_hash, remote_size) = re_whitespace.split(value)
                if local_hash == remote_hash:
                    if verbose:
                        print "update_file: local file is up-to-date"
                    return lines
                continue

            if field =='SHA1-History':
                for entry in value.splitlines():
                    if entry == '':
                        continue
                    (hist_hash, hist_size, patch_name) \
                                = re_whitespace.split(entry)

                    # After the first patch, we have to apply all
                    # remaining patches.
                    if patches_to_apply or  hist_hash == local_hash:
                        patches_to_apply.append(patch_name)
                        
                continue
            
            if field == 'SHA1-Patches':
                for entry in value.splitlines():
                    if entry == '':
                        continue
                    (patch_hash, patch_size, patch_name) \
                                 = re_whitespace.split(entry)
                    patch_hashes[patch_name] = patch_hash
                continue
            
            if verbose:
                print "update_file: field %s ignored" % `field`
        
    if not patches_to_apply:
        if verbose:
            print "update_file: could not find historic entry", local_hash
        return download_file(remote, local)

    for patch_name in patches_to_apply:
        print "update_file: downloading patch " + `patch_name`
        patch_contents = download_gunzip_lines(remote + '.diff/' + patch_name
                                          + '.gz')
        if read_lines_sha1(patch_contents ) <> patch_hashes[patch_name]:
            raise ValueError, "patch %s was garbled" % `patch_name`
        patch_lines(lines, patches_from_ed_script(patch_contents))
        
    new_hash = read_lines_sha1(lines)
    if new_hash <> remote_hash:
        raise ValueError, ("patch failed, got %s instead of %s"
                           % (new_hash, remote_hash))

    replace_file(lines, local)
    return lines

updateFile = function_deprecated_by(update_file)

def merge_as_sets(*args):
    """Create an order set (represented as a list) of the objects in
    the sequences passed as arguments."""
    s = {}
    for x in args:
        for y in x:
            s[y] = True
    l = s.keys()
    l.sort()
    return l

mergeAsSets = function_deprecated_by(merge_as_sets)
