# vim: set et sta sw=4 ts=4 :

type
    KuzuDatabaseObj = object
        handle:  kuzu_database
        path*:   string
        config*: kuzu_system_config
        valid = false
    KuzuDatabase* = ref KuzuDatabaseObj

    KuzuConnectionObj = object
        handle: kuzu_connection
        valid = false
    KuzuConnection* = ref KuzuConnectionObj

    KuzuQueryResultObj = object
        handle:          kuzu_query_result
        summary:         kuzu_query_summary
        num_columns*:    uint64 = 0
        num_tuples*:     uint64 = 0
        compile_time*:   cdouble = 0
        execution_time*: cdouble = 0
        valid = false
    KuzuQueryResult* = ref KuzuQueryResultObj

    KuzuPreparedStatementObj = object
        handle: kuzu_prepared_statement
        conn:   KuzuConnection
        valid = false
    KuzuPreparedStatement* = ref KuzuPreparedStatementObj

    KuzuFlatTupleObj = object
        handle:      kuzu_flat_tuple
        num_columns: uint64 = 0
        valid = false
    KuzuFlatTuple* = ref KuzuFlatTupleObj

    KuzuValueObj = object
        handle: kuzu_value
        valid = false
    KuzuValue* = ref KuzuValueObj

    KuzuException*      = object of CatchableError
    KuzuQueryException* = object of KuzuException
    KuzuIndexException* = object of KuzuException

