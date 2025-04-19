# vim: set et sta sw=4 ts=4 :

import kuzu

var db   = newKuzuDatabase()
var conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doot ( id SERIAL, data BLOB, PRIMARY KEY(id) )" )

# (188, 189, 186, 170)
q = conn.query( """CREATE (d:Doot {data: BLOB('\\xBC\\xBD\\xBA\\xAA')})""" )

var stmt = conn.prepare( "CREATE (d:Doot {data: encode($str)})" )
q = stmt.execute( (str: "Hello!") )
q = conn.query( "MATCH (d:Doot) RETURN d.data" )

var expected: seq[byte] = @[188, 189, 186, 170]
var val = q.getNext[0]
assert val.kind == KUZU_BLOB
assert val.toBlob == expected

expected = @[72, 101, 108, 108, 111, 33]
val = q.getNext[0]
assert val.kind == KUZU_BLOB
assert val.toBlob == expected

var str: string
for c in expected:
    str.add( c.char )

assert str == "Hello!"

