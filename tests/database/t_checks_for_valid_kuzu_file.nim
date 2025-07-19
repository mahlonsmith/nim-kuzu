# vim: set et sta sw=4 ts=4 :

import
  std/files,
  std/paths,
  std/re

import kuzu

const NOT_A_DATABASE_PATH = Path( "tmp/not-a-db" )

NOT_A_DATABASE_PATH.removeFile()
var fh = NOT_A_DATABASE_PATH.string.open( fmWrite )
fh.write( "Hi." )
fh.close

try:
    discard newKuzuDatabase( $NOT_A_DATABASE_PATH )
except KuzuException as err:
    assert err.msg.contains( re"""Unable to open database: "tmp/not-a-db" Doesn't appear to be a Kuzu file""" )

NOT_A_DATABASE_PATH.removeFile()

