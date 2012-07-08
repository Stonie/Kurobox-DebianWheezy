# Add debtags tags to the index

try:
    import apt
    import apt_pkg
    HAS_APT=True
except ImportError:
    HAS_APT=False
import re, os, os.path

DEBTAGSDB = "/var/lib/debtags/package-tags"

class AptTags(object):
    def __init__(self):
        self.re_expand = re.compile(r"\b([^{]+)\{([^}]+)\}")
        self.re_split = re.compile(r"\s*,\s*")

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
        if not HAS_APT: return dict(timestamp = 0)
        if not hasattr(apt_pkg, "config"):
            return dict(timestamp = 0)
        file = apt_pkg.config.find_file("Dir::Cache::pkgcache")
        if not os.path.exists(file):
            return dict(timestamp = 0)
        return dict(
                timestamp=os.path.getmtime(file),
                sources=[dict(path=file, desc="APT index")],
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
        pass

    def doc(self):
        """
        Return documentation information for this data source.

        The documentation information is a dictionary with these keys:
          name: the name for this data source
          shortDesc: a short description
          fullDoc: the full description as a chapter in ReST format
        """
        return dict(
            name = "Apt tags",
            shortDesc = "Debtags tag information from the Packages file",
            fullDoc = """
            The Apt tags data source indexes Debtags tags as found in the
            Packages file as terms with the ``XT`` prefix; for example:
            'XTrole::program'.

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

            The Apt tags data source will not work when Debtags is installed,
            as Debtags is able to provide a better set of tags.
            """
        )

    def _parse_and_index(self, tagstring, document):
        """
        Parse tagstring into tags, and index the tags
        """
        def expandTags(mo):
            root = mo.group(1)
            ends = self.re_split.split(mo.group(2))
            return ", ".join([root + x for x in ends])
        tagstring = self.re_expand.sub(expandTags, tagstring)
        for tag in self.re_split.split(tagstring):
            document.add_term("XT"+tag)
        

    def index(self, document, pkg):
        """
        Update the document with the information from this data source.

        document  is the document to update
        pkg       is the python-apt Package object for this package
        """
        ver = pkg.candidate
        if ver is None: return
        rec = ver.record
        if rec is None: return
        try:
            self._parse_and_index(rec['Tag'], document)
        except KeyError:
            return

    def indexDeb822(self, document, pkg):
        """
        Update the document with the information from this data source.

        This is alternative to index, and it is used when indexing with package
        data taken from a custom Packages file.

        document  is the document to update
        pkg       is the Deb822 object for this package
        """
        try:
            self._parse_and_index(pkg['Tag'], document)
        except KeyError:
            return


def init(**kw):
    """
    Create and return the plugin object.
    """
    if os.path.exists(DEBTAGSDB):
        return None
    return AptTags()
