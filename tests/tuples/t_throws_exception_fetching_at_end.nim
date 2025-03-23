# vim: set et sta sw=4 ts=4 :

import
    std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )
q = conn.query( "MATCH (d:Doop) RETURN d.thing" )

try:
   discard q.getNext
except KuzuIndexException as err:
    assert err.msg.contains( re"""Query iteration past end.""" )

