# vim: set et sta sw=4 ts=4 :

import
    std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

try:
    discard conn.query( "NOPE NOPE NOPE" )
except KuzuQueryError as err:
    assert err.msg.contains( re"""Parser exception: extraneous input 'NOPE'""" )

