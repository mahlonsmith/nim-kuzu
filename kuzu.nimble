# vim: set et sta sw=4 ts=4 :

version     = "0.1.0"
author      = "Mahlon E. Smith"
description = "Kuzu is an embedded graph database built for query speed and scalability."
license     = "MIT"
srcDir      = "src"

requires "nim ^= 2.0.0"

# Development dependencies.
#requires "futhark ^= 0.15.0"
#requires "zip ^= 0.3.1"

task makewrapper, "Generate the C wrapper using Futhark":
    exec "nim c -d:futharkWrap --outdir=. src/kuzu.nim"

