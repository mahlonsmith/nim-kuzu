# vim: set et sta sw=4 ts=4 :

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )
assert typeOf( q ) is KuzuQueryResult

for thing in @[ "Camel", "Lampshade", "Delicious Cake" ]:
    q = conn.query( "CREATE (d:Doop {thing: '" & thing & "'})" )
    assert typeOf( q ) is KuzuQueryResult

q = conn.query( "MATCH (d:Doop) RETURN d.thing" )
assert q.num_columns == 1
assert q.num_tuples == 3
assert q.compile_time > 0
assert q.execution_time > 0

