# vim: set et sta sw=4 ts=4 :
#

{.passL:"-lkuzu".}

when defined( futharkWrap ):
    import futhark, os

    importc:
        outputPath currentSourcePath.parentDir / "kuzu" / "0.9.0.nim"
        "kuzu.h"
else:
    include "kuzu/0.9.0.nim"

import
    std/strformat,
    std/strutils

# Order very much matters here pre Nim 3.0 multi-pass compiling.
include
    "kuzu/constants.nim",
    "kuzu/types.nim",
    "kuzu/config.nim",
    "kuzu/database.nim",
    "kuzu/connection.nim",
    "kuzu/value.nim",
    "kuzu/tuple.nim",
    "kuzu/queries.nim"


proc kuzuVersionCompatible*(): bool =
    ## Returns true if the system installed Kuzu library
    ## is the expected version of this library wrapper.
    result = KUZU_EXPECTED_LIBVERSION == $kuzuGetVersion()


when isMainModule:
    echo "Nim-Kuzu version: ", KUZU_VERSION,
        ". Expected library version: ", KUZU_EXPECTED_LIBVERSION, "."
    echo "Installed Kuzu library version ", kuzuGetVersion(),
        " (storage version ", kuzuGetStorageVersion(), ")"
    if kuzuVersionCompatible():
        echo "Versions match!"
    else:
        echo "This library wraps a different version of Kuzu than what is installed."
        echo "Behavior may be unexpected!"

