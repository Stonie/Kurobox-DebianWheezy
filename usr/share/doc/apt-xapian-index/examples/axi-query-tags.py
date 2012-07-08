#!/usr/bin/python

# axi-query-tags - Look for Debtags tags by keyword
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
                description="Find the Debtags tags corresponding to some keywords")

(options, args) = parser.parse_args()


# Import the rest here so we don't need dependencies to be installed only to
# print commandline help
import os
import xapian
from aptxapianindex import *


# Instantiate a xapian.Database object for read only access to the index
db = xapian.Database(XAPIANDB)

# Build the base query
query = xapian.Query(xapian.Query.OP_OR, termsForSimpleQuery(args))

# Perform the query
enquire = xapian.Enquire(db)
enquire.set_query(query)

# Now, instead of showing the results of the query, we ask Xapian what are the
# terms in the index that are most relevant to this search.
# Normally, you would use the results to suggest the user possible ways for
# refining the search.  I instead abuse this feature to see what are the tags
# that are most related to the search results.

# Use an adaptive cutoff to avoid to pick bad results as references
matches = enquire.get_mset(0, 1)
topWeight = matches[0].weight
enquire.set_cutoff(0, topWeight * 0.7)

# Select the first 10 documents as the key ones to use to compute relevant
# terms
rset = xapian.RSet()
for m in enquire.get_mset(0, 10):
    rset.add_document(m.docid)

# Xapian supports providing a filter object, to say that we are only interested
# in some terms.
# This one filters out all the keywords that are not tags, or that were in the
# list of query terms.
class Filter(xapian.ExpandDecider):
    def __call__(self, term):
        """
        Return true if we want the term, else false
        """
        return term[:2] == "XT"

# This is the "Expansion set" for the search: the 10 most relevant terms that
# match the filter
eset = enquire.get_eset(10, rset, Filter())

# Print out the results
for res in eset:
    print "%.2f %s" % (res.weight, res.term[2:])

sys.exit(0)
