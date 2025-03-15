# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( query: KuzuQueryResultObj ) =
    ## Graceful cleanup for out of scope query objects.
    kuzu_query_result_destroy( addr query.handle )
    kuzu_query_summary_destroy( addr query.summary )


proc query*( conn: KuzuConnection, query: string ): KuzuQueryResult =
    ## Perform a database +query+ and return the result.
    result = new KuzuQueryResult
    var rv = kuzu_connection_query( addr conn.handle, query, addr result.handle )
    if rv == KuzuSuccess:
        discard kuzu_query_result_get_query_summary( addr result.handle, addr result.summary )
        result.num_columns    = kuzu_query_result_get_num_columns( addr result.handle )
        result.num_tuples     = kuzu_query_result_get_num_tuples( addr result.handle )
        result.compile_time   = kuzu_query_summary_get_compiling_time( addr result.summary )
        result.execution_time = kuzu_query_summary_get_execution_time( addr result.summary )
    else:
        var err = kuzu_query_result_get_error_message( addr result.handle )
        raise newException( KuzuQueryException, &"Error running query: {err}" )


