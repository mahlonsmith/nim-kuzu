# vim: set et sta sw=4 ts=4 :

proc `=destroy`*( value: KuzuValueObj ) =
    ## Graceful cleanup for out of scope values.
    if value.valid:
        kuzu_value_destroy( addr value.handle )


proc `$`*( value: KuzuValue ): string =
    ## Stringify a value.
    result = $kuzu_value_to_string( addr value.handle )


proc kind*( value: KuzuValue ): kuzu_data_type_id =
    ## Find and return the native Kuzu type of this value.
    var logical_type: kuzu_logical_type
    kuzu_value_get_data_type( addr value.handle, addr logical_type )
    result = kuzu_data_type_get_id( addr logical_type )
    # var num: uint64
    # discard kuzu_data_type_get_num_elements_in_array( addr logical_type, addr num )
    # echo "HMMM ", $num
    kuzu_data_type_destroy( addr logical_type )

  # enum_kuzu_data_type_id_570425857* {.size: sizeof(cuint).} = enum
  #   KUZU_ANY = 0, KUZU_NODE = 10, KUZU_REL = 11, KUZU_RECURSIVE_REL = 12,
  #   KUZU_SERIAL = 13, KUZU_BOOL = 22, KUZU_INT64 = 23, KUZU_INT32 = 24,
  #   KUZU_INT16 = 25, KUZU_INT8 = 26, KUZU_UINT64 = 27, KUZU_UINT32 = 28,
  #   KUZU_UINT16 = 29, KUZU_UINT8 = 30, KUZU_INT128 = 31, KUZU_DOUBLE = 32,
  #   KUZU_FLOAT = 33, KUZU_DATE = 34, KUZU_TIMESTAMP = 35,
  #   KUZU_TIMESTAMP_SEC = 36, KUZU_TIMESTAMP_MS = 37, KUZU_TIMESTAMP_NS = 38,
  #   KUZU_TIMESTAMP_TZ = 39, KUZU_INTERVAL = 40, KUZU_DECIMAL = 41,
  #   KUZU_INTERNAL_ID = 42, KUZU_STRING = 50, KUZU_BLOB = 51, KUZU_LIST = 52,
  #   KUZU_ARRAY = 53, KUZU_STRUCT = 54, KUZU_MAP = 55, KUZU_UNION = 56,
  #   KUZU_POINTER = 58, KUZU_UUID = 59

# proc getValue*( value: KuzuValue ):
#
#  FIXME: type checks and conversions from supported kuzu
#  types to supported Nim types.
#
#  Currently the value can only be stringified via `$`.
#

