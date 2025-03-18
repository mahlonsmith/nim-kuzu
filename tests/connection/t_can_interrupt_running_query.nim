# vim: set et sta sw=4 ts=4 :

import kuzu


let db = newKuzuDatabase()
let conn = db.connect

# FIXME: This test should really perform some
# long running query in a thread, and cancel
# it from elsewhere.
conn.queryInterrupt()

