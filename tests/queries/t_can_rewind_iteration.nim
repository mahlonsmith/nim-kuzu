# vim: set et sta sw=4 ts=4 :

discard """
output: "Camel\nLampshade\nCamel\nLampshade\n"
"""

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )

for thing in @[ "Camel", "Lampshade" ]:
    q = conn.query( "CREATE (d:Doop {thing: '" & thing & "'})" )

for tpl in conn.query( "MATCH (d:Doop) RETURN d.thing" ):
    echo $tpl

q.rewind

for tpl in conn.query( "MATCH (d:Doop) RETURN d.thing" ):
    echo $tpl
