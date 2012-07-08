#!/usr/bin/python

#
# axi-query - Example program to query the apt-xapian-index
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
#

from aptxapianindex import *
from optparse import OptionParser
import sys

VERSION="0.1"

class Parser(OptionParser):
    def __init__(self, *args, **kwargs):
        OptionParser.__init__(self, *args, **kwargs)

    def error(self, msg):
        sys.stderr.write("%s: error: %s\n\n" % (self.get_prog_name(), msg))
        self.print_help(sys.stderr)
        sys.exit(2)

parser = Parser(usage="usage: %prog [options]",
                version="%prog "+ VERSION,
                description="Query the Apt Xapian index.  Command line arguments can be keywords or Debtags tags")
parser.add_option("-s", "--sort", help="sort by the given value, as listed in %s" % XAPIANDBVALUES)

(options, args) = parser.parse_args()


import os
import xapian
import warnings
# Yes, apt, thanks, I know, the api isn't stable, thank you so very much
#warnings.simplefilter('ignore', FutureWarning)
warnings.filterwarnings("ignore","apt API not stable yet")
import apt
warnings.resetwarnings()

# Access the Xapian index
db = xapian.Database(XAPIANDB)

# Build the query
stemmer = xapian.Stem("english")
terms = []
for word in args:
    if word.islower() and word.find("::") != -1:
        # If it's lowercase and contains, :: it's a tag
        # TODO: lookup in debtags' vocabulary instead
        terms.append("XT"+word)
    else:
        # Else we make a term
        word = word.lower()
        terms.append(word)
        stem = stemmer(word)
        # If it has stemming, add that to the query, too
        if stem != word:
            terms.append("Z"+stem)
query = xapian.Query(xapian.Query.OP_OR, terms)

# Perform the query
enquire = xapian.Enquire(db)
enquire.set_query(query)
if options.sort:
    values = readValueDB(XAPIANDBVALUES)

    # If we don't sort by relevance, we need to specify a cutoff in order to
    # remove poor results from the output
    #
    # Note: ept-cache implements an adaptive cutoff as follows:
    # 1. Retrieve only one result, with default sorting.  Read its relevance as
    #    the maximum relevance.
    # 2. Set the cutoff as some percentage of the maximum relevance
    # 3. Set sort by the wanted value
    # 4. Perform the query
    enquire.set_cutoff(60)

    # Sort by the requested value
    enquire.set_sort_by_value(values[options.sort])

# Display the results.
cache = apt.Cache()
matches = enquire.get_mset(0, 20)
print "%i results found." % matches.get_matches_estimated()
print "Results 1-%i:" % matches.size()
for m in matches:
    name = m.document.get_data()
    pkg = cache[name]
    if pkg.candidate:
        print "%i%% %s - %s" % (m.percent, name, pkg.candidate.summary)

sys.exit(0)
