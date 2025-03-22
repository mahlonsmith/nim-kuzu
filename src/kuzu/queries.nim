# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( query: KuzuQueryResultObj ) =
    ## Graceful cleanup for out of scope query objects.
    if query.valid:
        kuzu_query_result_destroy( addr query.handle )
        kuzu_query_summary_destroy( addr query.summary )


proc query*( conn: KuzuConnection, query: string ): KuzuQueryResult =
    ## Perform a database +query+ and return the result.
    result = new KuzuQueryResult
    if kuzu_connection_query( addr conn.handle, query, addr result.handle ) == KuzuSuccess:
        discard kuzu_query_result_get_query_summary( addr result.handle, addr result.summary )
        result.num_columns    = kuzu_query_result_get_num_columns( addr result.handle )
        result.num_tuples     = kuzu_query_result_get_num_tuples( addr result.handle )
        result.compile_time   = kuzu_query_summary_get_compiling_time( addr result.summary )
        result.execution_time = kuzu_query_summary_get_execution_time( addr result.summary )
        result.valid          = true
    else:
        var err = kuzu_query_result_get_error_message( addr result.handle )
        raise newException( KuzuQueryException, &"Error running query: {err}" )


proc `$`*( query: KuzuQueryResult ): string =
    ## Return the entire result set as a string.
    result = $kuzu_query_result_to_string( addr query.handle )


proc hasNext*( query: KuzuQueryResult ): bool =
    ## Returns +true+ if there are more tuples to be consumed.
    result = kuzu_query_result_has_next( addr query.handle )


proc getNext*( query: KuzuQueryResult ): KuzuFlatTuple =
    result = new KuzuFlatTuple
    if kuzu_query_result_get_next( addr query.handle, addr result.handle ) == KuzuSuccess:
        result.valid = true
        result.num_columns = query.num_columns
    else:
        raise newException( KuzuQueryException, &"Unable to fetch next tuple." )


iterator items*( query: KuzuQueryResult ): KuzuFlatTuple =
    ## Iterate available tuples, yielding to the block.
    while query.hasNext:
        yield query.getNext

