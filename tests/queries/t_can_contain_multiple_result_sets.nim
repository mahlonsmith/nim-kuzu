# vim: set et sta sw=4 ts=4 :

discard """
output: "Jenny|Lenny\nLenny\nJenny\n"
"""

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query """
CREATE NODE TABLE User(
    id SERIAL PRIMARY KEY,
    name STRING
);

CREATE REL TABLE FOLLOWS(
   From User To User
);

MERGE (a:User {name: "Lenny"})-[f:Follows]->(b:User {name: "Jenny"});
"""

q = conn.query( "MATCH (u:User) RETURN *" )

assert typeOf( q ) is KuzuQueryResult
assert q.hasNextSet == false

q = conn.query """
    MATCH (a:User)<-[f:Follows]-(b:User) RETURN a.name, b.name;
    MATCH (u:User) RETURN u.name;
"""

assert typeOf( q ) is KuzuQueryResult
assert q.hasNextSet == true

echo q.getNext
for query_result in q.sets:
    for row in query_result.items:
        echo row

