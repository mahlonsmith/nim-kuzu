# vim: set et sta sw=4 ts=4 :

type
    KuzuDBObj = object
        handle*: kuzu_database
        path*: string
        config*: kuzu_system_config
    KuzuDB* = ref KuzuDBObj

    KuzuConnectionObj = object
        handle*: kuzu_connection
    KuzuConnection* = ref KuzuConnectionObj

    KuzuQueryResultObj = object
        handle*:         kuzu_query_result
        summary:         kuzu_query_summary
        num_columns*:    uint64 = 0
        num_tuples*:     uint64 = 0
        compile_time*:   cdouble = 0
        execution_time*: cdouble = 0
    KuzuQueryResult* = ref KuzuQueryResultObj

    KuzuException* = object of CatchableError
    KuzuQueryException* = object of KuzuException

