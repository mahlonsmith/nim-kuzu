# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( query: KuzuQueryResultObj ) =
    ## Graceful cleanup for out of scope query objects.
    if query.valid:
        kuzu_query_result_destroy( addr query.handle )


proc getQueryMetadata( query: KuzuQueryResult ) =
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


proc query*( conn: KuzuConnection, query: string ): KuzuQueryResult =
    ## Perform a database +query+ and return the result.
    result = new KuzuQueryResult

    if kuzu_connection_query( addr conn.handle, query, addr result.handle ) == KuzuSuccess:
        result.valid = true
        result.getQueryMetadata()
    else:
        var err = kuzu_query_result_get_error_message( addr result.handle )
        raise newException( KuzuQueryException, &"Error running query: {err}" )


proc `=destroy`*( prepared: KuzuPreparedStatementObj ) =
    ## Graceful cleanup for out of scope prepared objects.
    if prepared.valid:
        kuzu_prepared_statement_destroy( addr prepared.handle )


proc prepare*( conn: KuzuConnection, query: string ): KuzuPreparedStatement =
    ## Return a prepared statement that can avoid planning for repeat calls,
    ## with optional variable binding via #execute.
    result = new KuzuPreparedStatement
    if kuzu_connection_prepare( addr conn.handle, query, addr result.handle ) == KuzuSuccess:
        result.conn  = conn
        result.valid = true
    else:
        var err = kuzu_prepared_statement_get_error_message( addr result.handle )
        raise newException( KuzuQueryException, &"Error preparing statement: {err}" )


proc execute*(
    prepared: KuzuPreparedStatement,
    params: tuple = ()
): KuzuQueryResult =
    ## Bind variables in *params* to the statement, and return
    ## a KuzuQueryResult.

    result = new KuzuQueryResult

    for key, val in params.fieldPairs:
        #
        # FIXME: type checks and conversions for all bound variables
        # from nim types to supported Kuzu types.
        #
        discard kuzu_prepared_statement_bind_string( addr prepared.handle, key.cstring, val.cstring )

    #[
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_bool (kuzu_prepared_statement *prepared_statement, const char *param_name, bool value)
        Binds the given boolean value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_int64 (kuzu_prepared_statement *prepared_statement, const char *param_name, int64_t value)
        Binds the given int64_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_int32 (kuzu_prepared_statement *prepared_statement, const char *param_name, int32_t value)
        Binds the given int32_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_int16 (kuzu_prepared_statement *prepared_statement, const char *param_name, int16_t value)
        Binds the given int16_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_int8 (kuzu_prepared_statement *prepared_statement, const char *param_name, int8_t value)
        Binds the given int8_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_uint64 (kuzu_prepared_statement *prepared_statement, const char *param_name, uint64_t value)
        Binds the given uint64_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_uint32 (kuzu_prepared_statement *prepared_statement, const char *param_name, uint32_t value)
        Binds the given uint32_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_uint16 (kuzu_prepared_statement *prepared_statement, const char *param_name, uint16_t value)
        Binds the given uint16_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_uint8 (kuzu_prepared_statement *prepared_statement, const char *param_name, uint8_t value)
        Binds the given int8_t value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_double (kuzu_prepared_statement *prepared_statement, const char *param_name, double value)
        Binds the given double value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_float (kuzu_prepared_statement *prepared_statement, const char *param_name, float value)
        Binds the given float value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_date (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_date_t value)
        Binds the given date value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_timestamp_ns (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_timestamp_ns_t value)
        Binds the given timestamp_ns value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_timestamp_sec (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_timestamp_sec_t value)
        Binds the given timestamp_sec value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_timestamp_tz (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_timestamp_tz_t value)
        Binds the given timestamp_tz value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_timestamp_ms (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_timestamp_ms_t value)
        Binds the given timestamp_ms value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_timestamp (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_timestamp_t value)
        Binds the given timestamp value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_interval (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_interval_t value)
        Binds the given interval value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_string (kuzu_prepared_statement *prepared_statement, const char *param_name, const char *value)
        Binds the given string value to the given parameter name in the prepared statement.
     
    KUZU_C_API kuzu_state 	kuzu_prepared_statement_bind_value (kuzu_prepared_statement *prepared_statement, const char *param_name, kuzu_value *value)
    ]#

    if kuzu_connection_execute(
        addr prepared.conn.handle,
        addr prepared.handle,
        addr result.handle
    ) == KuzuSuccess:
        discard kuzu_query_result_get_query_summary( addr result.handle, addr result.summary )
        result.num_columns    = kuzu_query_result_get_num_columns( addr result.handle )
        result.num_tuples     = kuzu_query_result_get_num_tuples( addr result.handle )
        result.compile_time   = kuzu_query_summary_get_compiling_time( addr result.summary )
        result.execution_time = kuzu_query_summary_get_execution_time( addr result.summary )
        result.valid          = true
    else:
        var err = kuzu_query_result_get_error_message( addr result.handle )
        raise newException( KuzuQueryException, &"Error executing prepared statement: {err}" )


proc `$`*( query: KuzuQueryResult ): string =
    ## Return the entire result set as a string.
    result = $kuzu_query_result_to_string( addr query.handle )


proc hasNext*( query: KuzuQueryResult ): bool =
    ## Returns +true+ if there are more tuples to be consumed.
    result = kuzu_query_result_has_next( addr query.handle )


proc getNext*( query: KuzuQueryResult ): KuzuFlatTuple =
    ## Consume and return the next tuple result, or raise a KuzuIndexException
    ## if at the end of the result set.
    result = new KuzuFlatTuple
    if kuzu_query_result_get_next( addr query.handle, addr result.handle ) == KuzuSuccess:
        result.valid = true
        result.num_columns = query.num_columns
    else:
        raise newException( KuzuIndexException, &"Query iteration past end." )


proc rewind*( query: KuzuQueryResult ) =
    ## Reset query iteration back to the beginning.
    kuzu_query_result_reset_iterator( addr query.handle )


iterator items*( query: KuzuQueryResult ): KuzuFlatTuple =
    ## Iterate available tuples, yielding to the block.
    while query.hasNext:
        yield query.getNext

