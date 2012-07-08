#!/usr/bin/python

# axi-query-expand - Query and show possible expansions
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

# Retrieve the top 20 results
matches = enquire.get_mset(0, 20)

# Display the results
show_mset(matches)

# Now, we ask Xapian what are the terms in the index that are most relevant to
# this search.  This can be used to suggest to the user the most useful ways of
# refining the search.

# Select the first 10 documents as the key ones to use to compute relevant
# terms
rset = xapian.RSet()
for m in matches:
    rset.add_document(m.docid)

# This is the "Expansion set" for the search: the 10 most relevant terms
eset = enquire.get_eset(10, rset)

# Print it out.  Note that some terms have a prefix from the database: can we
# filter them out?  Indeed: Xapian allow to give a filter to get_eset.
# Read on...
print
print "Terms that could improve the search:",
print ", ".join(["%s (%.2f%%)" % (res.term, res.weight) for res in eset])


# You can also abuse this feature to show what are the tags that are most
# related to the search results.  This allows you to turn a search based on
# keywords to a search based on semantic attributes, which would be an
# absolutely stunning feature in a GUI.

# We can do it thanks to Xapian allowing to specify a filter for the output of
# get_eset.  This filter filters out all the keywords that are not tags, or
# that were in the list of query terms.
class Filter(xapian.ExpandDecider):
    def __call__(self, term):
        """
        Return true if we want the term, else false
        """
        return term[:2] == "XT"

# This is the "Expansion set" for the search: the 10 most relevant terms that
# match the filter
eset = enquire.get_eset(10, rset, Filter())

# Print out the resulting tags
print
print "Tags that could improve the search:",
print ", ".join(["%s (%.2f%%)" % (res.term[2:], res.weight) for res in eset])

sys.exit(0)
