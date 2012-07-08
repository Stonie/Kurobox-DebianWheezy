import xapian
import os, os.path

AXI_ALIASES = os.environ.get("AXI_ALIASES", "/etc/apt-xapian-index/aliases/:/usr/share/apt-xapian-index/aliases/")

def read_db(progress=None):
    aliases = []
    maxts = 0
    files = []
    for d in AXI_ALIASES.split(":"):
        if not os.path.isdir(d): continue
        for f in os.listdir(d):
            if f[0] == '.': continue
            fname = os.path.join(d, f)
            ts = os.path.getmtime(fname)
            if ts > maxts:
                maxts = ts
            if progress: progress.verbose("Reading aliases from %s..." % fname)
            info = dict(path=fname)
            for idx, line in enumerate(open(fname)):
                line = line.strip()
                if idx == 0 and line[0] == '#':
                    # Take a comment at start of file as file description
                    info["desc"] = line[1:].strip()
                    continue
                # Skip comments and empty lines
                if not line or line[0] == '#': continue
                line = line.split()
                aliases.append(line)
            info.setdefault("desc", "synonyms for well-known terms")
            files.append(info)
    return maxts, aliases, files

class Aliases:
    def __init__(self, maxts, db, files):
        self.maxts = maxts
        self.db = db
        self.files = files

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
        return dict(timestamp=self.maxts, sources=self.files)

    def init(self, info, progress):
        """
        If needed, perform long initialisation tasks here.

        info is a dictionary with useful information.  Currently it contains
        the following values:

          "values": a dict mapping index mnemonics to index numbers

        The progress indicator can be used to report progress.
        """
        pass

    def send_extra_info(self, db=None, **kw):
        """
        Receive extra parameters from the indexer.

        This may be called more than once, but after init().

        We are using this to get the database instance
        """
        if db is not None:
            for row in self.db:
                for a in row[1:]:
                    db.add_synonym(row[0], a)

    def doc(self):
        """
        Return documentation information for this data source.

        The documentation information is a dictionary with these keys:
          name: the name for this data source
          shortDesc: a short description
          fullDoc: the full description as a chapter in ReST format
        """
        return dict(
            name = "Package aliases",
            shortDesc = "aliases for well known programs",
            fullDoc = """
            The Aliases data source does not change documents in the index, but
            adds synonims to the database. Synonims allow to obtain good
            results while looking for well-know software names, even if such
            software does not exist in Debian.
            """
        )

    def index(self, document, pkg):
        """
        Update the document with the information from this data source.

        document  is the document to update
        pkg       is the python-apt Package object for this package
        """
        pass

    def indexDeb822(self, document, pkg):
        """
        Update the document with the information from this data source.

        This is alternative to index, and it is used when indexing with package
        data taken from a custom Packages file.

        document  is the document to update
        pkg       is the Deb822 object for this package
        """
        pass

def init(progress=None, **kw):
    """
    Create and return the plugin object.
    """
    maxts, db, files = read_db(progress)
    if not db: return None
    return Aliases(maxts, db, files)
