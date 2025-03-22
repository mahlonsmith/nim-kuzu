# vim: set et sta sw=4 ts=4 :

discard """
output: "d.thing\nokay!\n\n"
"""

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )
q = conn.query( "CREATE (d:Doop {thing: 'okay!'})" )
q = conn.query( "MATCH (d:Doop) RETURN d.thing" )

echo $q

