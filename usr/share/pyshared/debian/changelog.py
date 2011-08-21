# changelog.py -- Python module for Debian changelogs
# Copyright (C) 2006-7 James Westby <jw+debian@jameswestby.net>
# Copyright (C) 2008 Canonical Ltd.
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

# The parsing code is based on that from dpkg which is:
# Copyright 1996 Ian Jackson
# Copyright 2005 Frank Lichtenheld <frank@lichtenheld.de>
# and licensed under the same license as above.

"""This module implements facilities to deal with Debian changelogs."""

import re
import warnings

import debian_support

class ChangelogParseError(StandardError):
    """Indicates that the changelog could not be parsed"""
    is_user_error = True

    def __init__(self, line):
        self._line=line

    def __str__(self):
        return "Could not parse changelog: "+self._line

class ChangelogCreateError(StandardError):
    """Indicates that changelog could not be created, as all the information
    required was not given"""

class VersionError(StandardError):
    """Indicates that the version does not conform to the required format"""

    is_user_error = True

    def __init__(self, version):
        self._version=version

    def __str__(self):
        return "Could not parse version: "+self._version

class Version(debian_support.Version):
    """Represents a version of a Debian package."""
    # debian_support.Version now has all the functionality we need

class ChangeBlock(object):
    """Holds all the information about one block from the changelog."""

    def __init__(self, package=None, version=None, distributions=None,
                urgency=None, urgency_comment=None, changes=None,
                author=None, date=None, other_pairs=None):
        self._raw_version = None
        self._set_version(version)
        self.package = package
        self.distributions = distributions
        self.urgency = urgency or "unknown"
        self.urgency_comment = urgency_comment or ''
        self._changes = changes
        self.author = author
        self.date = date
        self._trailing = []
        self.other_pairs = other_pairs or {}
        self._no_trailer = False
        self._trailer_separator = "  "

    def _set_version(self, version):
        if version is not None:
            self._raw_version = str(version)

    def _get_version(self):
        return Version(self._raw_version)

    version = property(_get_version, _set_version)

    def other_keys_normalised(self):
        norm_dict = {}
        for (key, value) in other_pairs.items():
            key = key[0].upper() + key[1:].lower()
            m = xbcs_re.match(key)
            if m is None:
                key = "XS-%s" % key
            norm_dict[key] = value
        return norm_dict

    def changes(self):
        return self._changes

    def add_trailing_line(self, line):
        self._trailing.append(line)

    def add_change(self, change):
        if self._changes is None:
            self._changes = [change]
        else:
            #Bit of trickery to keep the formatting nicer with a blank
            #line at the end if there is one
            changes = self._changes
            changes.reverse()
            added = False
            for i in range(len(changes)):
                m = blankline.match(changes[i])
                if m is None:
                    changes.insert(i, change)
                    added = True
                    break
            changes.reverse()
            if not added:
                changes.append(change)
            self._changes = changes

    def __str__(self):
        block = ""
        if self.package is None:
            raise ChangelogCreateError("Package not specified")
        block += self.package + " "
        if self._raw_version is None:
            raise ChangelogCreateError("Version not specified")
        block += "(" + self._raw_version + ") "
        if self.distributions is None:
            raise ChangelogCreateError("Distribution not specified")
        block += self.distributions + "; "
        if self.urgency is None:
            raise ChangelogCreateError("Urgency not specified")
        block += "urgency=" + self.urgency + self.urgency_comment
        for (key, value) in self.other_pairs.items():
            block += ", %s=%s" % (key, value)
        block += '\n'
        if self.changes() is None:
            raise ChangelogCreateError("Changes not specified")
        for change in self.changes():
            block += change + "\n"
        if not self._no_trailer:
            if self.author is None:
                raise ChangelogCreateError("Author not specified")
            if self.date is None:
                raise ChangelogCreateError("Date not specified")
            block += " -- " + self.author + self._trailer_separator \
                      + self.date + "\n"
        for line in self._trailing:
            block += line + "\n"
        return block

