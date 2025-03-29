# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( query: KuzuQueryResultObj ) =
    ## Graceful cleanup for out of scope query objects.
    if query.valid:
        when defined( debug ): echo &"Destroying query: {query}"
        kuzu_query_result_destroy( addr query.handle )


func getQueryMetadata( query: KuzuQueryResult ) =
    ## Find and retain additional data for the query.
    query.num_columns = kuzu_query_result_get_num_columns( addr query.handle )
    query.num_tuples  = kuzu_query_result_get_num_tuples( addr query.handle )

    # Summary information.
    var summary: kuzu_query_summary
    discard kuzu_query_result_get_query_summary( addr query.handle, addr summary )
    query.compile_time   = kuzu_query_summary_get_compiling_time( addr summary )
    query.execution_time = kuzu_query_summary_get_execution_time( addr summary )
    kuzu_query_summary_destroy( addr summary )

    # Column information.
    query.column_types = @[]
    query.column_names = @[]
    if query.num_columns == 0: return
    for idx in ( 0 .. query.num_columns-1 ):

        # types
        #
        var logical_type: kuzu_logical_type
        discard kuzu_query_result_get_column_data_type(
            addr query.handle,
            idx,
            addr logical_type
        )
        query.column_types.add( kuzu_data_type_get_id( addr logical_type ))
        kuzu_data_type_destroy( addr logical_type )

        # names
        #
        var name: cstring
        discard kuzu_query_result_get_column_name(
            addr query.handle,
            idx,
            addr name
        )
        query.column_names.add( $name )
        kuzu_destroy_string( name )


func query*( conn: KuzuConnection, query: string ): KuzuQueryResult =
    ## Perform a database +query+ and return the result.
    result = new KuzuQueryResult

    if kuzu_connection_query( addr conn.handle, query, addr result.handle ) == KuzuSuccess:
        result.valid = true
        result.getQueryMetadata()
    else:
        var err = kuzu_query_result_get_error_message( addr result.handle )
        raise newException( KuzuQueryError, &"Error running query: {err}" )


proc `=destroy`*( prepared: KuzuPreparedStatementObj ) =
    ## Graceful cleanup for out of scope prepared objects.
    if prepared.valid:
        when defined( debug ): echo &"Destroying prepared statement: {prepared}"
        kuzu_prepared_statement_destroy( addr prepared.handle )


func prepare*( conn: KuzuConnection, query: string ): KuzuPreparedStatement =
    ## Return a prepared statement that can avoid planning for repeat calls,
    ## with optional variable binding via #execute.
    result = new KuzuPreparedStatement
    if kuzu_connection_prepare( addr conn.handle, query, addr result.handle ) == KuzuSuccess:
        result.conn  = conn
        result.valid = true
    else:
        var err = kuzu_prepared_statement_get_error_message( addr result.handle )
        raise newException( KuzuQueryError, &"Error preparing statement: {err}" )


func bindValue[T](
    stmtHandle: kuzu_prepared_statement,
    key: cstring,
    val: T
) =
    ## Bind a key/value to a prepared statement handle.
    when typeOf( val ) is bool:
        assert( kuzu_prepared_statement_bind_bool( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is int8:
        assert( kuzu_prepared_statement_bind_int8( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is int16:
        assert( kuzu_prepared_statement_bind_int16( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is int64:
        assert( kuzu_prepared_statement_bind_int64( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is int or typeOf( val ) is int32:
        assert( kuzu_prepared_statement_bind_int32( addr stmtHandle, key, val.int32 ) == KuzuSuccess )
    elif typeOf( val ) is uint8:
        assert( kuzu_prepared_statement_bind_uint8( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is uint16:
        assert( kuzu_prepared_statement_bind_uint16( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is uint64:
        assert( kuzu_prepared_statement_bind_uint64( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is uint or typeOf( val ) is uint32:
        assert( kuzu_prepared_statement_bind_uint32( addr stmtHandle, key, val.uint32 ) == KuzuSuccess )
    elif typeOf( val ) is float:
        assert( kuzu_prepared_statement_bind_double( addr stmtHandle, key, val ) == KuzuSuccess )
    elif typeOf( val ) is string:
        # Fallback to string.  For custom types, just cast in the cypher query.
        assert( kuzu_prepared_statement_bind_string( addr stmtHandle, key, val.cstring ) == KuzuSuccess )
    else:
        raise newException( KuzuTypeError, &"""Unsupported type {$typeOf(val)} for prepared statement.""" )


proc execute*(
    prepared: KuzuPreparedStatement,
    params: tuple = ()
): KuzuQueryResult =
    ## Bind variables in *params* to the statement, and return
    ## a KuzuQueryResult.

    result = new KuzuQueryResult

    for key, val in params.fieldPairs:
        prepared.handle.bindValue( key, val )

    if kuzu_connection_execute(
        addr prepared.conn.handle,
        addr prepared.handle,
        addr result.handle
    ) == KuzuSuccess:
        result.valid = false
        result.getQueryMetadata()
    else:
        var err = kuzu_query_result_get_error_message( addr result.handle )
        raise newException( KuzuQueryError, &"Error executing prepared statement: {err}" )


func `$`*( query: KuzuQueryResult ): string =
    ## Return the entire result set as a string.
    result = $kuzu_query_result_to_string( addr query.handle )


func hasNext*( query: KuzuQueryResult ): bool =
    ## Returns +true+ if there are more tuples to be consumed.
    result = kuzu_query_result_has_next( addr query.handle )


func getNext*( query: KuzuQueryResult ): KuzuFlatTuple =
    ## Consume and return the next tuple result, or raise a KuzuIndexError
    ## if at the end of the result set.
    result = new KuzuFlatTuple
    if kuzu_query_result_get_next( addr query.handle, addr result.handle ) == KuzuSuccess:
        result.valid = true
        result.num_columns = query.num_columns
    else:
        raise newException( KuzuIndexError, &"Query iteration past end." )


func rewind*( query: KuzuQueryResult ) =
    ## Reset query iteration back to the beginning.
    kuzu_query_result_reset_iterator( addr query.handle )


iterator items*( query: KuzuQueryResult ): KuzuFlatTuple =
    ## Iterate available tuples, yielding to the block.
    while query.hasNext:
        yield query.getNext

