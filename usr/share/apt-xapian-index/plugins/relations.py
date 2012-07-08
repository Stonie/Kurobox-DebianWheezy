try:
    import apt
    import apt_pkg
    HAS_APT=True
except ImportError:
    HAS_APT=False
import os, os.path
import re

class Relations:
    def __init__(self):
        self.prefix_desc=[
            dict(idx="XRD", qp="reldep:", type="bool",
                 desc="Relation: depends",
                 ldesc="Depends: relationship, package names only"),
            dict(idx="XRR", qp="relrec:", type="bool",
                 desc="Relation: recommends",
                 ldesc="Recommends: relationship, package names only"),
            dict(idx="XRS", qp="relsug:", type="bool",
                 desc="Relation: suggests",
                 ldesc="Suggests: relationship, package names only"),
            dict(idx="XRE", qp="relenh:", type="bool",
                 desc="Relation: ehnances",
                 ldesc="Enhances: relationship, package names only"),
            dict(idx="XRP", qp="relpre:", type="bool",
                 desc="Relation: pre-depends",
                 ldesc="Pre-Depends: relationship, package names only"),
            dict(idx="XRB", qp="relbre:", type="bool",
                 desc="Relation: breaks",
                 ldesc="Breaks: relationship, package names only"),
            dict(idx="XRC", qp="relcon:", type="bool",
                 desc="Relation: conflicts",
                 ldesc="Conflicts: relationship, package names only"),
        ]
        self.prefixes = [(d["idx"], d["ldesc"][:d["ldesc"].find(":")]) for d in self.prefix_desc]
        self.re_split = re.compile(r"\s*[|,]\s*")

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
                prefixes=self.prefix_desc,
        )
        if kw.get("system", True):
            if not HAS_APT: return res
            file = apt_pkg.config.find_file("Dir::Cache::pkgcache")
            if not os.path.exists(file):
                return res
            ts = os.path.getmtime(file)
        else:
            file = "(stdin)"
            ts = 0
        res["sources"] = [dict(path=file, desc="APT index")]
        res["timestamp"] = ts
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
            name = "Package relationships",
            shortDesc = "Debian package relationships",
            fullDoc = """
            Indexes one term per relationship declared with other packages. All
            relationship terms have prefixes starting with XR plus an extra
            prefix letter per relationship type.

            Terms are built using only the package names in the relationship
            fields: versioning and boolean operators are ignored.
            """
        )

    def _index_rel(self, pfx, val, doc):
        """
        Extract all package names from @val and index them as terms with prefix
        @pfx
        """
        for name in self.re_split.split(val):
            doc.add_term(pfx + name.split(None, 1)[0])

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
        for pfx, field in self.prefixes:
            val = rec.get(field, None)
            if val is None: continue
            self._index_rel(pfx, val, document)

    def indexDeb822(self, document, pkg):
        """
        Update the document with the information from this data source.

        This is alternative to index, and it is used when indexing with package
        data taken from a custom Packages file.

        document  is the document to update
        pkg       is the Deb822 object for this package
        """
        for pfx, field in self.prefixes:
            val = pkg.get(field, None)
            if val is None: continue
            self._index_rel(pfx, val, document)

def init(**kw):
    """
    Create and return the plugin object.
    """
    return Relations()
