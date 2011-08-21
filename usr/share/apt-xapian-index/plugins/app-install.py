try:
    from xdg.DesktopEntry import DesktopEntry
    from xdg import Locale
    HAS_XDG=True
except ImportError, e:
    HAS_XDG=False

import axi.indexer
import apt
import xapian
import os, os.path

APPINSTALLDIR="/usr/share/app-install/desktop/"

class Indexer:
    def __init__(self, lang, val_popcon, progress=None):
        self.val_popcon = val_popcon
        self.progress = progress
        if lang is None:
            lang = "en"
        self.lang = lang
        self.xlang = lang.split("_")[0]
        self.xdglangs = Locale.expand_languages(lang)
        self.indexer = xapian.TermGenerator()
        # Get a stemmer for this language, if available
        try:
            self.stemmer = xapian.Stem(self.xlang)
            self.indexer.set_stemmer(self.stemmer)
        except xapian.InvalidArgumentError:
            pass

    def index(self, document, fname, entry):
        # Index a single term "XD", marking that the package contains .desktop
        # files
        document.add_term("XD")

        # Index the name of the .desktop file, with prefix XDF
        document.add_term("XDF" + fname)

        # Index keywords retrieved in this indexer's language
        self.indexer.set_document(document)
        oldlangs = Locale.langs
        try:
            Locale.langs = self.xdglangs
            self.indexer.index_text_without_positions(entry.getName())
            self.indexer.index_text_without_positions(entry.getGenericName())
            self.indexer.index_text_without_positions(entry.getComment())
        finally:
            Locale.langs = oldlangs

        # Index .desktop categories, with prefix XDT
        for cat in entry.getCategories():
            document.add_term("XDT"+cat)

        # Add an "app-popcon" value with popcon rank
        try:
            popcon = int(entry.get("X-AppInstall-Popcon"))
        except ValueError, e:
            if self.progress:
                self.progress.verbose("%s: parsing X-AppInstall-Popcon: %s" % (fname, str(e)))
            popcon = -1
        if self.val_popcon != -1:
            document.add_value(self.val_popcon, xapian.sortable_serialise(popcon));


class AppInstall(object):
    def __init__(self, langs, progress):
        self.langs = langs
        self.progress = progress

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
        maxts = 0
        for f in os.listdir(APPINSTALLDIR):
            if f[0] == '.' or not f.endswith(".desktop"): continue
            ts = os.path.getmtime(os.path.join(APPINSTALLDIR, f))
            if ts > maxts: maxts = ts
        return dict(
                timestamp = maxts,
                values = [
                    dict(name = "app-popcon", desc = "app-install .desktop popcon rank"),
                ])

    def init(self, info, progress):
        """
        If needed, perform long initialisation tasks here.

        info is a dictionary with useful information.  Currently it contains
        the following values:

          "values": a dict mapping index mnemonics to index numbers

        The progress indicator can be used to report progress.
        """

        # Read the value indexes we will use
        values = info['values']
        self.val_popcon = values.get("app-popcon", -1)

        self.indexers = [Indexer(lang, self.val_popcon, progress) for lang in [None] + list(self.langs)]
        self.entries = {}

        progress.begin("Reading .desktop files from %s" % APPINSTALLDIR)
        for f in os.listdir(APPINSTALLDIR):
            if f[0] == '.' or not f.endswith(".desktop"): continue
            entry = DesktopEntry(os.path.join(APPINSTALLDIR, f))
            pkg = entry.get("X-AppInstall-Package")
            self.entries.setdefault(pkg, []).append((f, entry))
        progress.end()

    def send_extra_info(self, db=None, **kw):
        """
        Receive extra parameters from the indexer.

        This may be called more than once, but after init().

        We are using this to get the database instance
        """
        if db is not None:
            for i in self.indexers:
                i.indexer.set_flags(xapian.TermGenerator.FLAG_SPELLING)
                i.indexer.set_database(db)

    def doc(self):
        """
        Return documentation information for this data source.

        The documentation information is a dictionary with these keys:
          name: the name for this data source
          shortDesc: a short description
          fullDoc: the full description as a chapter in ReST format
        """
        return dict(
            name = "app-install information",
            shortDesc = "terms, categories and popcon values extracted from the app-install .desktop files",
            fullDoc = """
            The AppInstall data source reads .desktop files from %s
            and adds the following terms:

             * keywords from the .desktop descriptions, via Xapian's
               TermGenerator, in all requested locales;
             * .desktop categories, with prefix XDT;
             * name of .desktop file, with prefix XDF;
             * a single term "XD", marking that the package contains .desktop
               files.

            It also adds an "app-popcon" value with popcon ranks from the
            app-install .desktop files.
            """ % APPINSTALLDIR
        )

    def index(self, document, pkg):
        """
        Update the document with the information from this data source.

        document  is the document to update
        pkg       is the python-apt Package object for this package
        """
        name = document.get_data()
        for e in self.entries.get(name, []):
            fname, entry = e
            for i in self.indexers:
                i.index(document, fname, entry)

    def indexDeb822(self, document, pkg):
        """
        Update the document with the information from this data source.

        This is alternative to index, and it is used when indexing with package
        data taken from a custom Packages file.

        document  is the document to update
        pkg       is the Deb822 object for this package
        """
        name = document.get_data()
        for e in self.entries.get(name, []):
            fname, entry = e
            for i in self.indexers:
                i.index(document, fname, entry)

def init(langs=None, progress=None, **kw):
    """
    Create and return the plugin object.
    """
    # If we don't have app-install data, skip it
    if not os.path.isdir(APPINSTALLDIR): return None
    # If we don't have python-xdg, skip it
    if not HAS_XDG:
        if progress:
            progress.verbose("please install python-xdg if you want to index app-install-data files")
        return None
    return AppInstall(langs=langs, progress=progress)
