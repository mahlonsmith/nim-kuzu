# vim: set et sta sw=4 ts=4 :

import kuzu


let db = newKuzuDatabase()

assert db.path == "(in-memory)"
assert typeOf( db.connect ) is KuzuConnection

