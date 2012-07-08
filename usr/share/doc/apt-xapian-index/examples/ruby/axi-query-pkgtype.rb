#!/usr/bin/env ruby
#
# axi-query-pkgtype - Like axi-query-simple.py, but with a simple
#                     result filter
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

# This is our little database of simple Debtags filters we provide: the name
# entered by the user in "--type" maps to a piece of Xapian query
FILTER_DB = {

  # We can do simple AND queries...
  :game => Xapian::Query.new(Xapian::Query::OP_AND, ['XTuse::gameplaying', 'XTrole::program']),

  # Or we can do complicate binary expressions...
  :gui => Xapian::Query.new(
    Xapian::Query::OP_AND, Xapian::Query.new('XTrole::program'),
    Xapian::Query.new(Xapian::Query::OP_OR, 'XTinterface::x11', 'XTinterface::3d')),

  :cmdline => Xapian::Query.new(Xapian::Query::OP_AND, 'XTrole::program', 'XTinterface::commandline'),

  :editor => Xapian::Query.new(Xapian::Query::OP_AND, 'XTrole::program', 'XTuse::editing')

  # Feel free to invent more
}

# Instantiate a xapian.Database object for read only access to the index
db = Xapian::Database.new(XAPIANDB)

# Build the base query as seen in axi-query-simple.py
query = Xapian::Query.new(Xapian::Query::OP_OR, terms_for_simple_query(args))

# See if the user wants to use one of the result filters
if type
  if FILTER_DB.has_key? type
    # If a filter was requested, AND it with the query
    query = Xapian::Query.new(Xapian::Query::OP_AND, query, FILTER_DB[type])
  else
    $stderr.puts "Invalid filter type.  Try one of %s" % FILTER_DB.keys.join(', ')
    exit 1
  end
end

# Perform the query, all the rest is as in axi-query-simple.py
enquire = Xapian::Enquire.new(db)
enquire.query = query

# Display the top 20 results, sorted by how well they match

matches = enquire.mset(0, 20)
puts "%i results found." % matches.matches_estimated
puts "Results 1-%i:" % matches.size
matches.matches.each do |m|
  # /var/lib/apt-xapian-index/README tells us that the Xapian document data
  # is the package name.
  name = m.document.data

  # Print the match, together with the short description
  puts "%i%% %s - %s" % [m.percent, name, 'summary not available']
end
