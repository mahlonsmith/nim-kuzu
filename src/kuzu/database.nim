# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( db: KuzuDatabaseObj ) =
    ## Graceful cleanup for an open DB handle when it goes out of scope.
    if db.valid:
        kuzu_database_destroy( addr db.handle )


proc newKuzuDatabase*( path="", config=kuzuConfig() ): KuzuDatabase =
    ## Create a new Kuzu database handle.  Creates an in-memory
    ## database by default, but writes to disk if a +path+ is supplied.

    result        = new KuzuDatabase
    result.config = config
    result.path   = if path != "" and path != ":memory:": path else: "(in-memory)"
    result.handle = kuzu_database()

    if kuzu_database_init( path, config, addr result.handle ) == KuzuSuccess:
        result.valid = true
    else:
        raise newException( KuzuException, "Unable to open database." )


