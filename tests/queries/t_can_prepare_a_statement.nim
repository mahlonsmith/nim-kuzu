# vim: set et sta sw=4 ts=4 :

discard """
output: "d.thing\nCamel\nLampshade\nDelicious Cake\n"
"""

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )

var p = conn.prepare( "CREATE (d:Doop {thing: $thing})" )
assert typeOf( p ) is KuzuPreparedStatement

for thing in @[ "Camel", "Lampshade", "Delicious Cake" ]:
   q = p.execute( (thing: thing) )
   assert typeOf( q ) is KuzuQueryResult

q = conn.query( "MATCH (d:Doop) RETURN d.thing" )
echo $q

