# vim: set et sta sw=4 ts=4 :

type
    KuzuDBType* = enum
        disk, memory

    KuzuDatabaseObj = object
        handle:  kuzu_database
        path*:   string
        kind*:   KuzuDBType
        config*: kuzu_system_config
        valid = false
    KuzuDatabase* = ref KuzuDatabaseObj

    KuzuConnectionObj = object
        handle: kuzu_connection
        valid = false
    KuzuConnection* = ref KuzuConnectionObj

    KuzuQueryResultObj = object
        handle:          kuzu_query_result
        num_columns*:    uint64 = 0
        num_tuples*:     uint64 = 0
        compile_time*:   cdouble = 0
        execution_time*: cdouble = 0
        column_types*:   seq[ kuzu_data_type_id ]
        column_names*:   seq[ string ]
        sets*:           seq[ KuzuQueryResult ]
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
        kind*: kuzu_data_type_id
    KuzuValue* = ref KuzuValueObj

    KuzuStructValueObj = object
        value: KuzuValue
        len*: uint64
        keys*: seq[ string ]
    KuzuStructValue* = ref KuzuStructValueObj

    KuzuException*      = object of CatchableError
    KuzuQueryError*     = object of KuzuException
    KuzuIndexError*     = object of KuzuException
    KuzuIterationError* = object of KuzuException
    KuzuTypeError*      = object of KuzuException

