try:
    import apt_pkg
    HAS_APT=True
except ImportError:
    HAS_APT=False
import cPickle
import os
import os.path
import time
import xapian

class CatalogedTime:
    
    PERSISTANCE_DIR = "/var/lib/apt-xapian-index/"
    CATALOGED_NAME = "cataloged_times.p"

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
        res = dict(timestamp=0,
                   values=[
                       dict(name="catalogedtime", desc="Cataloged timestamp"),
                       ],
                   sources=[
                       dict(
                           path=os.path.join(self.PERSISTANCE_DIR, self.CATALOGED_NAME),
                           desc="first-seen information for every package"
                       )
                   ])
        if not HAS_APT: return res
        if not hasattr(apt_pkg, "config"): return res
        fname = apt_pkg.config.find_file("Dir::Cache::pkgcache")
        if not os.path.exists(fname): return res
        res["timestamp"] = os.path.getmtime(fname)
        return res

    def init(self, info, progress):
        """
        If needed, perform long initialisation tasks here.

        info is a dictionary with useful information.  Currently it contains
        the following values:

          "values": a dict mapping index mnemonics to index numbers

        The progress indicator can be used to report progress.
        """
        if os.access(self.PERSISTANCE_DIR, os.W_OK):
            if not os.path.exists(self.PERSISTANCE_DIR):
                os.makedirs(self.PERSISTANCE_DIR)
            self._packages_cataloged_file = os.path.join(self.PERSISTANCE_DIR, 
                                                         self.CATALOGED_NAME)
        else:
            self._packages_cataloged_file = None
        if (self._packages_cataloged_file and 
            os.path.exists(self._packages_cataloged_file)):
            self._package_cataloged_time = cPickle.load(open(self._packages_cataloged_file))
        else:
            self._package_cataloged_time = {}
        self.now = time.time()
        values = info['values']
        self.value = values.get("catalogedtime", -1)

    def doc(self):
        """
        Return documentation information for this data source.

        The documentation information is a dictionary with these keys:
          name: the name for this data source
          shortDesc: a short description
          fullDoc: the full description as a chapter in ReST format
        """
        return dict(
            name = "Cataloged time",
            shortDesc = "store the timestamp when the package was first cataloged",
            fullDoc = """
            This datasource simply stores a value with the timestamp
            when the package was first cataloged. This is useful to e.g.
            implement a 'Whats new' feature.
            """
        )

    def index(self, document, pkg):
        """
        Update the document with the information from this data source.

        document  is the document to update
        pkg       is the python-apt Package object for this package
        """
        time = self._package_cataloged_time.get(pkg.name, self.now)
        self._package_cataloged_time[pkg.name] = time
        document.add_value(self.value, xapian.sortable_serialise(time))

    def indexDeb822(self, document, pkg):
        """
        Update the document with the information from this data source.

        This is alternative to index, and it is used when indexing with package
        data taken from a custom Packages file.

        document  is the document to update
        pkg       is the Deb822 object for this package
        """
        pass

    def finished(self):
        """
        Called when the indexing is finihsed
        """
        if self._packages_cataloged_file:
            f=open(self._packages_cataloged_file+".new", "w")
            res = cPickle.dump(self._package_cataloged_time, f)
            f.close()
            os.rename(self._packages_cataloged_file+".new",
                      self._packages_cataloged_file)

def init(**kw):
    """
    Create and return the plugin object.
    """
    if not HAS_APT: return None
    return CatalogedTime()
