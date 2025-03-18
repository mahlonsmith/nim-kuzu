# vim: set et sta sw=4 ts=4 :

import
    std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

try:
    discard conn.query( "NOPE NOPE NOPE" )
except KuzuQueryException as err:
    assert err.msg.contains( re"""Error running query:.*extraneous input 'NOPE'""" )

