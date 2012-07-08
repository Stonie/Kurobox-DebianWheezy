# Add debtags tags to the index

import re, os, os.path
try:
    from debian import debtags
except ImportError:
    from debian_bundle import debtags

DEBTAGSDB = "/var/lib/debtags/package-tags"

class Debtags:
    def info(self):
        """
        Return general information about the plugin.

        The information returned is a dict with various keywords:
         
         timestamp (required)
           the last modified timestamp of this data source.  This will be used
           to see if we need to update the database or not.  A timestamp of 0
           means that this data source is either missing or always up to date.
         values (optional)
           an array of dicts { name: name, desc: description }, one for every
           numeric value indexed by this data source.

        Note that this method can be called before init.  The idea is that, if
        the timestamp shows that this plugin is currently not needed, then the
        long initialisation can just be skipped.
        """
        return dict(
                timestamp=os.path.getmtime(DEBTAGSDB),
                sources=[dict(path=DEBTAGSDB, desc="Debtags tag information")],
                prefixes=[
                    dict(idx="XT", qp="tag:", type="bool",
                         desc="Debtags tag",
                         ldesc="Debtags package categories"),
                ],
        )

    def init(self, info, progress):
        """
        If needed, perform long initialisation tasks here.

        info is a dictionary with useful information.  Currently it contains
        the following values:

          "values": a dict mapping index mnemonics to index numbers

        The progress indicator can be used to report progress.
        """
        progress.begin("Reading Debtags database")
        self.db = debtags.DB()
        # Read full database, skipping special and todo tags
        tagFilter = re.compile(r"^special::.+$|^.+::TODO$")
        self.db.read(open(DEBTAGSDB, "r"), lambda x: not tagFilter.match(x))
        progress.end()

    def doc(self):
        """
        Return documentation information for this data source.

        The documentation information is a dictionary with these keys:
          name: the name for this data source
          shortDesc: a short description
          fullDoc: the full description as a chapter in ReST format
        """
        return dict(
            name = "Debtags",
            shortDesc = "Debtags tag information",
            fullDoc = """
            The Debtags data source indexes Debtags tags as terms with the
            ``XT`` prefix; for example: 'XTrole::program'.

            Using the ``XT`` terms, queries can be enhanced with semantic
            information.  Xapian's support for complex expressions in queries
            can be used to great effect: for example::

                XTrole::program AND XTuse::gameplaying AND (XTinterface::x11 OR XTinterface::3d)

            ``XT`` terms can also be used to improve the quality of search
            results.  For example, the ``gimp`` package would not usually show
            up when searching the terms ``image editor``.  This can be solved
            using the following technique:

             1. Perform a normal query
             2. Put the first 5 or so results in an Rset
             3. Call Enquire::get_eset using the Rset and an expand filter that
                only accepts ``XT`` terms.  This gives you the tags that are
                most relevant to the query.
             4. Add the resulting terms to the initial query, and search again.

            The Debtags data source is provided by the ``debtags`` package.
            """
        )

    def index(self, document, pkg):
        """
        Update the document with the information from this data source.

        document  is the document to update
        pkg       is the python-apt Package object for this package
        """
        for tag in self.db.tags_of_package(pkg.name):
            document.add_term("XT"+tag)

    def indexDeb822(self, document, pkg):
        """
        Update the document with the information from this data source.

        This is alternative to index, and it is used when indexing with package
        data taken from a custom Packages file.

        document  is the document to update
        pkg       is the Deb822 object for this package
        """
        for tag in self.db.tags_of_package(pkg["Package"]):
            document.add_term("XT"+tag)

def init(**kw):
    """
    Create and return the plugin object.
    """
    if not os.path.exists(DEBTAGSDB):
        return None
    return Debtags()
