# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( value: KuzuValueObj ) =
    ## Graceful cleanup for out of scope values.
    if value.valid:
        kuzu_value_destroy( addr value.handle )


proc `$`*( value: KuzuValue ): string =
    ## Stringify a value.
    result = $kuzu_value_to_string( addr value.handle )