topline = re.compile(r'^(\w%(name_chars)s*) \(([^\(\) \t]+)\)'
                     '((\s+%(name_chars)s+)+)\;'
                     % {'name_chars': '[-+0-9a-z.]'},
                     re.IGNORECASE)
blankline = re.compile('^\s*$')
change = re.compile('^\s\s+.*$')
endline = re.compile('^ -- (.*) <(.*)>(  ?)((\w+\,\s*)?\d{1,2}\s+\w+\s+'
            '\d{4}\s+\d{1,2}:\d\d:\d\d\s+[-+]\d{4}(\s+\([^\\\(\)]\))?\s*)$')
endline_nodetails = re.compile('^ --(?: (.*) <(.*)>(  ?)((\w+\,\s*)?\d{1,2}'
                '\s+\w+\s+\d{4}\s+\d{1,2}:\d\d:\d\d\s+[-+]\d{4}'
                '(\s+\([^\\\(\)]\))?))?\s*$')
keyvalue= re.compile('^([-0-9a-z]+)=\s*(.*\S)$', re.IGNORECASE)
value_re = re.compile('^([-0-9a-z]+)((\s+.*)?)$', re.IGNORECASE)
xbcs_re = re.compile('^X[BCS]+-', re.IGNORECASE)
emacs_variables = re.compile('^(;;\s*)?Local variables:', re.IGNORECASE)
vim_variables = re.compile('^vim:', re.IGNORECASE)
cvs_keyword = re.compile('^\$\w+:.*\$')
comments = re.compile('^\# ')
more_comments = re.compile('^/\*.*\*/')

old_format_re1 = re.compile('^(\w+\s+\w+\s+\d{1,2} \d{1,2}:\d{1,2}:\d{1,2}'
        '\s+[\w\s]*\d{4})\s+(.*)\s+(<|\()(.*)(\)|>)')
old_format_re2 = re.compile('^(\w+\s+\w+\s+\d{1,2},?\s*\d{4})\s+(.*)'
        '\s+(<|\()(.*)(\)|>)')
old_format_re3 = re.compile('^(\w[-+0-9a-z.]*) \(([^\(\) \t]+)\)\;?',
        re.IGNORECASE)
old_format_re4 = re.compile('^([\w.+-]+)(-| )(\S+) Debian (\S+)',
        re.IGNORECASE)
old_format_re5 = re.compile('^Changes from version (.*) to (.*):',
        re.IGNORECASE)
old_format_re6 = re.compile('^Changes for [\w.+-]+-[\w.+-]+:?\s*$',
        re.IGNORECASE)
old_format_re7 = re.compile('^Old Changelog:\s*$', re.IGNORECASE)
old_format_re8 = re.compile('^(?:\d+:)?\w[\w.+~-]*:?\s*$')


