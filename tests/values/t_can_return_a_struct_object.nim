# vim: set et sta sw=4 ts=4 :

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( """RETURN 12""" )
try:
    discard q.getNext[0].toStruct
except KuzuTypeError:
    discard


q = conn.query( """RETURN {test1: 1, test2: "bewts"} AS struct""" )
var struct = q.getNext[0].toStruct

assert struct.len == 2
assert struct.keys == @["test1", "test2"]
assert struct["test1"].toInt64 == 1
assert $struct["test2"] == "bewts"

