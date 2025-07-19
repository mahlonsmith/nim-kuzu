# vim: set et sta sw=4 ts=4 :

import
    std/files,
    std/paths

import kuzu

const DATABASE_PATH = Path( "tmp/testdb" )

DATABASE_PATH.removeFile()
var db = newKuzuDatabase( $DATABASE_PATH )

assert db.path == $DATABASE_PATH
assert db.kind == disk
assert db.config == kuzuConfig()
assert db.config.read_only == false

DATABASE_PATH.removeFile()

