#!/usr/bin/python

# axi-query-adaptivecutoff - Use an adaptive cutoff to select results
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

parser = Parser(usage="usage: %prog [options] keywords",
                version="%prog "+ VERSION,
                description="Query the Apt Xapian index.  Command line arguments can be keywords or Debtags tags")
parser.add_option("-t", "--type", help="package type, one of 'game', 'gui', 'cmdline' or 'editor'")

(options, args) = parser.parse_args()


# Import the rest here so we don't need dependencies to be installed only to
# print commandline help
import os
import xapian
from aptxapianindex import *


# Instantiate a xapian.Database object for read only access to the index
db = xapian.Database(XAPIANDB)

# Build the base query as seen in axi-query-simple.py
query = xapian.Query(xapian.Query.OP_OR, termsForSimpleQuery(args))

# Add the simple user filter, if requeste
query = addSimpleFilterToQuery(query, options.type)

# Perform the query
enquire = xapian.Enquire(db)
enquire.set_query(query)

# Retrieve the first result, and check its relevance
matches = enquire.get_mset(0, 1)
topWeight = matches[0].weight

# Tell Xapian that we only want results that are at least 70% as good as that
enquire.set_cutoff(0, topWeight * 0.7)

# Now we have a meaningful cutoff, so we can get a larger number of results:
# thanks to the cutoff, approximate results will stop before starting to be
# really bad.
matches = enquire.get_mset(0, 200)

# Display the results
show_mset(matches)

sys.exit(0)
