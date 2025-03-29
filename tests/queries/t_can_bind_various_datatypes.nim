# vim: set et sta sw=4 ts=4 :

discard """
output: "0|-222222|128|True|Stuff!|3.344903|239.299923|a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11|2025-03-29"
"""

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( """CREATE NODE TABLE Doop (
    id SERIAL,
    num INT,
    unum UINT8,
    woo BOOL,
    thing STRING,
    float FLOAT,
    double DOUBLE,
    uuid UUID,
    date DATE,
    PRIMARY KEY(id)
)""" )
assert typeOf( q ) is KuzuQueryResult


var stmt = conn.prepare( """CREATE (d:Doop {
    woo: $woo,
    thing: $thing,
    num: $num,
    unum: $unum,
    float: $float,
    double: $double,
    uuid: UUID($uuid),
    date: DATE($date)
})""" )
assert typeOf( stmt ) is KuzuPreparedStatement


q = stmt.execute((
    woo:    true,
    thing:  "Stuff!",
    num:    -222222,
    unum:   128,
    float:  3.34490345039450345,
    double: 239.299922883992,
    uuid:   "A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11",
    date:   "2025-03-29"
))
assert typeOf( q ) is KuzuQueryResult


q = conn.query( "MATCH (d:Doop) RETURN d.*" )
echo $q.getNext

