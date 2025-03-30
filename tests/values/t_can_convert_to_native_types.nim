# vim: set et sta sw=4 ts=4 :

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( """CREATE NODE TABLE Doop (
    id SERIAL,
    test1 int8,
    test2 int16,
    test3 int32,
    test4 int64,
    test5 uint8,
    test6 uint16,
    test7 uint32,
    test8 uint64,
    test9 float,
    test10 double,
    test11 timestamp,
    test12 string,
    PRIMARY KEY(id))""" )

q = conn.query( """CREATE (d:Doop {
    test1: 12,
    test2: 144,
    test3: -2201,
    test4: 123550332,
    test5: 2,
    test6: 82,
    test7: 50922,
    test8: 294050066922312345,
    test9: 10.5,
    test10: 2.333021,
    test11: TIMESTAMP("2025-03-29"),
    test12: "Well hello, there." })""" )

q = conn.query( "MATCH (d:Doop) RETURN d.*" )
var tup = q.getNext

var id = tup[0].toInt64
assert typeOf( id ) is int64
assert id == 0

var test1 = tup[1].toInt8
assert typeOf( test1 ) is int8
assert test1 == 12

var test2 = tup[2].toInt16
assert typeOf( test2 ) is int16
assert test2 == 144

var test3 = tup[3].toInt32
assert typeOf( test3 ) is int32
assert test3 == -2201

var test4 = tup[4].toInt64
assert typeOf( test4 ) is int64
assert test4 == 123550332

var test5 = tup[5].toUint8
assert typeOf( test5 ) is uint8
assert test5 == 2

var test6 = tup[6].toUint16
assert typeOf( test6 ) is uint16
assert test6 == 82

var test7 = tup[7].toUint32
assert typeOf( test7 ) is uint32
assert test7 == 50922

var test8 = tup[8].toUint64
assert typeOf( test8 ) is uint64
assert test8 == 294050066922312345.uint64

var test9 = tup[9].toFloat
assert typeOf( test9 ) is float
assert test9 == 10.5

var test10 = tup[10].toDouble
assert typeOf( test10 ) is float
assert test10 == 2.333021

var test11 = tup[11].toTimestamp
assert typeOf( test11 ) is int
assert test11 == 1743206400000000

var test11s = $tup[11]
assert typeOf( test11s ) is string
assert test11s == "2025-03-29 00:00:00"

var test12 = $tup[12]
assert typeOf( test12 ) is string
assert test12 == "Well hello, there."

