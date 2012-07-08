#!/usr/bin/env ruby

#
# axi-query - Example program to query the apt-xapian-index
#
# Copyright (C) 2007  Enrico Zini <enrico@debian.org>
# Copyright (C) 2008  Daniel Brumbaugh Keeney
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

require 'optparse'

type = nil
OptionParser.new do |opts|

  opts.program_name = 'axi-query-pkgtype.rb'
  opts.version = '0.1'
  opts.release = '1203587714'

  opts.banner =
    "Query the Apt Xapian index.  Command line arguments can be keywords or Debtags tags"


  opts.on '-t', '--type TYPE', "package type, one of 'game', 'gui', 'cmdline' or 'editor'" do |v|
    type = v.to_sym
  end

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end

end.parse! rescue ( puts 'try axi-query-pkgtype.rb --help'; exit 2 )

args = ARGV.collect do |i| i.dup; end


# Import the rest here so we don't need dependencies to be installed only to
# print commandline help
require 'xapian'

# Access the Xapian index
db = Xapian::Database.new(XAPIANDB)

# Build the query
stemmer = Xapian::Stem.new("english")
terms = []
args.each do |word|
    if word.islower and word.find("::") != -1:
        # If it's lowercase and contains, :: it's a tag
        # TODO: lookup in debtags' vocabulary instead
        terms<<("XT"+word)
    else:
        # Else we make a term
        word = word.lower
        terms<<(word)
        stem = stemmer(word)
        # If it has stemming, add that to the query, too
        if stem != word:
            terms<<("Z"+stem)
query = Xapian::Query.new(Xapian::Query::OP_OR, terms)

# Perform the query
enquire = Xapian::Enquire.new(db)
enquire.query = query
if options.sort:
    values = read_value_db(XAPIANDBVALUES)

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
cache = apt.Cache
matches = enquire.mset(0, 20)
print "%i results found." % matches.matches_estimated
print "Results 1-%i:" % matches.size
matches.matches.each do |m|
    name = m.document.data
    pkg = cache[name]
    print "%i%% %s - %s" % (m.percent, name, pkg.summary)
end
