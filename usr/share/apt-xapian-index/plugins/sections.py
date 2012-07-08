try:
    import apt
    import apt_pkg
    HAS_APT=True
except ImportError:
    HAS_APT=False
import xapian
import os, os.path

class Sections:
    def info(self, **kw):
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
        res = dict(
                timestamp=0,
                prefixes=[
                    dict(idx="XS", qp="sec:", type="bool",
                         desc="Package section",
                         ldesc="Debian package section, max one per package"),
                ],
        )
        if kw.get("system", True):
            if not HAS_APT: return res
            file = apt_pkg.config.find_file("Dir::Cache::pkgcache")
            if not os.path.exists(file): return res
            ts = os.path.getmtime(file)
        else:
            file = "(stdin)"
            ts = 0
        res["timestamp"] = ts
        res["sources"] = [dict(path=file, desc="APT index")]
        return res

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
            name = "Package sections",
            shortDesc = "Debian package sections",
            fullDoc = """
            The section is indexed literally, with the prefix XS.
            """
        )

    def index(self, document, pkg):
        """
        Update the document with the information from this data source.

        document  is the document to update
        pkg       is the python-apt Package object for this package
        """
        sec = pkg.section
        if sec:
            document.add_term("XS"+sec.lower())

    def indexDeb822(self, document, pkg):
        """
        Update the document with the information from this data source.

        This is alternative to index, and it is used when indexing with package
        data taken from a custom Packages file.

        document  is the document to update
        pkg       is the Deb822 object for this package
        """
        sec = pkg["Section"]
        if sec:
            document.add_term("XS"+sec.lower())

def init(**kw):
    """
    Create and return the plugin object.
    """
    return Sections()
