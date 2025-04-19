# vim: set et sta sw=4 ts=4 :

# NOTE: Constructor in tuples.nim, #[]

proc `=destroy`*( value: KuzuValueObj ) =
    ## Graceful cleanup for out of scope values.
    if value.valid:
        when defined( debug ): echo &"Destroying value: {value}"
        kuzu_value_destroy( addr value.handle )


func getType( value: KuzuValue ) =
    ## Find and set the native Kuzu type of this value.
    var logical_type: kuzu_logical_type
    kuzu_value_get_data_type( addr value.handle, addr logical_type )
    value.kind = kuzu_data_type_get_id( addr logical_type )
    kuzu_data_type_destroy( addr logical_type )


func `$`*( value: KuzuValue ): string =
    ## Stringify a value.
    result = $kuzu_value_to_string( addr value.handle )


func toBool*( value: KuzuValue ): bool =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_BOOL:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != bool" )
    assert( kuzu_value_get_bool( addr value.handle, addr result ) == KuzuSuccess )


func toInt8*( value: KuzuValue ): int8 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_INT8:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != int8" )
    assert( kuzu_value_get_int8( addr value.handle, addr result ) == KuzuSuccess )


func toInt16*( value: KuzuValue ): int16 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_INT16:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != int16" )
    assert( kuzu_value_get_int16( addr value.handle, addr result ) == KuzuSuccess )


func toInt32*( value: KuzuValue ): int32 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_INT32:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != int32" )
    assert( kuzu_value_get_int32( addr value.handle, addr result ) == KuzuSuccess )


func toInt64*( value: KuzuValue ): int64 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_INT64:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != int64" )
    assert( kuzu_value_get_int64( addr value.handle, addr result ) == KuzuSuccess )


func toUint8*( value: KuzuValue ): uint8 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_UINT8:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != uint8" )
    assert( kuzu_value_get_uint8( addr value.handle, addr result ) == KuzuSuccess )


func toUint16*( value: KuzuValue ): uint16 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_UINT16:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != uint16" )
    assert( kuzu_value_get_uint16( addr value.handle, addr result ) == KuzuSuccess )


func toUint32*( value: KuzuValue ): uint32 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_UINT32:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != uint32" )
    assert( kuzu_value_get_uint32( addr value.handle, addr result ) == KuzuSuccess )


func toUint64*( value: KuzuValue ): uint64 =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_UINT64:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != uint64" )
    assert( kuzu_value_get_uint64( addr value.handle, addr result ) == KuzuSuccess )


func toDouble*( value: KuzuValue ): float =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_DOUBLE:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != double" )
    assert( kuzu_value_get_double( addr value.handle, addr result ) == KuzuSuccess )


func toFloat*( value: KuzuValue ): float =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_FLOAT:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != float" )
    var rv: cfloat
    assert( kuzu_value_get_float( addr value.handle, addr rv ) == KuzuSuccess )
    result = rv


func toTimestamp*( value: KuzuValue ): int =
    ## Conversion from Kuzu type to Nim.
    if value.kind != KUZU_TIMESTAMP:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != timestamp" )
    var rv: kuzu_timestamp_t
    assert( kuzu_value_get_timestamp( addr value.handle, addr rv ) == KuzuSuccess )
    result = rv.value


func toList*( value: KuzuValue ): seq[ KuzuValue ] =
    ## Return a sequence from KUZU_LIST values.
    if value.kind != KUZU_LIST:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != list" )
    result = @[]
    var size: uint64
    assert( kuzu_value_get_list_size( addr value.handle, addr size ) == KuzuSuccess )
    if size == 0: return

    for i in ( 0 .. size-1 ):
        var kval = new KuzuValue
        assert(
            kuzu_value_get_list_element(
                addr value.handle, i.uint64, addr kval.handle
            ) == KuzuSuccess )
        kval.getType()
        result.add( kval )

const toSeq* = toList


proc toBlob*( value: KuzuValue ): seq[ byte ] =
    ## Conversion from Kuzu type to Nim - returns a BLOB as a sequence of bytes.
    if value.kind != KUZU_BLOB:
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != blob" )

    result = @[]
    var data: ptr byte
    assert( kuzu_value_get_blob( addr value.handle, addr data ) == KuzuSuccess )

    for idx in 0 .. BLOB_MAXSIZE:
        var byte = cast[ptr byte](cast[uint](data) + idx.uint)[]
        if byte == 0: break
        result.add( byte )

    kuzu_destroy_blob( data )


func toStruct*( value: KuzuValue ): KuzuStructValue =
    ## Create a convenience class for struct-like KuzuValues.
    if not [
        KUZU_STRUCT,
        KUZU_NODE,
        KUZU_REL,
        KUZU_RECURSIVE_REL,
        KUZU_UNION
    ].contains( value.kind ):
        raise newException( KuzuTypeError, &"Mismatched types: {value.kind} != struct" )
    result = new KuzuStructValue
    result.value = value

    discard kuzu_value_get_struct_num_fields( addr value.handle, addr result.len )
    if result.len == 0: return

    # Build keys
    for idx in ( 0 .. result.len - 1 ):
        var keyname: cstring
        assert(
            kuzu_value_get_struct_field_name(
                addr value.handle, idx.uint64, addr keyname
            ) == KuzuSuccess )
        result.keys.add( $keyname )

const toNode* = toStruct
const toRel*  = toStruct


func `[]`*( struct: KuzuStructValue, key: string ): KuzuValue =
    ## Return a KuzuValue for the struct *key*.
    var idx: uint64
    var found = false
    for i in ( 0 .. struct.len-1 ):
        if struct.keys[i] == key:
            found = true
            idx = i
            break
    if not found:
        raise newException( KuzuIndexError,
            &"""No such struct key "{key}".""" )

    result = new KuzuValue
    assert(
        kuzu_value_get_struct_field_value(
            addr struct.value.handle, idx.uint64, addr result.handle
        ) == KuzuSuccess )
    result.getType()


func `$`*( struct: KuzuStructValue ): string =
    ## Stringify a struct value.
    result = $kuzu_value_to_string( addr struct.value.handle )


