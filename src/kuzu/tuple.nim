# vim: set et sta sw=4 ts=4 :

# NOTE: Constructor in queries.nim, #getNext

proc `=destroy`*( tpl: KuzuFlatTupleObj ) =
    ## Graceful cleanup for out of scope tuples.
    if tpl.valid:
        when defined( debug ): echo &"Destroying tuple: {tpl}"
        kuzu_flat_tuple_destroy( addr tpl.handle )


func `$`*( tpl: KuzuFlatTuple ): string =
    ## Stringify a tuple.
    result = $kuzu_flat_tuple_to_string( addr tpl.handle )
    result.removeSuffix( "\n" )


func `[]`*( tpl: KuzuFlatTuple, idx: int ): KuzuValue =
    ## Returns a KuzuValue at the given *idx*.

    result = new KuzuValue

    if kuzu_flat_tuple_get_value( addr tpl.handle, idx.uint64, addr result.handle ) == KuzuSuccess:
        result.valid = true
        result.getType()
    else:
        raise newException( KuzuIndexError,
            &"Unable to fetch tuple value at idx {idx}. ({tpl.num_columns} column(s).)" )


