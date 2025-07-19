# vim: set et sta sw=4 ts=4 :

discard """
output: "a\nb\nc\nd\ne\nf\n"
"""

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query( "RETURN 'hi'" )

assert typeOf( q ) is KuzuQueryResult
assert q.sets.len == 0

q = conn.query """
    RETURN "a";
    RETURN "b";
    RETURN "c";
    RETURN "d";
    RETURN "e";
    RETURN "f";
"""

assert typeOf( q ) is KuzuQueryResult
assert q.sets.len == 5

echo q.getNext
for set in q.sets:
    for row in set.items:
        echo row


