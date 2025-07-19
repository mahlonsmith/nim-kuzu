# vim: set et sta sw=4 ts=4 :

version     = "0.6.0"
author      = "Mahlon E. Smith"
description = "Kuzu is an embedded graph database built for query speed and scalability."
license     = "BSD-3-Clause"
srcDir      = "src"

requires "nim ^= 2.0.0"

# Development dependencies.
#requires "futhark ^= 0.15.0"
#requires "zip ^= 0.3.1"

task makewrapper, "Generate the C wrapper using Futhark":
    exec "nim c -d:futharkWrap --outdir=tmp/ src/kuzu.nim"

task test, "Run the test suite.":
    exec "testament --megatest:off all"
    exec "testament html"
    exec """find tests/ -type f \! -name \*.nim -delete"""

task docs, "Generate automated documentation.":
    exec "nim md2html --project --outdir:docs README.md"
    exec "nim md2html --project --outdir:docs History.md"
    exec "nim md2html --project --outdir:docs USAGE.md"
    exec "nim doc --project --outdir:docs src/kuzu.nim"

