#!/usr/bin/env ruby
#
# axi-query-similar - Show packages similar to a given one
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
#
# http://svn.debian.org/wsvn/collab-maint/deb-maint/apt-xapian-index/trunk/examples/axi-query-similar.py?op=file&rev=5455&sc=0

require 'xapian'
require 'aptxapianindex'

# Instantiate a xapian.Database object for read only access to the index
DB = Xapian::Database.new(XAPIANDB)

# Get the document corresponding to the package with the given name
def doc_for_package pkgname
  # Query the term with the package name
  query = Xapian::Query.new("XP" << pkgname)
  enquire = Xapian::Enquire.new(DB)
  enquire.query = query
  # Get the top result only
  matches = enquire.mset(0, 1)
  if matches.size == 0
    nil
  else
    m = matches.matches.first
    m.document
  end
end

# Build a term list with all the terms in the given packages
terms = Array.new
a = Array.new
ARGV.each do |pkgname|
  a << "XP#{pkgname}"
  # Get the document corresponding to the package name
  doc = doc_for_package pkgname
  next unless doc
  # Retrieve all the terms in the document
  doc.terms.each do |t|
    if t.term.length < 2 or t.term[0..2] != 'XP'
      terms << t.term
    end
  end
end

# Build the big OR query
query = Xapian::Query.new(Xapian::Query::OP_AND_NOT,
            # Terms we want
            Xapian::Query.new(Xapian::Query::OP_OR, terms),
            # AND NOT the input packages
            Xapian::Query.new(Xapian::Query::OP_OR, a))
a = nil

# Perform the query
enquire = Xapian::Enquire.new(DB)
enquire.query = query

# Retrieve the top 20 results
matches = enquire.mset(0, 20)

# Display the results
show_mset(matches)
