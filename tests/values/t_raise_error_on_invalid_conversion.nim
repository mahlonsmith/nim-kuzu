# vim: set et sta sw=4 ts=4 :

import
  std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "CREATE NODE TABLE Doop ( id SERIAL, thing STRING, PRIMARY KEY(id) )" )

q = conn.query( "CREATE (d:Doop {thing: 'okay!'})" )
q = conn.query( "MATCH (d:Doop) RETURN d" )

var tup = q.getNext
var val = tup[0]
assert val.kind == KUZU_NODE

try:
    discard val.toInt32
except KuzuTypeError as err:
    assert err.msg.contains( re"""Mismatched types: KUZU_NODE != int32""" )


