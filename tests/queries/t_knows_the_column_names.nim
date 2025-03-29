# vim: set et sta sw=4 ts=4 :

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )
assert typeOf( q ) is KuzuQueryResult

q = conn.query( "CREATE (d:Doop {thing: 'okay!'})" )
q = conn.query( "MATCH (d:Doop) RETURN d.id AS IDENTIFIER, d.thing AS THING" )

assert q.column_names.len == 2
assert q.column_names[0] == "IDENTIFIER"
assert q.column_names[1] == "THING"

