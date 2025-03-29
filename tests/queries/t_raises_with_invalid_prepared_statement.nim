# vim: set et sta sw=4 ts=4 :

import
    std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )

var p = conn.prepare( "CREAET (d:Doop {thing: $thing})" )
assert typeOf( p ) is KuzuPreparedStatement

try:
    discard p.execute
except KuzuQueryError as err:
    assert err.msg.contains( re"""Parser exception: extraneous input 'CREAET'""" )


