import os
import warnings

warnings.warn("please use 'debian' instead of 'debian_bundle'",
              DeprecationWarning, stacklevel=2)

# Support "from debian_bundle import foo"
parent_dir = os.path.dirname(__path__[0])
__path__.append(os.path.join(parent_dir, "debian"))
