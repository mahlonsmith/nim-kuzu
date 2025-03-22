# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( tpl: KuzuFlatTupleObj ) =
    ## Graceful cleanup for out of scope tuples.
    if tpl.valid:
        kuzu_flat_tuple_destroy( addr tpl.handle )


proc `$`*( tpl: KuzuFlatTuple ): string =
    ## Stringify a tuple.
    result = $kuzu_flat_tuple_to_string( addr tpl.handle )
    result.removeSuffix( "\n" )


proc `[]`*( tpl: KuzuFlatTuple, idx: int ): KuzuValue =
    ## Returns a KuzuValue at the given +idx+.
    result = new KuzuValue
    if kuzu_flat_tuple_get_value( addr tpl.handle, idx.uint64, addr result.handle ) == KuzuSuccess:
        result.valid = true
    else:
        raise newException( KuzuIndexException,
            &"Unable to fetch tuple value at idx {idx}. ({tpl.num_columns} column(s).)" )

