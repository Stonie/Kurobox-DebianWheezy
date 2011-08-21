#!/usr/bin/python

# axi-query-similar - Show packages similar to a given one
#
# Copyright (C) 2007  Enrico Zini <enrico@debian.org>
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
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

from optparse import OptionParser
import sys

VERSION="0.1"

# Let's start with a simple command line parser with help
class Parser(OptionParser):
    def __init__(self, *args, **kwargs):
        OptionParser.__init__(self, *args, **kwargs)

    def error(self, msg):
        sys.stderr.write("%s: error: %s\n\n" % (self.get_prog_name(), msg))
        self.print_help(sys.stderr)
        sys.exit(2)

parser = Parser(usage="usage: %prog [options] package(s)",
                version="%prog "+ VERSION,
                description="Find the packages similar to the given ones")

(options, args) = parser.parse_args()


# Import the rest here so we don't need dependencies to be installed only to
# print commandline help
import os
import xapian
from aptxapianindex import *


# Instantiate a xapian.Database object for read only access to the index
db = xapian.Database(XAPIANDB)

def docForPackage(pkgname):
    "Get the document corresponding to the package with the given name"
    # Query the term with the package name
    query = xapian.Query("XP"+pkgname)
    enquire = xapian.Enquire(db)
    enquire.set_query(query)
    # Get the top result only
    matches = enquire.get_mset(0, 1)
    if matches.size() == 0:
        return None
    else:
        m = matches[0]
        return m.document

# Build a term list with all the terms in the given packages
terms = []
for pkgname in args:
    # Get the document corresponding to the package name
    doc = docForPackage(pkgname)
    if not doc: continue
    # Retrieve all the terms in the document
    for t in doc.termlist():
        if len(t.term) < 2 or t.term[:2] != 'XP':
            terms.append(t.term)

# Build the big OR query
query = xapian.Query(xapian.Query.OP_AND_NOT,
            # Terms we want
            xapian.Query(xapian.Query.OP_OR, terms),
            # AND NOT the input packages
            xapian.Query(xapian.Query.OP_OR, ["XP"+name for name in args]))

# Perform the query
enquire = xapian.Enquire(db)
enquire.set_query(query)

# Retrieve the top 20 results
matches = enquire.get_mset(0, 20)

# Display the results
show_mset(matches)

sys.exit(0)
