#!/usr/bin/env ruby

# axi-query-tags - Look for Debtags tags by keyword
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

# Instantiate a xapian.Database object for read only access to the index
db = Xapian::Database.new(XAPIANDB)

# Stemmer function to generate stemmed search keywords
stemmer = Xapian::Stem.new("english")

# Build the base query
query = Xapian::Query.new(Xapian::Query::OP_OR, terms_for_simple_query(args))

# Perform the query
enquire = Xapian::Enquire.new(db)
enquire.query = query

# Now, instead of showing the results of the query, we ask Xapian what are the
# terms in the index that are most relevant to this search.
# Normally, you would use the results to suggest the user possible ways for
# refining the search.  I instead abuse this feature to see what are the tags
# that are most related to the search results.

# Select the first 10 documents as the key ones to use to compute relevant
# terms
rset = Xapian::RSet.new
enquire.mset(0, 5).matches.each do |m|
  # TODO: use adaptive quality threshold here
  rset.add_document(m.docid)
end

# Xapian supports providing a filter object, to say that we are only interested
# in some terms.
# This one filters out all the keywords that are not tags, or that were in the
# list of query terms.
class Filter < Xapian::ExpandDecider

  # Return true if we want the term, else false
  def __call__ term
    term[0..1] == "XT"
  end
end

# This is the "Expansion set" for the search: the 10 most relevant terms that
# match the filter
eset = enquire.eset(10, rset, Filter.new)

# Print out the results
eset.terms.each do |res|
  puts "%.2f %s" % [res.weight, res.name[2..-1]]
end
