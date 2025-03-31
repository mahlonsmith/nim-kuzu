# vim: set et sta sw=4 ts=4 :

import re
import kuzu

let version = $kuzuGetVersion()
assert version.contains( re"^\d+\.\d+\.\d+(?:\.\d+)?$" )

