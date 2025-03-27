# vim: set et sta sw=4 ts=4 :

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )
assert typeOf( q ) is KuzuQueryResult

q = conn.query( "MATCH (d:Doop) RETURN d.thing" )
assert q.num_tuples == 0
assert q.hasNext == false

q = conn.query( "CREATE (d:Doop {thing: 'okay!'})" )
q = conn.query( "MATCH (d:Doop) RETURN d.thing" )
assert q.num_tuples == 1
assert q.hasNext == true

discard q.getNext # consume the tuple result

assert q.num_tuples == 1
assert q.hasNext == false

