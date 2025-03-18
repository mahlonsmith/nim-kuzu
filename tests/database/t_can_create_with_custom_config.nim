# vim: set et sta sw=4 ts=4 :

import
    std/dirs,
    std/paths

import kuzu

const DATABASE_PATH = Path( "tmp/testdb" )
DATABASE_PATH.removeDir()

var db = newKuzuDatabase( $DATABASE_PATH, kuzuConfig( auto_checkpoint=false ) )
assert db.path == "tmp/testdb"
assert db.config.auto_checkpoint == false

DATABASE_PATH.removeDir()

