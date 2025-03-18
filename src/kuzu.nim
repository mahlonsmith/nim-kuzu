# vim: set et sta sw=4 ts=4 :
#

{.passL:"-lkuzu".}

when defined( futharkWrap ):
    import futhark, os

    importc:
        outputPath currentSourcePath.parentDir / "kuzu" / "0.8.2.nim"
        "kuzu.h"
else:
    include "kuzu/0.8.2.nim"

import
    std/strformat

include
    "kuzu/constants.nim",
    "kuzu/types.nim",
    "kuzu/config.nim",
    "kuzu/database.nim",
    "kuzu/connection.nim",
    "kuzu/queries.nim"


proc kuzuVersionCompatible*(): bool =
    ## Returns true if the system installed Kuzu library
    ## is the expected version of this library wrapper.
    result = KUZU_EXPECTED_LIBVERSION == KUZU_LIBVERSION


when isMainModule:
    echo "Nim-Kuzu version: ", KUZU_VERSION,
        ". Expected library version: ", KUZU_EXPECTED_LIBVERSION, "."
    echo "Installed Kuzu library version ", KUZU_LIBVERSION,
        " (storage version ", KUZU_STORAGE_VERSION, ")"
    if kuzuVersionCompatible():
        echo "Versions match!"
    else:
        echo "This library wraps a different version of Kuzu than what is installed."
        echo "Behavior may be unexpected!"

