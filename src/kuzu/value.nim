# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( value: KuzuValueObj ) =
    ## Graceful cleanup for out of scope values.
    if value.valid:
        when defined( debug ): echo &"Destroying value: {value}"
        kuzu_value_destroy( addr value.handle )


func `$`*( value: KuzuValue ): string =
    ## Stringify a value.
    result = $kuzu_value_to_string( addr value.handle )


func getType( value: KuzuValue ) =
    ## Find and set the native Kuzu type of this value.
    var logical_type: kuzu_logical_type
    kuzu_value_get_data_type( addr value.handle, addr logical_type )
    value.kind = kuzu_data_type_get_id( addr logical_type )
    kuzu_data_type_destroy( addr logical_type )


func toInt8*( value: KuzuValue ): int8 =
    if value.kind != KUZU_INT8:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != int8" )
    assert(
      kuzu_value_get_int8( addr value.handle, addr result ) ==
      KuzuSuccess
    )

