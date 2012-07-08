class Template:
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
         sources (optional)
           ad array of dicts { path: pathname, desc: description }, one for
           every data file accessed by this plugin. A directory can be provided
           as path, meaning "it accesses all sorts of files inside this
           directory": for example the APT index, or the app-install-data
           files. Use [] to mean "no sources".

        Note that this method can be called before init.  The idea is that, if
        the timestamp shows that this plugin is currently not needed, then the
        long initialisation can just be skipped.
        """
        return dict(timestamp = 0, values = [], sources=[])

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
        #return dict(
        #    name = "template",
        #    shortDesc = "Example plugin that does nothing",
        #    fullDoc = """
        #    Here goes full documentation in ReST format
        #    """
        #)

        # Return None if you don't want this file to appear in the
        # documentation.  Probably, only the Template plugin should do that.
        return None

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

    def finished(self):
        """
        Called when the indexing is finihsed
        """


def init(**kw):
    """
    Create and return the plugin object.

    Keyword arguments can hold various kind of information passed by the
    indexer. Currently documented is:

     - langs: sequence of languages for which we are building the index

    Return None here to disable this plugin.
    """
    return Template()
