# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( db: KuzuDatabaseObj ) =
    ## Graceful cleanup for an open DB handle when it goes out of scope.
    if db.valid:
        when defined( debug ): echo &"Destroying database: {db}"
        kuzu_database_destroy( addr db.handle )


proc validateDatabase( db: KuzuDatabase ): void =
    ## Perform basic validity checks against an existing on disk database
    ## for better error messaging.

    if not Path( db.path ).fileExists: return

    var buf = newSeq[char]( 5 )
    let f = open( db.path )
    discard f.readChars( buf )
    f.close

    let magic = buf[0..3].join
    let storage_version = buf[4].uint

    if magic != "KUZU":
        raise newException( KuzuException, "Unable to open database: " &
            &""""{db.path}" Doesn't appear to be a Kuzu file.""" )

    if storageVersion != kuzuGetStorageVersion():
        raise newException( KuzuException, "Unable to open database: " &
            &" mismatched storage versions - file is {storageVersion}, expected {kuzuGetStorageVersion()}." )


proc newKuzuDatabase*( path="", config=kuzuConfig() ): KuzuDatabase =
    ## Create a new Kuzu database handle.  Creates an in-memory
    ## database by default, but writes to disk if a +path+ is supplied.

    result        = new KuzuDatabase
    result.config = config

    if path != "" and path != ":memory:":
        result.path = path
        result.kind = disk
    else:
        result.path = "(in-memory)"
        result.kind = memory

    result.handle = kuzu_database()

    if result.kind == disk:
        result.validateDatabase()

    if kuzu_database_init( path, config, addr result.handle ) == KuzuSuccess:
        result.valid = true
    else:
        raise newException( KuzuException, "Unable to open database." )

