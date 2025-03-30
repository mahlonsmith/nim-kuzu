# vim: set et sta sw=4 ts=4 :

import
    std/re
import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( """RETURN {test1: 1, test2: "bewts"} AS struct""" )
var struct = q.getNext[0].toStruct

assert struct.len == 2
assert struct.keys == @["test1", "test2"]

try:
    discard struct["nope"]
except KuzuIndexError as err:
    assert err.msg.contains( re"""No such struct key "nope"""" )


