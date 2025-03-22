# vim: set et sta sw=4 ts=4 :

import
    std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )
q = conn.query( "CREATE (d:Doop {thing: 'okay!'})" )
q = conn.query( "MATCH (d:Doop) RETURN d.thing" )

let tup = q.getNext

try:
    echo tup[22]
except KuzuIndexException as err:
    assert err.msg.contains( re"""Unable to fetch tuple value at idx 22.""" )

