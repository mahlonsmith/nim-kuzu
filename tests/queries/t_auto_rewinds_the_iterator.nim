# vim: set et sta sw=4 ts=4 :

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

var q = conn.query """
UNWIND [1,2,3] AS items
RETURN items
"""

for row in q: discard

assert q.hasNext == true

