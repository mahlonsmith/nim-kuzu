# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( conn: KuzuConnectionObj ) =
    ## Graceful cleanup for open connection handles.
    kuzu_connection_destroy( addr conn.handle )


proc connect*( db: KuzuDB ): KuzuConnection =
    ## Connect to a database.
    result = new KuzuConnection
    var rv = kuzu_connection_init( addr db.handle, addr result.handle )
    if rv != KuzuSuccess:
        raise newException( KuzuException, "Unable to connect to the database." )


proc queryTimeout*( conn: KuzuConnection, timeout: uint64 ) =
    ## Set a maximum time limit (in milliseconds) for query runtime.
    discard kuzu_connection_set_query_timeout( addr conn.handle, timeout )


proc queryInterrupt*( conn: KuzuConnection ) =
    ## Cancel any running queries.
    kuzu_connection_interrupt( addr conn.handle )

