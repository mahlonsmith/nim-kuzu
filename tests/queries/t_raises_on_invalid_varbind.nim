# vim: set et sta sw=4 ts=4 :

import
    std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, created DATE, PRIMARY KEY(id) )" )
assert typeOf( q ) is KuzuQueryResult

var p = conn.prepare( "CREATE (d:Doop {created: $created})" )
assert typeOf( p ) is KuzuPreparedStatement

# Typecast binding failure
#
try:
    discard p.execute( (created: "1111-1111") )
except KuzuQueryError as err:
    assert err.msg.contains( re"""Expression \$created has data type STRING but expected DATE.""" )

# Invalid value for typecast
#
p = conn.prepare( "CREATE (d:Doop {created: DATE($created)})" )
try:
    discard p.execute( (created: "1111-1111") )
except KuzuQueryError as err:
    assert err.msg.contains( re"""Given: "1111-1111". Expected format: \(YYYY-MM-DD\)""" )