class Changelog(object):
    """Represents a debian/changelog file. You can ask it several things
       about the file.
    """


    def __init__(self, file=None, max_blocks=None,
            allow_empty_author=False, strict=True):
        """Set up the Changelog for use. file is the contects of the
           changelog.
        """
        self._blocks = []
        self.initial_blank_lines = []
        if file is not None:
            try:
                self.parse_changelog(file, max_blocks=max_blocks,
                        allow_empty_author=allow_empty_author,
                        strict=strict)
            except ChangelogParseError:
                pass

    def _parse_error(self, message, strict):
        if strict:
            raise ChangelogParseError(message)
        else:
            warnings.warn(message)

    def parse_changelog(self, file, max_blocks=None,
            allow_empty_author=False, strict=True):
        first_heading = "first heading"
        next_heading_or_eof = "next heading of EOF"
        start_of_change_data = "start of change data"
        more_changes_or_trailer = "more change data or trailer"
        slurp_to_end = "slurp to end"

        self._blocks = []
        self.initial_blank_lines = []

        current_block = ChangeBlock()
        changes = []
        
        state = first_heading
        old_state = None
        if isinstance(file, basestring):
            # Make sure the changelog file is not empty.
            if file is None or len(file.strip()) == 0:
                self._parse_error('Empty changelog file.', strict)
                return

            file = file.splitlines()
        for line in file:
            # Support both lists of lines without the trailing newline and
            # those with trailing newlines (e.g. when given a file object
            # directly)
            line = line.rstrip('\n')
            if state == first_heading or state == next_heading_or_eof:
                top_match = topline.match(line)
                blank_match = blankline.match(line)
                if top_match is not None:
                    if (max_blocks is not None
                            and len(self._blocks) >= max_blocks):
                        return
                    current_block.package = top_match.group(1)
                    current_block._raw_version = top_match.group(2)
                    current_block.distributions = top_match.group(3).lstrip()

                    pairs = line.split(";", 1)[1]
                    all_keys = {}
                    other_pairs = {}
                    for pair in pairs.split(','):
                        pair = pair.strip()
                        kv_match = keyvalue.match(pair)
                        if kv_match is None:
                            self._parse_error("Invalid key-value "
                                        "pair after ';': %s" % pair, strict)
                            continue
                        key = kv_match.group(1)
                        value = kv_match.group(2)
                        if key.lower() in all_keys:
                            self._parse_error("Repeated key-value: "
                                    "%s" % key.lower(), strict)
                        all_keys[key.lower()] = value
                        if key.lower() == "urgency":
                            val_match = value_re.match(value)
                            if val_match is None:
                                self._parse_error("Badly formatted "
                                        "urgency value: %s" % value, strict)
                            else:
                                current_block.urgency = val_match.group(1)
                                comment = val_match.group(2)
                                if comment is not None:
                                    current_block.urgency_comment = comment
                        else:
                            other_pairs[key] = value
                    current_block.other_pairs = other_pairs
                    state = start_of_change_data
                elif blank_match is not None:
                    if state == first_heading:
                        self.initial_blank_lines.append(line)
                    else:
                        self._blocks[-1].add_trailing_line(line)
                else:
                    emacs_match = emacs_variables.match(line)
                    vim_match = vim_variables.match(line)
                    cvs_match = cvs_keyword.match(line)
                    comments_match = comments.match(line)
                    more_comments_match = more_comments.match(line)
                    if ((emacs_match is not None or vim_match is not None)
                            and state != first_heading):
                        self._blocks[-1].add_trailing_line(line)
                        old_state = state
                        state = slurp_to_end
                        continue
                    if (cvs_match is not None or comments_match is not None
                            or more_comments_match is not None):
                        if state == first_heading:
                            self.initial_blank_lines.append(line)
                        else:
                            self._blocks[-1].add_trailing_line(line)
                        continue
                    if ((old_format_re1.match(line) is not None
                        or old_format_re2.match(line) is not None
                        or old_format_re3.match(line) is not None
                        or old_format_re4.match(line) is not None
                        or old_format_re5.match(line) is not None
                        or old_format_re6.match(line) is not None
                        or old_format_re7.match(line) is not None
                        or old_format_re8.match(line) is not None)
                        and state != first_heading):
                            self._blocks[-1].add_trailing_line(line)
                            old_state = state
                            state = slurp_to_end
                            continue
                    self._parse_error("Unexpected line while looking "
                            "for %s: %s" % (state, line), strict)
                    if state == first_heading:
                        self.initial_blank_lines.append(line)
                    else:
                        self._blocks[-1].add_trailing_line(line)
            elif (state == start_of_change_data
                    or state == more_changes_or_trailer):
                change_match = change.match(line)
                end_match = endline.match(line)
                end_no_details_match = endline_nodetails.match(line)
                blank_match = blankline.match(line)
                if change_match is not None:
                    changes.append(line)
                    state = more_changes_or_trailer
                elif end_match is not None:
                    if end_match.group(3) != '  ':
                        self._parse_error("Badly formatted trailer "
                                "line: %s" % line, strict)
                        current_block._trailer_separator = end_match.group(3)
                    current_block.author = "%s <%s>" \
                        % (end_match.group(1), end_match.group(2))
                    current_block.date = end_match.group(4)
                    current_block._changes = changes
                    self._blocks.append(current_block)
                    changes = []
                    current_block = ChangeBlock()
                    state = next_heading_or_eof
                elif end_no_details_match is not None:
                    if not allow_empty_author:
                        self._parse_error("Badly formatted trailer "
                                "line: %s" % line, strict)
                        continue
                    current_block._changes = changes
                    self._blocks.append(current_block)
                    changes = []
                    current_block = ChangeBlock()
                    state = next_heading_or_eof
                elif blank_match is not None:
                    changes.append(line)
                else:
                    cvs_match = cvs_keyword.match(line)
                    comments_match = comments.match(line)
                    more_comments_match = more_comments.match(line)
                    if (cvs_match is not None or comments_match is not None
                            or more_comments_match is not None):
                        changes.append(line)
                        continue
                    self._parse_error("Unexpected line while looking "
                            "for %s: %s" % (state, line), strict)
                    changes.append(line)
            elif state == slurp_to_end:
                if old_state == next_heading_or_eof:
                    self._blocks[-1].add_trailing_line(line)
                else:
                    changes.append(line)
            else:
                 assert False, "Unknown state: %s" % state
                
        if ((state != next_heading_or_eof and state != slurp_to_end)
            or (state == slurp_to_end and old_state != next_heading_or_eof)):
            self._parse_error("Found eof where expected %s" % state,
                    strict)
            current_block._changes = changes
            current_block._no_trailer = True
            self._blocks.append(current_block)

    def get_version(self):
        """Return a Version object for the last version"""
        return self._blocks[0].version

    def set_version(self, version):
        """Set the version of the last changelog block

        version can be a full version string, or a Version object
        """
        self._blocks[0].version = Version(version)

    version = property(get_version, set_version,
                 doc="Version object for last changelog block""")

    ### For convenience, let's expose some of the version properties
    full_version = property(lambda self: self.version.full_version)
    epoch = property(lambda self: self.version.epoch)
    debian_version = property(lambda self: self.version.debian_revision)
    debian_revision = property(lambda self: self.version.debian_revision)
    upstream_version = property(lambda self: self.version.upstream_version)

    def get_package(self):
        """Returns the name of the package in the last version."""
        return self._blocks[0].package
  
    def set_package(self, package):
        self._blocks[0].package = package

    package = property(get_package, set_package,
                     doc="Name of the package in the last version")

    def get_versions(self):
        """Returns a list of version objects that the package went through."""
        return [block.version for block in self._blocks]

    versions = property(get_versions,
                      doc="List of version objects the package went through")

    def _raw_versions(self):
        return [block._raw_version for block in self._blocks]

    def __str__(self):
        cl = "\n".join(self.initial_blank_lines)
        for block in self._blocks:
            cl += str(block)
        return cl

    def __iter__(self):
        return iter(self._blocks)

    def __len__(self):
        return len(self._blocks)

    def set_distributions(self, distributions):
        self._blocks[0].distributions = distributions
    distributions = property(lambda self: self._blocks[0].distributions,
                           set_distributions)

    def set_urgency(self, urgency):
        self._blocks[0].urgency = urgency
    urgency = property(lambda self: self._blocks[0].urgency, set_urgency)

    def add_change(self, change):
        self._blocks[0].add_change(change)

    def set_author(self, author):
        self._blocks[0].author = author
    author = property(lambda self: self._blocks[0].author, set_author)

    def set_date(self, date):
        self._blocks[0].date = date
    date = property(lambda self: self._blocks[0].date, set_date)

    def new_block(self, **kwargs):
        block = ChangeBlock(**kwargs)
        block.add_trailing_line('')
        self._blocks.insert(0, block)

    def write_to_open_file(self, file):
        file.write(self.__str__())
