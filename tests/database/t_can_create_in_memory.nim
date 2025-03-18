# vim: set et sta sw=4 ts=4 :

import kuzu

var db = newKuzuDatabase()
assert db.path == "(in-memory)"

