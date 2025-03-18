# vim: set et sta sw=4 ts=4 :

import kuzu

let db = newKuzuDatabase()
let conn = db.connect

# There is currently no getter for this, so
# we'll just have to assume a lack of
# exception/error means success.
conn.queryTimeout( 1000 )

