#!/usr/bin/env ruby

# axi-query-adaptivecutoff - Use an adaptive cutoff to select results
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
require 'aptxapianindex'


# Instantiate a Xapian::Database object for read only access to the index
db = Xapian::Database.new(XAPIANDB)

# Build the base query as seen in axi-query-simple.rb
query = Xapian::Query.new(Xapian::Query::OP_OR, terms_for_simple_query(args))

# Add the simple user filter, if requeste
query = add_simple_filter_to_query(query, type)

# Perform the query
enquire = Xapian::Enquire.new(db)
enquire.query = query

# Retrieve the first result, and check its relevance
matches = enquire.mset(0, 1)
top_weight = matches.matches.first.weight

# Tell Xapian that we only want results that are at least 70% as good as that
p enquire.methods.sort
enquire.cutoff!(0, top_weight * 0.7)

# Now we have a meaningful cutoff, so we can get a larger number of results:
# thanks to the cutoff, approximate results will stop before starting to be
# really bad.
matches = enquire.mset(0, 200)

# Display the results
show_mset(matches)
