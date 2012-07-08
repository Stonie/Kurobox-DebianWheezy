#!/usr/bin/env ruby
#
# axi-query-simple - apt-cache search replacement using apt-xapian-index
#
# Copyright (C) 2007  Enrico Zini <enrico@debian.org>
# Copyright (C) 2008  Daniel Brumbaugh Keeney <devi.webmaster@gmail.com>
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

# http://svn.debian.org/wsvn/collab-maint/deb-maint/apt-xapian-index/trunk/examples/axi-query-simple.py?op=file&rev=5455&sc=0

require 'xapian'

# Setup configuration
XAPIANDBPATH = "/var/lib/apt-xapian-index"
XAPIANDB = XAPIANDBPATH + "/index"

# Instantiate a xapian.Database object for read only access to the index
db = Xapian::Database.new( XAPIANDB )

# Stemmer function to generate stemmed search keywords
stemmer = Xapian::Stem.new 'english'

# Build the terms that will go in the query
terms = []
ARGV.each do |word|
  word = word.dup
  if not word.downcase! and word['::']
    # If it's lowercase and it contains '::', then we consider it a Debtags
    # tag.  A better way could be to look up arguments in
    # /var/lib/debtags/vocabulary
    #
    # According to /var/lib/apt-xapian-index/README, Debtags tags are
    # indexed with the 'XT' prefix.
    terms << ( 'XT' << word )
  else
    # If it is not a Debtags tag, then we consider it a normal keyword.
    terms << word
    # If the word has a stemmed version, add it to the query.
    # /var/lib/apt-xapian-index/README tells us that stemmed terms have a
    # 'Z' prefix.
    stem = stemmer.call(word)

    terms << ('Z' << stem) unless stem == word
  end
end

# OR the terms together into a Xapian query.
#
# One may ask, why OR and not AND?  The reason is that, contrarily to
# apt-cache, Xapian scores results according to how well they matched.
#
# Matches that math all the terms will score higher than the others, so if we
# build an OR query what we really have is an AND query that gracefully
# degenerates to closer matches when they run out of perfect results.
#
# This allows stemmed searches to work nicely: if you look for 'editing', then
# the query will be 'editing OR Zedit'.  Packages with the word 'editing' will
# match both and score higher, and packages with the word 'edited' will still
# match 'Zedit' and be included in the results.
query = Xapian::Query.new(Xapian::Query::OP_OR, terms)

# Perform the query
enquire = Xapian::Enquire.new db
enquire.query = query

# Display the top 20 results, sorted by how well they match
matches = enquire.mset(0, 20)
puts "%i results found." % matches.matches_estimated
puts "Results 1-%i:" % matches.size
matches.matches.each do |m|
  # /var/lib/apt-xapian-index/README tells us that the Xapian document data
  # is the package name.
  name = m.document.data

  # Get the package record out of the Apt cache, so we can retrieve the short
  # description
  #pkg = Apt::cache[name]

  # Print the match, together with the short description
  puts "%i%% %s - %s" % [m.percent, name, 'summary not available']

end
