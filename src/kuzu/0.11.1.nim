
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_kuzu_data_type_id_570425857* {.size: sizeof(cuint).} = enum
    KUZU_ANY = 0, KUZU_NODE = 10, KUZU_REL = 11, KUZU_RECURSIVE_REL = 12,
    KUZU_SERIAL = 13, KUZU_BOOL = 22, KUZU_INT64 = 23, KUZU_INT32 = 24,
    KUZU_INT16 = 25, KUZU_INT8 = 26, KUZU_UINT64 = 27, KUZU_UINT32 = 28,
    KUZU_UINT16 = 29, KUZU_UINT8 = 30, KUZU_INT128 = 31, KUZU_DOUBLE = 32,
    KUZU_FLOAT = 33, KUZU_DATE = 34, KUZU_TIMESTAMP = 35,
    KUZU_TIMESTAMP_SEC = 36, KUZU_TIMESTAMP_MS = 37, KUZU_TIMESTAMP_NS = 38,
    KUZU_TIMESTAMP_TZ = 39, KUZU_INTERVAL = 40, KUZU_DECIMAL = 41,
    KUZU_INTERNAL_ID = 42, KUZU_STRING = 50, KUZU_BLOB = 51, KUZU_LIST = 52,
    KUZU_ARRAY = 53, KUZU_STRUCT = 54, KUZU_MAP = 55, KUZU_UNION = 56,
    KUZU_POINTER = 58, KUZU_UUID = 59
type
  enum_kuzu_state_570425861* {.size: sizeof(cuint).} = enum
    KuzuSuccess = 0, KuzuError = 1
when not declared(KUZU_HELPER_DLL_IMPORT):
  type
    KUZU_HELPER_DLL_IMPORT* = object
else:
  static :
    hint("Declaration of " & "KUZU_HELPER_DLL_IMPORT" &
        " already exists, not redeclaring")
when not declared(KUZU_HELPER_DEPRECATED):
  type
    KUZU_HELPER_DEPRECATED* = object
else:
  static :
    hint("Declaration of " & "KUZU_HELPER_DEPRECATED" &
        " already exists, not redeclaring")
type
  struct_ArrowSchema_570425781 {.pure, inheritable, bycopy.} = object
    format*: cstring         ## Generated based on /usr/include/kuzu.h:64:8
    name*: cstring
    metadata*: cstring
    flags*: int64
    n_children*: int64
    children*: ptr ptr struct_ArrowSchema_570425782
    dictionary*: ptr struct_ArrowSchema_570425782
    release*: proc (a0: ptr struct_ArrowSchema_570425782): void {.cdecl.}
    private_data*: pointer
  struct_ArrowArray_570425783 {.pure, inheritable, bycopy.} = object
    length*: int64           ## Generated based on /usr/include/kuzu.h:80:8
    null_count*: int64
    offset*: int64
    n_buffers*: int64
    n_children*: int64
    buffers*: ptr pointer
    children*: ptr ptr struct_ArrowArray_570425784
    dictionary*: ptr struct_ArrowArray_570425784
    release*: proc (a0: ptr struct_ArrowArray_570425784): void {.cdecl.}
    private_data*: pointer
  struct_kuzu_system_config_570425785 {.pure, inheritable, bycopy.} = object
    buffer_pool_size*: uint64 ## Generated based on /usr/include/kuzu.h:112:9
    max_num_threads*: uint64
    enable_compression*: bool
    read_only*: bool
    max_db_size*: uint64
    auto_checkpoint*: bool
    checkpoint_threshold*: uint64
  kuzu_system_config_570425787 = struct_kuzu_system_config_570425786 ## Generated based on /usr/include/kuzu.h:141:3
  struct_kuzu_database_570425789 {.pure, inheritable, bycopy.} = object
    internal_database*: pointer ## Generated based on /usr/include/kuzu.h:146:9
  kuzu_database_570425791 = struct_kuzu_database_570425790 ## Generated based on /usr/include/kuzu.h:148:3
  struct_kuzu_connection_570425793 {.pure, inheritable, bycopy.} = object
    internal_connection*: pointer ## Generated based on /usr/include/kuzu.h:155:9
  kuzu_connection_570425795 = struct_kuzu_connection_570425794 ## Generated based on /usr/include/kuzu.h:157:3
  struct_kuzu_prepared_statement_570425797 {.pure, inheritable, bycopy.} = object
    internal_prepared_statement*: pointer ## Generated based on /usr/include/kuzu.h:163:9
    internal_bound_values*: pointer
  kuzu_prepared_statement_570425799 = struct_kuzu_prepared_statement_570425798 ## Generated based on /usr/include/kuzu.h:166:3
  struct_kuzu_query_result_570425801 {.pure, inheritable, bycopy.} = object
    internal_query_result*: pointer ## Generated based on /usr/include/kuzu.h:171:9
    internal_is_owned_by_cpp*: bool
  kuzu_query_result_570425803 = struct_kuzu_query_result_570425802 ## Generated based on /usr/include/kuzu.h:174:3
  struct_kuzu_flat_tuple_570425805 {.pure, inheritable, bycopy.} = object
    internal_flat_tuple*: pointer ## Generated based on /usr/include/kuzu.h:179:9
    internal_is_owned_by_cpp*: bool
  kuzu_flat_tuple_570425807 = struct_kuzu_flat_tuple_570425806 ## Generated based on /usr/include/kuzu.h:182:3
  struct_kuzu_logical_type_570425809 {.pure, inheritable, bycopy.} = object
    internal_data_type*: pointer ## Generated based on /usr/include/kuzu.h:187:9
  kuzu_logical_type_570425811 = struct_kuzu_logical_type_570425810 ## Generated based on /usr/include/kuzu.h:189:3
  struct_kuzu_value_570425813 {.pure, inheritable, bycopy.} = object
    internal_value*: pointer ## Generated based on /usr/include/kuzu.h:194:9
    internal_is_owned_by_cpp*: bool
  kuzu_value_570425815 = struct_kuzu_value_570425814 ## Generated based on /usr/include/kuzu.h:197:3
  struct_kuzu_internal_id_t_570425817 {.pure, inheritable, bycopy.} = object
    table_id*: uint64        ## Generated based on /usr/include/kuzu.h:202:9
    offset*: uint64
  kuzu_internal_id_t_570425819 = struct_kuzu_internal_id_t_570425818 ## Generated based on /usr/include/kuzu.h:205:3
  struct_kuzu_date_t_570425821 {.pure, inheritable, bycopy.} = object
    days*: int32             ## Generated based on /usr/include/kuzu.h:210:9
  kuzu_date_t_570425823 = struct_kuzu_date_t_570425822 ## Generated based on /usr/include/kuzu.h:213:3
  struct_kuzu_timestamp_ns_t_570425825 {.pure, inheritable, bycopy.} = object
    value*: int64            ## Generated based on /usr/include/kuzu.h:219:9
  kuzu_timestamp_ns_t_570425827 = struct_kuzu_timestamp_ns_t_570425826 ## Generated based on /usr/include/kuzu.h:222:3
  struct_kuzu_timestamp_ms_t_570425829 {.pure, inheritable, bycopy.} = object
    value*: int64            ## Generated based on /usr/include/kuzu.h:228:9
  kuzu_timestamp_ms_t_570425831 = struct_kuzu_timestamp_ms_t_570425830 ## Generated based on /usr/include/kuzu.h:231:3
  struct_kuzu_timestamp_sec_t_570425833 {.pure, inheritable, bycopy.} = object
    value*: int64            ## Generated based on /usr/include/kuzu.h:237:9
  kuzu_timestamp_sec_t_570425835 = struct_kuzu_timestamp_sec_t_570425834 ## Generated based on /usr/include/kuzu.h:240:3
  struct_kuzu_timestamp_tz_t_570425837 {.pure, inheritable, bycopy.} = object
    value*: int64            ## Generated based on /usr/include/kuzu.h:246:9
  kuzu_timestamp_tz_t_570425839 = struct_kuzu_timestamp_tz_t_570425838 ## Generated based on /usr/include/kuzu.h:249:3
  struct_kuzu_timestamp_t_570425841 {.pure, inheritable, bycopy.} = object
    value*: int64            ## Generated based on /usr/include/kuzu.h:255:9
  kuzu_timestamp_t_570425843 = struct_kuzu_timestamp_t_570425842 ## Generated based on /usr/include/kuzu.h:258:3
  struct_kuzu_interval_t_570425845 {.pure, inheritable, bycopy.} = object
    months*: int32           ## Generated based on /usr/include/kuzu.h:263:9
    days*: int32
    micros*: int64
  kuzu_interval_t_570425847 = struct_kuzu_interval_t_570425846 ## Generated based on /usr/include/kuzu.h:267:3
  struct_kuzu_query_summary_570425849 {.pure, inheritable, bycopy.} = object
    internal_query_summary*: pointer ## Generated based on /usr/include/kuzu.h:273:9
  kuzu_query_summary_570425851 = struct_kuzu_query_summary_570425850 ## Generated based on /usr/include/kuzu.h:275:3
  struct_kuzu_int128_t_570425853 {.pure, inheritable, bycopy.} = object
    low*: uint64             ## Generated based on /usr/include/kuzu.h:277:9
    high*: int64
  kuzu_int128_t_570425855 = struct_kuzu_int128_t_570425854 ## Generated based on /usr/include/kuzu.h:280:3
  kuzu_data_type_id_570425859 = enum_kuzu_data_type_id_570425858 ## Generated based on /usr/include/kuzu.h:325:3
  kuzu_state_570425863 = enum_kuzu_state_570425862 ## Generated based on /usr/include/kuzu.h:330:49
  struct_tm_570425865 {.pure, inheritable, bycopy.} = object
    tm_sec*: cint            ## Generated based on /usr/include/bits/types/struct_tm.h:7:8
    tm_min*: cint
    tm_hour*: cint
    tm_mday*: cint
    tm_mon*: cint
    tm_year*: cint
    tm_wday*: cint
    tm_yday*: cint
    tm_isdst*: cint
    tm_gmtoff*: clong
    tm_zone*: cstring
  struct_kuzu_prepared_statement_570425798 = (when declared(
      struct_kuzu_prepared_statement):
    when ownSizeof(struct_kuzu_prepared_statement) !=
        ownSizeof(struct_kuzu_prepared_statement_570425797):
      static :
        warning("Declaration of " & "struct_kuzu_prepared_statement" &
            " exists but with different size")
    struct_kuzu_prepared_statement
  else:
    struct_kuzu_prepared_statement_570425797)
  kuzu_flat_tuple_570425808 = (when declared(kuzu_flat_tuple):
    when ownSizeof(kuzu_flat_tuple) != ownSizeof(kuzu_flat_tuple_570425807):
      static :
        warning("Declaration of " & "kuzu_flat_tuple" &
            " exists but with different size")
    kuzu_flat_tuple
  else:
    kuzu_flat_tuple_570425807)
  struct_kuzu_timestamp_sec_t_570425834 = (when declared(
      struct_kuzu_timestamp_sec_t):
    when ownSizeof(struct_kuzu_timestamp_sec_t) !=
        ownSizeof(struct_kuzu_timestamp_sec_t_570425833):
      static :
        warning("Declaration of " & "struct_kuzu_timestamp_sec_t" &
            " exists but with different size")
    struct_kuzu_timestamp_sec_t
  else:
    struct_kuzu_timestamp_sec_t_570425833)
  kuzu_timestamp_tz_t_570425840 = (when declared(kuzu_timestamp_tz_t):
    when ownSizeof(kuzu_timestamp_tz_t) != ownSizeof(kuzu_timestamp_tz_t_570425839):
      static :
        warning("Declaration of " & "kuzu_timestamp_tz_t" &
            " exists but with different size")
    kuzu_timestamp_tz_t
  else:
    kuzu_timestamp_tz_t_570425839)
  struct_kuzu_timestamp_t_570425842 = (when declared(struct_kuzu_timestamp_t):
    when ownSizeof(struct_kuzu_timestamp_t) !=
        ownSizeof(struct_kuzu_timestamp_t_570425841):
      static :
        warning("Declaration of " & "struct_kuzu_timestamp_t" &
            " exists but with different size")
    struct_kuzu_timestamp_t
  else:
    struct_kuzu_timestamp_t_570425841)
  kuzu_query_summary_570425852 = (when declared(kuzu_query_summary):
    when ownSizeof(kuzu_query_summary) != ownSizeof(kuzu_query_summary_570425851):
      static :
        warning("Declaration of " & "kuzu_query_summary" &
            " exists but with different size")
    kuzu_query_summary
  else:
    kuzu_query_summary_570425851)
  kuzu_timestamp_ns_t_570425828 = (when declared(kuzu_timestamp_ns_t):
    when ownSizeof(kuzu_timestamp_ns_t) != ownSizeof(kuzu_timestamp_ns_t_570425827):
      static :
        warning("Declaration of " & "kuzu_timestamp_ns_t" &
            " exists but with different size")
    kuzu_timestamp_ns_t
  else:
    kuzu_timestamp_ns_t_570425827)
  struct_kuzu_timestamp_ms_t_570425830 = (when declared(
      struct_kuzu_timestamp_ms_t):
    when ownSizeof(struct_kuzu_timestamp_ms_t) !=
        ownSizeof(struct_kuzu_timestamp_ms_t_570425829):
      static :
        warning("Declaration of " & "struct_kuzu_timestamp_ms_t" &
            " exists but with different size")
    struct_kuzu_timestamp_ms_t
  else:
    struct_kuzu_timestamp_ms_t_570425829)
  kuzu_data_type_id_570425860 = (when declared(kuzu_data_type_id):
    when ownSizeof(kuzu_data_type_id) != ownSizeof(kuzu_data_type_id_570425859):
      static :
        warning("Declaration of " & "kuzu_data_type_id" &
            " exists but with different size")
    kuzu_data_type_id
  else:
    kuzu_data_type_id_570425859)
  enum_kuzu_state_570425862 = (when declared(enum_kuzu_state):
    when ownSizeof(enum_kuzu_state) != ownSizeof(enum_kuzu_state_570425861):
      static :
        warning("Declaration of " & "enum_kuzu_state" &
            " exists but with different size")
    enum_kuzu_state
  else:
    enum_kuzu_state_570425861)
  kuzu_date_t_570425824 = (when declared(kuzu_date_t):
    when ownSizeof(kuzu_date_t) != ownSizeof(kuzu_date_t_570425823):
      static :
        warning("Declaration of " & "kuzu_date_t" &
            " exists but with different size")
    kuzu_date_t
  else:
    kuzu_date_t_570425823)
  kuzu_state_570425864 = (when declared(kuzu_state):
    when ownSizeof(kuzu_state) != ownSizeof(kuzu_state_570425863):
      static :
        warning("Declaration of " & "kuzu_state" &
            " exists but with different size")
    kuzu_state
  else:
    kuzu_state_570425863)
  kuzu_timestamp_ms_t_570425832 = (when declared(kuzu_timestamp_ms_t):
    when ownSizeof(kuzu_timestamp_ms_t) != ownSizeof(kuzu_timestamp_ms_t_570425831):
      static :
        warning("Declaration of " & "kuzu_timestamp_ms_t" &
            " exists but with different size")
    kuzu_timestamp_ms_t
  else:
    kuzu_timestamp_ms_t_570425831)
  struct_kuzu_flat_tuple_570425806 = (when declared(struct_kuzu_flat_tuple):
    when ownSizeof(struct_kuzu_flat_tuple) != ownSizeof(struct_kuzu_flat_tuple_570425805):
      static :
        warning("Declaration of " & "struct_kuzu_flat_tuple" &
            " exists but with different size")
    struct_kuzu_flat_tuple
  else:
    struct_kuzu_flat_tuple_570425805)
  struct_kuzu_connection_570425794 = (when declared(struct_kuzu_connection):
    when ownSizeof(struct_kuzu_connection) != ownSizeof(struct_kuzu_connection_570425793):
      static :
        warning("Declaration of " & "struct_kuzu_connection" &
            " exists but with different size")
    struct_kuzu_connection
  else:
    struct_kuzu_connection_570425793)
  struct_kuzu_date_t_570425822 = (when declared(struct_kuzu_date_t):
    when ownSizeof(struct_kuzu_date_t) != ownSizeof(struct_kuzu_date_t_570425821):
      static :
        warning("Declaration of " & "struct_kuzu_date_t" &
            " exists but with different size")
    struct_kuzu_date_t
  else:
    struct_kuzu_date_t_570425821)
  struct_kuzu_timestamp_tz_t_570425838 = (when declared(
      struct_kuzu_timestamp_tz_t):
    when ownSizeof(struct_kuzu_timestamp_tz_t) !=
        ownSizeof(struct_kuzu_timestamp_tz_t_570425837):
      static :
        warning("Declaration of " & "struct_kuzu_timestamp_tz_t" &
            " exists but with different size")
    struct_kuzu_timestamp_tz_t
  else:
    struct_kuzu_timestamp_tz_t_570425837)
  struct_kuzu_interval_t_570425846 = (when declared(struct_kuzu_interval_t):
    when ownSizeof(struct_kuzu_interval_t) != ownSizeof(struct_kuzu_interval_t_570425845):
      static :
        warning("Declaration of " & "struct_kuzu_interval_t" &
            " exists but with different size")
    struct_kuzu_interval_t
  else:
    struct_kuzu_interval_t_570425845)
  kuzu_int128_t_570425856 = (when declared(kuzu_int128_t):
    when ownSizeof(kuzu_int128_t) != ownSizeof(kuzu_int128_t_570425855):
      static :
        warning("Declaration of " & "kuzu_int128_t" &
            " exists but with different size")
    kuzu_int128_t
  else:
    kuzu_int128_t_570425855)
  struct_kuzu_system_config_570425786 = (when declared(struct_kuzu_system_config):
    when ownSizeof(struct_kuzu_system_config) !=
        ownSizeof(struct_kuzu_system_config_570425785):
      static :
        warning("Declaration of " & "struct_kuzu_system_config" &
            " exists but with different size")
    struct_kuzu_system_config
  else:
    struct_kuzu_system_config_570425785)
  kuzu_connection_570425796 = (when declared(kuzu_connection):
    when ownSizeof(kuzu_connection) != ownSizeof(kuzu_connection_570425795):
      static :
        warning("Declaration of " & "kuzu_connection" &
            " exists but with different size")
    kuzu_connection
  else:
    kuzu_connection_570425795)
  struct_ArrowSchema_570425782 = (when declared(struct_ArrowSchema):
    when ownSizeof(struct_ArrowSchema) != ownSizeof(struct_ArrowSchema_570425781):
      static :
        warning("Declaration of " & "struct_ArrowSchema" &
            " exists but with different size")
    struct_ArrowSchema
  else:
    struct_ArrowSchema_570425781)
  kuzu_prepared_statement_570425800 = (when declared(kuzu_prepared_statement):
    when ownSizeof(kuzu_prepared_statement) !=
        ownSizeof(kuzu_prepared_statement_570425799):
      static :
        warning("Declaration of " & "kuzu_prepared_statement" &
            " exists but with different size")
    kuzu_prepared_statement
  else:
    kuzu_prepared_statement_570425799)
  struct_kuzu_value_570425814 = (when declared(struct_kuzu_value):
    when ownSizeof(struct_kuzu_value) != ownSizeof(struct_kuzu_value_570425813):
      static :
        warning("Declaration of " & "struct_kuzu_value" &
            " exists but with different size")
    struct_kuzu_value
  else:
    struct_kuzu_value_570425813)
  kuzu_internal_id_t_570425820 = (when declared(kuzu_internal_id_t):
    when ownSizeof(kuzu_internal_id_t) != ownSizeof(kuzu_internal_id_t_570425819):
      static :
        warning("Declaration of " & "kuzu_internal_id_t" &
            " exists but with different size")
    kuzu_internal_id_t
  else:
    kuzu_internal_id_t_570425819)
  kuzu_system_config_570425788 = (when declared(kuzu_system_config):
    when ownSizeof(kuzu_system_config) != ownSizeof(kuzu_system_config_570425787):
      static :
        warning("Declaration of " & "kuzu_system_config" &
            " exists but with different size")
    kuzu_system_config
  else:
    kuzu_system_config_570425787)
  struct_tm_570425866 = (when declared(struct_tm):
    when ownSizeof(struct_tm) != ownSizeof(struct_tm_570425865):
      static :
        warning("Declaration of " & "struct_tm" &
            " exists but with different size")
    struct_tm
  else:
    struct_tm_570425865)
  struct_kuzu_query_result_570425802 = (when declared(struct_kuzu_query_result):
    when ownSizeof(struct_kuzu_query_result) !=
        ownSizeof(struct_kuzu_query_result_570425801):
      static :
        warning("Declaration of " & "struct_kuzu_query_result" &
            " exists but with different size")
    struct_kuzu_query_result
  else:
    struct_kuzu_query_result_570425801)
  struct_kuzu_database_570425790 = (when declared(struct_kuzu_database):
    when ownSizeof(struct_kuzu_database) != ownSizeof(struct_kuzu_database_570425789):
      static :
        warning("Declaration of " & "struct_kuzu_database" &
            " exists but with different size")
    struct_kuzu_database
  else:
    struct_kuzu_database_570425789)
  struct_kuzu_timestamp_ns_t_570425826 = (when declared(
      struct_kuzu_timestamp_ns_t):
    when ownSizeof(struct_kuzu_timestamp_ns_t) !=
        ownSizeof(struct_kuzu_timestamp_ns_t_570425825):
      static :
        warning("Declaration of " & "struct_kuzu_timestamp_ns_t" &
            " exists but with different size")
    struct_kuzu_timestamp_ns_t
  else:
    struct_kuzu_timestamp_ns_t_570425825)
  kuzu_interval_t_570425848 = (when declared(kuzu_interval_t):
    when ownSizeof(kuzu_interval_t) != ownSizeof(kuzu_interval_t_570425847):
      static :
        warning("Declaration of " & "kuzu_interval_t" &
            " exists but with different size")
    kuzu_interval_t
  else:
    kuzu_interval_t_570425847)
  struct_kuzu_int128_t_570425854 = (when declared(struct_kuzu_int128_t):
    when ownSizeof(struct_kuzu_int128_t) != ownSizeof(struct_kuzu_int128_t_570425853):
      static :
        warning("Declaration of " & "struct_kuzu_int128_t" &
            " exists but with different size")
    struct_kuzu_int128_t
  else:
    struct_kuzu_int128_t_570425853)
  struct_ArrowArray_570425784 = (when declared(struct_ArrowArray):
    when ownSizeof(struct_ArrowArray) != ownSizeof(struct_ArrowArray_570425783):
      static :
        warning("Declaration of " & "struct_ArrowArray" &
            " exists but with different size")
    struct_ArrowArray
  else:
    struct_ArrowArray_570425783)
  struct_kuzu_logical_type_570425810 = (when declared(struct_kuzu_logical_type):
    when ownSizeof(struct_kuzu_logical_type) !=
        ownSizeof(struct_kuzu_logical_type_570425809):
      static :
        warning("Declaration of " & "struct_kuzu_logical_type" &
            " exists but with different size")
    struct_kuzu_logical_type
  else:
    struct_kuzu_logical_type_570425809)
  struct_kuzu_query_summary_570425850 = (when declared(struct_kuzu_query_summary):
    when ownSizeof(struct_kuzu_query_summary) !=
        ownSizeof(struct_kuzu_query_summary_570425849):
      static :
        warning("Declaration of " & "struct_kuzu_query_summary" &
            " exists but with different size")
    struct_kuzu_query_summary
  else:
    struct_kuzu_query_summary_570425849)
  kuzu_logical_type_570425812 = (when declared(kuzu_logical_type):
    when ownSizeof(kuzu_logical_type) != ownSizeof(kuzu_logical_type_570425811):
      static :
        warning("Declaration of " & "kuzu_logical_type" &
            " exists but with different size")
    kuzu_logical_type
  else:
    kuzu_logical_type_570425811)
  kuzu_value_570425816 = (when declared(kuzu_value):
    when ownSizeof(kuzu_value) != ownSizeof(kuzu_value_570425815):
      static :
        warning("Declaration of " & "kuzu_value" &
            " exists but with different size")
    kuzu_value
  else:
    kuzu_value_570425815)
  kuzu_timestamp_sec_t_570425836 = (when declared(kuzu_timestamp_sec_t):
    when ownSizeof(kuzu_timestamp_sec_t) != ownSizeof(kuzu_timestamp_sec_t_570425835):
      static :
        warning("Declaration of " & "kuzu_timestamp_sec_t" &
            " exists but with different size")
    kuzu_timestamp_sec_t
  else:
    kuzu_timestamp_sec_t_570425835)
  enum_kuzu_data_type_id_570425858 = (when declared(enum_kuzu_data_type_id):
    when ownSizeof(enum_kuzu_data_type_id) != ownSizeof(enum_kuzu_data_type_id_570425857):
      static :
        warning("Declaration of " & "enum_kuzu_data_type_id" &
            " exists but with different size")
    enum_kuzu_data_type_id
  else:
    enum_kuzu_data_type_id_570425857)
  kuzu_query_result_570425804 = (when declared(kuzu_query_result):
    when ownSizeof(kuzu_query_result) != ownSizeof(kuzu_query_result_570425803):
      static :
        warning("Declaration of " & "kuzu_query_result" &
            " exists but with different size")
    kuzu_query_result
  else:
    kuzu_query_result_570425803)
  struct_kuzu_internal_id_t_570425818 = (when declared(struct_kuzu_internal_id_t):
    when ownSizeof(struct_kuzu_internal_id_t) !=
        ownSizeof(struct_kuzu_internal_id_t_570425817):
      static :
        warning("Declaration of " & "struct_kuzu_internal_id_t" &
            " exists but with different size")
    struct_kuzu_internal_id_t
  else:
    struct_kuzu_internal_id_t_570425817)
  kuzu_database_570425792 = (when declared(kuzu_database):
    when ownSizeof(kuzu_database) != ownSizeof(kuzu_database_570425791):
      static :
        warning("Declaration of " & "kuzu_database" &
            " exists but with different size")
    kuzu_database
  else:
    kuzu_database_570425791)
  kuzu_timestamp_t_570425844 = (when declared(kuzu_timestamp_t):
    when ownSizeof(kuzu_timestamp_t) != ownSizeof(kuzu_timestamp_t_570425843):
      static :
        warning("Declaration of " & "kuzu_timestamp_t" &
            " exists but with different size")
    kuzu_timestamp_t
  else:
    kuzu_timestamp_t_570425843)
when not declared(struct_kuzu_prepared_statement):
  type
    struct_kuzu_prepared_statement* = struct_kuzu_prepared_statement_570425797
else:
  static :
    hint("Declaration of " & "struct_kuzu_prepared_statement" &
        " already exists, not redeclaring")
when not declared(kuzu_flat_tuple):
  type
    kuzu_flat_tuple* = kuzu_flat_tuple_570425807
else:
  static :
    hint("Declaration of " & "kuzu_flat_tuple" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_timestamp_sec_t):
  type
    struct_kuzu_timestamp_sec_t* = struct_kuzu_timestamp_sec_t_570425833
else:
  static :
    hint("Declaration of " & "struct_kuzu_timestamp_sec_t" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_tz_t):
  type
    kuzu_timestamp_tz_t* = kuzu_timestamp_tz_t_570425839
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_tz_t" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_timestamp_t):
  type
    struct_kuzu_timestamp_t* = struct_kuzu_timestamp_t_570425841
else:
  static :
    hint("Declaration of " & "struct_kuzu_timestamp_t" &
        " already exists, not redeclaring")
when not declared(kuzu_query_summary):
  type
    kuzu_query_summary* = kuzu_query_summary_570425851
else:
  static :
    hint("Declaration of " & "kuzu_query_summary" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_ns_t):
  type
    kuzu_timestamp_ns_t* = kuzu_timestamp_ns_t_570425827
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_ns_t" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_timestamp_ms_t):
  type
    struct_kuzu_timestamp_ms_t* = struct_kuzu_timestamp_ms_t_570425829
else:
  static :
    hint("Declaration of " & "struct_kuzu_timestamp_ms_t" &
        " already exists, not redeclaring")
when not declared(kuzu_data_type_id):
  type
    kuzu_data_type_id* = kuzu_data_type_id_570425859
else:
  static :
    hint("Declaration of " & "kuzu_data_type_id" &
        " already exists, not redeclaring")
when not declared(enum_kuzu_state):
  type
    enum_kuzu_state* = enum_kuzu_state_570425861
else:
  static :
    hint("Declaration of " & "enum_kuzu_state" &
        " already exists, not redeclaring")
when not declared(kuzu_date_t):
  type
    kuzu_date_t* = kuzu_date_t_570425823
else:
  static :
    hint("Declaration of " & "kuzu_date_t" & " already exists, not redeclaring")
when not declared(kuzu_state):
  type
    kuzu_state* = kuzu_state_570425863
else:
  static :
    hint("Declaration of " & "kuzu_state" & " already exists, not redeclaring")
when not declared(kuzu_timestamp_ms_t):
  type
    kuzu_timestamp_ms_t* = kuzu_timestamp_ms_t_570425831
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_ms_t" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_flat_tuple):
  type
    struct_kuzu_flat_tuple* = struct_kuzu_flat_tuple_570425805
else:
  static :
    hint("Declaration of " & "struct_kuzu_flat_tuple" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_connection):
  type
    struct_kuzu_connection* = struct_kuzu_connection_570425793
else:
  static :
    hint("Declaration of " & "struct_kuzu_connection" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_date_t):
  type
    struct_kuzu_date_t* = struct_kuzu_date_t_570425821
else:
  static :
    hint("Declaration of " & "struct_kuzu_date_t" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_timestamp_tz_t):
  type
    struct_kuzu_timestamp_tz_t* = struct_kuzu_timestamp_tz_t_570425837
else:
  static :
    hint("Declaration of " & "struct_kuzu_timestamp_tz_t" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_interval_t):
  type
    struct_kuzu_interval_t* = struct_kuzu_interval_t_570425845
else:
  static :
    hint("Declaration of " & "struct_kuzu_interval_t" &
        " already exists, not redeclaring")
when not declared(kuzu_int128_t):
  type
    kuzu_int128_t* = kuzu_int128_t_570425855
else:
  static :
    hint("Declaration of " & "kuzu_int128_t" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_system_config):
  type
    struct_kuzu_system_config* = struct_kuzu_system_config_570425785
else:
  static :
    hint("Declaration of " & "struct_kuzu_system_config" &
        " already exists, not redeclaring")
when not declared(kuzu_connection):
  type
    kuzu_connection* = kuzu_connection_570425795
else:
  static :
    hint("Declaration of " & "kuzu_connection" &
        " already exists, not redeclaring")
when not declared(struct_ArrowSchema):
  type
    struct_ArrowSchema* = struct_ArrowSchema_570425781
else:
  static :
    hint("Declaration of " & "struct_ArrowSchema" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement):
  type
    kuzu_prepared_statement* = kuzu_prepared_statement_570425799
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_value):
  type
    struct_kuzu_value* = struct_kuzu_value_570425813
else:
  static :
    hint("Declaration of " & "struct_kuzu_value" &
        " already exists, not redeclaring")
when not declared(kuzu_internal_id_t):
  type
    kuzu_internal_id_t* = kuzu_internal_id_t_570425819
else:
  static :
    hint("Declaration of " & "kuzu_internal_id_t" &
        " already exists, not redeclaring")
when not declared(kuzu_system_config):
  type
    kuzu_system_config* = kuzu_system_config_570425787
else:
  static :
    hint("Declaration of " & "kuzu_system_config" &
        " already exists, not redeclaring")
when not declared(struct_tm):
  type
    struct_tm* = struct_tm_570425865
else:
  static :
    hint("Declaration of " & "struct_tm" & " already exists, not redeclaring")
when not declared(struct_kuzu_query_result):
  type
    struct_kuzu_query_result* = struct_kuzu_query_result_570425801
else:
  static :
    hint("Declaration of " & "struct_kuzu_query_result" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_database):
  type
    struct_kuzu_database* = struct_kuzu_database_570425789
else:
  static :
    hint("Declaration of " & "struct_kuzu_database" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_timestamp_ns_t):
  type
    struct_kuzu_timestamp_ns_t* = struct_kuzu_timestamp_ns_t_570425825
else:
  static :
    hint("Declaration of " & "struct_kuzu_timestamp_ns_t" &
        " already exists, not redeclaring")
when not declared(kuzu_interval_t):
  type
    kuzu_interval_t* = kuzu_interval_t_570425847
else:
  static :
    hint("Declaration of " & "kuzu_interval_t" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_int128_t):
  type
    struct_kuzu_int128_t* = struct_kuzu_int128_t_570425853
else:
  static :
    hint("Declaration of " & "struct_kuzu_int128_t" &
        " already exists, not redeclaring")
when not declared(struct_ArrowArray):
  type
    struct_ArrowArray* = struct_ArrowArray_570425783
else:
  static :
    hint("Declaration of " & "struct_ArrowArray" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_logical_type):
  type
    struct_kuzu_logical_type* = struct_kuzu_logical_type_570425809
else:
  static :
    hint("Declaration of " & "struct_kuzu_logical_type" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_query_summary):
  type
    struct_kuzu_query_summary* = struct_kuzu_query_summary_570425849
else:
  static :
    hint("Declaration of " & "struct_kuzu_query_summary" &
        " already exists, not redeclaring")
when not declared(kuzu_logical_type):
  type
    kuzu_logical_type* = kuzu_logical_type_570425811
else:
  static :
    hint("Declaration of " & "kuzu_logical_type" &
        " already exists, not redeclaring")
when not declared(kuzu_value):
  type
    kuzu_value* = kuzu_value_570425815
else:
  static :
    hint("Declaration of " & "kuzu_value" & " already exists, not redeclaring")
when not declared(kuzu_timestamp_sec_t):
  type
    kuzu_timestamp_sec_t* = kuzu_timestamp_sec_t_570425835
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_sec_t" &
        " already exists, not redeclaring")
when not declared(enum_kuzu_data_type_id):
  type
    enum_kuzu_data_type_id* = enum_kuzu_data_type_id_570425857
else:
  static :
    hint("Declaration of " & "enum_kuzu_data_type_id" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result):
  type
    kuzu_query_result* = kuzu_query_result_570425803
else:
  static :
    hint("Declaration of " & "kuzu_query_result" &
        " already exists, not redeclaring")
when not declared(struct_kuzu_internal_id_t):
  type
    struct_kuzu_internal_id_t* = struct_kuzu_internal_id_t_570425817
else:
  static :
    hint("Declaration of " & "struct_kuzu_internal_id_t" &
        " already exists, not redeclaring")
when not declared(kuzu_database):
  type
    kuzu_database* = kuzu_database_570425791
else:
  static :
    hint("Declaration of " & "kuzu_database" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_t):
  type
    kuzu_timestamp_t* = kuzu_timestamp_t_570425843
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_t" &
        " already exists, not redeclaring")
when not declared(KUZU_API):
  when KUZU_HELPER_DLL_IMPORT is typedesc:
    type
      KUZU_API* = KUZU_HELPER_DLL_IMPORT ## Generated based on /usr/include/kuzu.h:33:9
  else:
    when KUZU_HELPER_DLL_IMPORT is static:
      const
        KUZU_API* = KUZU_HELPER_DLL_IMPORT ## Generated based on /usr/include/kuzu.h:33:9
    else:
      let KUZU_API* = KUZU_HELPER_DLL_IMPORT ## Generated based on /usr/include/kuzu.h:33:9
else:
  static :
    hint("Declaration of " & "KUZU_API" & " already exists, not redeclaring")
when not declared(KUZU_DEPRECATED):
  when KUZU_HELPER_DEPRECATED is typedesc:
    type
      KUZU_DEPRECATED* = KUZU_HELPER_DEPRECATED ## Generated based on /usr/include/kuzu.h:40:9
  else:
    when KUZU_HELPER_DEPRECATED is static:
      const
        KUZU_DEPRECATED* = KUZU_HELPER_DEPRECATED ## Generated based on /usr/include/kuzu.h:40:9
    else:
      let KUZU_DEPRECATED* = KUZU_HELPER_DEPRECATED ## Generated based on /usr/include/kuzu.h:40:9
else:
  static :
    hint("Declaration of " & "KUZU_DEPRECATED" &
        " already exists, not redeclaring")
when not declared(ARROW_FLAG_DICTIONARY_ORDERED):
  when 1 is static:
    const
      ARROW_FLAG_DICTIONARY_ORDERED* = 1 ## Generated based on /usr/include/kuzu.h:60:9
  else:
    let ARROW_FLAG_DICTIONARY_ORDERED* = 1 ## Generated based on /usr/include/kuzu.h:60:9
else:
  static :
    hint("Declaration of " & "ARROW_FLAG_DICTIONARY_ORDERED" &
        " already exists, not redeclaring")
when not declared(ARROW_FLAG_NULLABLE):
  when 2 is static:
    const
      ARROW_FLAG_NULLABLE* = 2 ## Generated based on /usr/include/kuzu.h:61:9
  else:
    let ARROW_FLAG_NULLABLE* = 2 ## Generated based on /usr/include/kuzu.h:61:9
else:
  static :
    hint("Declaration of " & "ARROW_FLAG_NULLABLE" &
        " already exists, not redeclaring")
when not declared(ARROW_FLAG_MAP_KEYS_SORTED):
  when 4 is static:
    const
      ARROW_FLAG_MAP_KEYS_SORTED* = 4 ## Generated based on /usr/include/kuzu.h:62:9
  else:
    let ARROW_FLAG_MAP_KEYS_SORTED* = 4 ## Generated based on /usr/include/kuzu.h:62:9
else:
  static :
    hint("Declaration of " & "ARROW_FLAG_MAP_KEYS_SORTED" &
        " already exists, not redeclaring")
when not declared(kuzu_database_init):
  proc kuzu_database_init*(database_path: cstring;
                           system_config: kuzu_system_config_570425788;
                           out_database: ptr kuzu_database_570425792): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_database_init".}
else:
  static :
    hint("Declaration of " & "kuzu_database_init" &
        " already exists, not redeclaring")
when not declared(kuzu_database_destroy):
  proc kuzu_database_destroy*(database: ptr kuzu_database_570425792): void {.
      cdecl, importc: "kuzu_database_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_database_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_default_system_config):
  proc kuzu_default_system_config*(): kuzu_system_config_570425788 {.cdecl,
      importc: "kuzu_default_system_config".}
else:
  static :
    hint("Declaration of " & "kuzu_default_system_config" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_init):
  proc kuzu_connection_init*(database: ptr kuzu_database_570425792;
                             out_connection: ptr kuzu_connection_570425796): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_connection_init".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_init" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_destroy):
  proc kuzu_connection_destroy*(connection: ptr kuzu_connection_570425796): void {.
      cdecl, importc: "kuzu_connection_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_set_max_num_thread_for_exec):
  proc kuzu_connection_set_max_num_thread_for_exec*(
      connection: ptr kuzu_connection_570425796; num_threads: uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_connection_set_max_num_thread_for_exec".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_set_max_num_thread_for_exec" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_get_max_num_thread_for_exec):
  proc kuzu_connection_get_max_num_thread_for_exec*(
      connection: ptr kuzu_connection_570425796; out_result: ptr uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_connection_get_max_num_thread_for_exec".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_get_max_num_thread_for_exec" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_query):
  proc kuzu_connection_query*(connection: ptr kuzu_connection_570425796;
                              query: cstring;
                              out_query_result: ptr kuzu_query_result_570425804): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_connection_query".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_query" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_prepare):
  proc kuzu_connection_prepare*(connection: ptr kuzu_connection_570425796;
                                query: cstring; out_prepared_statement: ptr kuzu_prepared_statement_570425800): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_connection_prepare".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_prepare" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_execute):
  proc kuzu_connection_execute*(connection: ptr kuzu_connection_570425796;
      prepared_statement: ptr kuzu_prepared_statement_570425800;
                                out_query_result: ptr kuzu_query_result_570425804): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_connection_execute".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_execute" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_interrupt):
  proc kuzu_connection_interrupt*(connection: ptr kuzu_connection_570425796): void {.
      cdecl, importc: "kuzu_connection_interrupt".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_interrupt" &
        " already exists, not redeclaring")
when not declared(kuzu_connection_set_query_timeout):
  proc kuzu_connection_set_query_timeout*(connection: ptr kuzu_connection_570425796;
      timeout_in_ms: uint64): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_connection_set_query_timeout".}
else:
  static :
    hint("Declaration of " & "kuzu_connection_set_query_timeout" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_destroy):
  proc kuzu_prepared_statement_destroy*(prepared_statement: ptr kuzu_prepared_statement_570425800): void {.
      cdecl, importc: "kuzu_prepared_statement_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_is_success):
  proc kuzu_prepared_statement_is_success*(
      prepared_statement: ptr kuzu_prepared_statement_570425800): bool {.cdecl,
      importc: "kuzu_prepared_statement_is_success".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_is_success" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_get_error_message):
  proc kuzu_prepared_statement_get_error_message*(
      prepared_statement: ptr kuzu_prepared_statement_570425800): cstring {.
      cdecl, importc: "kuzu_prepared_statement_get_error_message".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_get_error_message" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_bool):
  proc kuzu_prepared_statement_bind_bool*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: bool): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_bool".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_bool" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_int64):
  proc kuzu_prepared_statement_bind_int64*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: int64): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_int64".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_int64" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_int32):
  proc kuzu_prepared_statement_bind_int32*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: int32): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_int32".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_int32" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_int16):
  proc kuzu_prepared_statement_bind_int16*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: int16): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_int16".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_int16" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_int8):
  proc kuzu_prepared_statement_bind_int8*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: int8): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_int8".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_int8" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_uint64):
  proc kuzu_prepared_statement_bind_uint64*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: uint64): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_uint64".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_uint64" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_uint32):
  proc kuzu_prepared_statement_bind_uint32*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: uint32): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_uint32".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_uint32" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_uint16):
  proc kuzu_prepared_statement_bind_uint16*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: uint16): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_uint16".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_uint16" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_uint8):
  proc kuzu_prepared_statement_bind_uint8*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: uint8): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_uint8".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_uint8" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_double):
  proc kuzu_prepared_statement_bind_double*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: cdouble): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_double".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_double" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_float):
  proc kuzu_prepared_statement_bind_float*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: cfloat): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_float".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_float" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_date):
  proc kuzu_prepared_statement_bind_date*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: kuzu_date_t_570425824): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_date".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_date" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_timestamp_ns):
  proc kuzu_prepared_statement_bind_timestamp_ns*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: kuzu_timestamp_ns_t_570425828): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_timestamp_ns".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_timestamp_ns" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_timestamp_sec):
  proc kuzu_prepared_statement_bind_timestamp_sec*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: kuzu_timestamp_sec_t_570425836): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_timestamp_sec".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_timestamp_sec" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_timestamp_tz):
  proc kuzu_prepared_statement_bind_timestamp_tz*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: kuzu_timestamp_tz_t_570425840): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_timestamp_tz".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_timestamp_tz" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_timestamp_ms):
  proc kuzu_prepared_statement_bind_timestamp_ms*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: kuzu_timestamp_ms_t_570425832): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_timestamp_ms".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_timestamp_ms" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_timestamp):
  proc kuzu_prepared_statement_bind_timestamp*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: kuzu_timestamp_t_570425844): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_timestamp".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_timestamp" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_interval):
  proc kuzu_prepared_statement_bind_interval*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: kuzu_interval_t_570425848): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_interval".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_interval" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_string):
  proc kuzu_prepared_statement_bind_string*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: cstring): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_prepared_statement_bind_string".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_string" &
        " already exists, not redeclaring")
when not declared(kuzu_prepared_statement_bind_value):
  proc kuzu_prepared_statement_bind_value*(
      prepared_statement: ptr kuzu_prepared_statement_570425800;
      param_name: cstring; value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_prepared_statement_bind_value".}
else:
  static :
    hint("Declaration of " & "kuzu_prepared_statement_bind_value" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_destroy):
  proc kuzu_query_result_destroy*(query_result: ptr kuzu_query_result_570425804): void {.
      cdecl, importc: "kuzu_query_result_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_is_success):
  proc kuzu_query_result_is_success*(query_result: ptr kuzu_query_result_570425804): bool {.
      cdecl, importc: "kuzu_query_result_is_success".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_is_success" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_error_message):
  proc kuzu_query_result_get_error_message*(query_result: ptr kuzu_query_result_570425804): cstring {.
      cdecl, importc: "kuzu_query_result_get_error_message".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_error_message" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_num_columns):
  proc kuzu_query_result_get_num_columns*(query_result: ptr kuzu_query_result_570425804): uint64 {.
      cdecl, importc: "kuzu_query_result_get_num_columns".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_num_columns" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_column_name):
  proc kuzu_query_result_get_column_name*(query_result: ptr kuzu_query_result_570425804;
      index: uint64; out_column_name: ptr cstring): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_query_result_get_column_name".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_column_name" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_column_data_type):
  proc kuzu_query_result_get_column_data_type*(
      query_result: ptr kuzu_query_result_570425804; index: uint64;
      out_column_data_type: ptr kuzu_logical_type_570425812): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_query_result_get_column_data_type".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_column_data_type" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_num_tuples):
  proc kuzu_query_result_get_num_tuples*(query_result: ptr kuzu_query_result_570425804): uint64 {.
      cdecl, importc: "kuzu_query_result_get_num_tuples".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_num_tuples" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_query_summary):
  proc kuzu_query_result_get_query_summary*(query_result: ptr kuzu_query_result_570425804;
      out_query_summary: ptr kuzu_query_summary_570425852): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_query_result_get_query_summary".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_query_summary" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_has_next):
  proc kuzu_query_result_has_next*(query_result: ptr kuzu_query_result_570425804): bool {.
      cdecl, importc: "kuzu_query_result_has_next".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_has_next" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_next):
  proc kuzu_query_result_get_next*(query_result: ptr kuzu_query_result_570425804;
                                   out_flat_tuple: ptr kuzu_flat_tuple_570425808): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_query_result_get_next".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_next" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_has_next_query_result):
  proc kuzu_query_result_has_next_query_result*(
      query_result: ptr kuzu_query_result_570425804): bool {.cdecl,
      importc: "kuzu_query_result_has_next_query_result".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_has_next_query_result" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_next_query_result):
  proc kuzu_query_result_get_next_query_result*(
      query_result: ptr kuzu_query_result_570425804;
      out_next_query_result: ptr kuzu_query_result_570425804): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_query_result_get_next_query_result".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_next_query_result" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_to_string):
  proc kuzu_query_result_to_string*(query_result: ptr kuzu_query_result_570425804): cstring {.
      cdecl, importc: "kuzu_query_result_to_string".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_to_string" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_reset_iterator):
  proc kuzu_query_result_reset_iterator*(query_result: ptr kuzu_query_result_570425804): void {.
      cdecl, importc: "kuzu_query_result_reset_iterator".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_reset_iterator" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_arrow_schema):
  proc kuzu_query_result_get_arrow_schema*(query_result: ptr kuzu_query_result_570425804;
      out_schema: ptr struct_ArrowSchema_570425782): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_query_result_get_arrow_schema".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_arrow_schema" &
        " already exists, not redeclaring")
when not declared(kuzu_query_result_get_next_arrow_chunk):
  proc kuzu_query_result_get_next_arrow_chunk*(
      query_result: ptr kuzu_query_result_570425804; chunk_size: int64;
      out_arrow_array: ptr struct_ArrowArray_570425784): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_query_result_get_next_arrow_chunk".}
else:
  static :
    hint("Declaration of " & "kuzu_query_result_get_next_arrow_chunk" &
        " already exists, not redeclaring")
when not declared(kuzu_flat_tuple_destroy):
  proc kuzu_flat_tuple_destroy*(flat_tuple: ptr kuzu_flat_tuple_570425808): void {.
      cdecl, importc: "kuzu_flat_tuple_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_flat_tuple_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_flat_tuple_get_value):
  proc kuzu_flat_tuple_get_value*(flat_tuple: ptr kuzu_flat_tuple_570425808;
                                  index: uint64; out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_flat_tuple_get_value".}
else:
  static :
    hint("Declaration of " & "kuzu_flat_tuple_get_value" &
        " already exists, not redeclaring")
when not declared(kuzu_flat_tuple_to_string):
  proc kuzu_flat_tuple_to_string*(flat_tuple: ptr kuzu_flat_tuple_570425808): cstring {.
      cdecl, importc: "kuzu_flat_tuple_to_string".}
else:
  static :
    hint("Declaration of " & "kuzu_flat_tuple_to_string" &
        " already exists, not redeclaring")
when not declared(kuzu_data_type_create):
  proc kuzu_data_type_create*(id: kuzu_data_type_id_570425860;
                              child_type: ptr kuzu_logical_type_570425812;
                              num_elements_in_array: uint64;
                              out_type: ptr kuzu_logical_type_570425812): void {.
      cdecl, importc: "kuzu_data_type_create".}
else:
  static :
    hint("Declaration of " & "kuzu_data_type_create" &
        " already exists, not redeclaring")
when not declared(kuzu_data_type_clone):
  proc kuzu_data_type_clone*(data_type: ptr kuzu_logical_type_570425812;
                             out_type: ptr kuzu_logical_type_570425812): void {.
      cdecl, importc: "kuzu_data_type_clone".}
else:
  static :
    hint("Declaration of " & "kuzu_data_type_clone" &
        " already exists, not redeclaring")
when not declared(kuzu_data_type_destroy):
  proc kuzu_data_type_destroy*(data_type: ptr kuzu_logical_type_570425812): void {.
      cdecl, importc: "kuzu_data_type_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_data_type_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_data_type_equals):
  proc kuzu_data_type_equals*(data_type1: ptr kuzu_logical_type_570425812;
                              data_type2: ptr kuzu_logical_type_570425812): bool {.
      cdecl, importc: "kuzu_data_type_equals".}
else:
  static :
    hint("Declaration of " & "kuzu_data_type_equals" &
        " already exists, not redeclaring")
when not declared(kuzu_data_type_get_id):
  proc kuzu_data_type_get_id*(data_type: ptr kuzu_logical_type_570425812): kuzu_data_type_id_570425860 {.
      cdecl, importc: "kuzu_data_type_get_id".}
else:
  static :
    hint("Declaration of " & "kuzu_data_type_get_id" &
        " already exists, not redeclaring")
when not declared(kuzu_data_type_get_num_elements_in_array):
  proc kuzu_data_type_get_num_elements_in_array*(
      data_type: ptr kuzu_logical_type_570425812; out_result: ptr uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_data_type_get_num_elements_in_array".}
else:
  static :
    hint("Declaration of " & "kuzu_data_type_get_num_elements_in_array" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_null):
  proc kuzu_value_create_null*(): ptr kuzu_value_570425816 {.cdecl,
      importc: "kuzu_value_create_null".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_null" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_null_with_data_type):
  proc kuzu_value_create_null_with_data_type*(data_type: ptr kuzu_logical_type_570425812): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_null_with_data_type".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_null_with_data_type" &
        " already exists, not redeclaring")
when not declared(kuzu_value_is_null):
  proc kuzu_value_is_null*(value: ptr kuzu_value_570425816): bool {.cdecl,
      importc: "kuzu_value_is_null".}
else:
  static :
    hint("Declaration of " & "kuzu_value_is_null" &
        " already exists, not redeclaring")
when not declared(kuzu_value_set_null):
  proc kuzu_value_set_null*(value: ptr kuzu_value_570425816; is_null: bool): void {.
      cdecl, importc: "kuzu_value_set_null".}
else:
  static :
    hint("Declaration of " & "kuzu_value_set_null" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_default):
  proc kuzu_value_create_default*(data_type: ptr kuzu_logical_type_570425812): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_default".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_default" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_bool):
  proc kuzu_value_create_bool*(val_private: bool): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_bool".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_bool" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_int8):
  proc kuzu_value_create_int8*(val_private: int8): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_int8".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_int8" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_int16):
  proc kuzu_value_create_int16*(val_private: int16): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_int16".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_int16" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_int32):
  proc kuzu_value_create_int32*(val_private: int32): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_int32".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_int32" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_int64):
  proc kuzu_value_create_int64*(val_private: int64): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_int64".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_int64" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_uint8):
  proc kuzu_value_create_uint8*(val_private: uint8): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_uint8".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_uint8" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_uint16):
  proc kuzu_value_create_uint16*(val_private: uint16): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_uint16".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_uint16" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_uint32):
  proc kuzu_value_create_uint32*(val_private: uint32): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_uint32".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_uint32" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_uint64):
  proc kuzu_value_create_uint64*(val_private: uint64): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_uint64".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_uint64" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_int128):
  proc kuzu_value_create_int128*(val_private: kuzu_int128_t_570425856): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_int128".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_int128" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_float):
  proc kuzu_value_create_float*(val_private: cfloat): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_float".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_float" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_double):
  proc kuzu_value_create_double*(val_private: cdouble): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_double".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_double" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_internal_id):
  proc kuzu_value_create_internal_id*(val_private: kuzu_internal_id_t_570425820): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_internal_id".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_internal_id" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_date):
  proc kuzu_value_create_date*(val_private: kuzu_date_t_570425824): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_date".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_date" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_timestamp_ns):
  proc kuzu_value_create_timestamp_ns*(val_private: kuzu_timestamp_ns_t_570425828): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_timestamp_ns".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_timestamp_ns" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_timestamp_ms):
  proc kuzu_value_create_timestamp_ms*(val_private: kuzu_timestamp_ms_t_570425832): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_timestamp_ms".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_timestamp_ms" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_timestamp_sec):
  proc kuzu_value_create_timestamp_sec*(val_private: kuzu_timestamp_sec_t_570425836): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_timestamp_sec".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_timestamp_sec" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_timestamp_tz):
  proc kuzu_value_create_timestamp_tz*(val_private: kuzu_timestamp_tz_t_570425840): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_timestamp_tz".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_timestamp_tz" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_timestamp):
  proc kuzu_value_create_timestamp*(val_private: kuzu_timestamp_t_570425844): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_timestamp".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_timestamp" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_interval):
  proc kuzu_value_create_interval*(val_private: kuzu_interval_t_570425848): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_interval".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_interval" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_string):
  proc kuzu_value_create_string*(val_private: cstring): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_create_string".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_string" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_list):
  proc kuzu_value_create_list*(num_elements: uint64;
                               elements: ptr ptr kuzu_value_570425816;
                               out_value: ptr ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_create_list".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_list" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_struct):
  proc kuzu_value_create_struct*(num_fields: uint64; field_names: ptr cstring;
                                 field_values: ptr ptr kuzu_value_570425816;
                                 out_value: ptr ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_create_struct".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_struct" &
        " already exists, not redeclaring")
when not declared(kuzu_value_create_map):
  proc kuzu_value_create_map*(num_fields: uint64; keys: ptr ptr kuzu_value_570425816;
                              values: ptr ptr kuzu_value_570425816;
                              out_value: ptr ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_create_map".}
else:
  static :
    hint("Declaration of " & "kuzu_value_create_map" &
        " already exists, not redeclaring")
when not declared(kuzu_value_clone):
  proc kuzu_value_clone*(value: ptr kuzu_value_570425816): ptr kuzu_value_570425816 {.
      cdecl, importc: "kuzu_value_clone".}
else:
  static :
    hint("Declaration of " & "kuzu_value_clone" &
        " already exists, not redeclaring")
when not declared(kuzu_value_copy):
  proc kuzu_value_copy*(value: ptr kuzu_value_570425816; other: ptr kuzu_value_570425816): void {.
      cdecl, importc: "kuzu_value_copy".}
else:
  static :
    hint("Declaration of " & "kuzu_value_copy" &
        " already exists, not redeclaring")
when not declared(kuzu_value_destroy):
  proc kuzu_value_destroy*(value: ptr kuzu_value_570425816): void {.cdecl,
      importc: "kuzu_value_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_value_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_list_size):
  proc kuzu_value_get_list_size*(value: ptr kuzu_value_570425816;
                                 out_result: ptr uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_list_size".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_list_size" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_list_element):
  proc kuzu_value_get_list_element*(value: ptr kuzu_value_570425816;
                                    index: uint64; out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_list_element".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_list_element" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_struct_num_fields):
  proc kuzu_value_get_struct_num_fields*(value: ptr kuzu_value_570425816;
      out_result: ptr uint64): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_value_get_struct_num_fields".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_struct_num_fields" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_struct_field_name):
  proc kuzu_value_get_struct_field_name*(value: ptr kuzu_value_570425816;
      index: uint64; out_result: ptr cstring): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_value_get_struct_field_name".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_struct_field_name" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_struct_field_value):
  proc kuzu_value_get_struct_field_value*(value: ptr kuzu_value_570425816;
      index: uint64; out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_struct_field_value".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_struct_field_value" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_map_size):
  proc kuzu_value_get_map_size*(value: ptr kuzu_value_570425816;
                                out_result: ptr uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_map_size".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_map_size" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_map_key):
  proc kuzu_value_get_map_key*(value: ptr kuzu_value_570425816; index: uint64;
                               out_key: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_map_key".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_map_key" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_map_value):
  proc kuzu_value_get_map_value*(value: ptr kuzu_value_570425816; index: uint64;
                                 out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_map_value".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_map_value" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_recursive_rel_node_list):
  proc kuzu_value_get_recursive_rel_node_list*(value: ptr kuzu_value_570425816;
      out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_value_get_recursive_rel_node_list".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_recursive_rel_node_list" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_recursive_rel_rel_list):
  proc kuzu_value_get_recursive_rel_rel_list*(value: ptr kuzu_value_570425816;
      out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_value_get_recursive_rel_rel_list".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_recursive_rel_rel_list" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_data_type):
  proc kuzu_value_get_data_type*(value: ptr kuzu_value_570425816;
                                 out_type: ptr kuzu_logical_type_570425812): void {.
      cdecl, importc: "kuzu_value_get_data_type".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_data_type" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_bool):
  proc kuzu_value_get_bool*(value: ptr kuzu_value_570425816;
                            out_result: ptr bool): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_value_get_bool".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_bool" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_int8):
  proc kuzu_value_get_int8*(value: ptr kuzu_value_570425816;
                            out_result: ptr int8): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_value_get_int8".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_int8" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_int16):
  proc kuzu_value_get_int16*(value: ptr kuzu_value_570425816;
                             out_result: ptr int16): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_int16".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_int16" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_int32):
  proc kuzu_value_get_int32*(value: ptr kuzu_value_570425816;
                             out_result: ptr int32): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_int32".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_int32" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_int64):
  proc kuzu_value_get_int64*(value: ptr kuzu_value_570425816;
                             out_result: ptr int64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_int64".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_int64" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_uint8):
  proc kuzu_value_get_uint8*(value: ptr kuzu_value_570425816;
                             out_result: ptr uint8): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_uint8".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_uint8" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_uint16):
  proc kuzu_value_get_uint16*(value: ptr kuzu_value_570425816;
                              out_result: ptr uint16): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_uint16".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_uint16" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_uint32):
  proc kuzu_value_get_uint32*(value: ptr kuzu_value_570425816;
                              out_result: ptr uint32): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_uint32".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_uint32" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_uint64):
  proc kuzu_value_get_uint64*(value: ptr kuzu_value_570425816;
                              out_result: ptr uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_uint64".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_uint64" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_int128):
  proc kuzu_value_get_int128*(value: ptr kuzu_value_570425816;
                              out_result: ptr kuzu_int128_t_570425856): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_int128".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_int128" &
        " already exists, not redeclaring")
when not declared(kuzu_int128_t_from_string):
  proc kuzu_int128_t_from_string*(str: cstring; out_result: ptr kuzu_int128_t_570425856): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_int128_t_from_string".}
else:
  static :
    hint("Declaration of " & "kuzu_int128_t_from_string" &
        " already exists, not redeclaring")
when not declared(kuzu_int128_t_to_string):
  proc kuzu_int128_t_to_string*(val: kuzu_int128_t_570425856;
                                out_result: ptr cstring): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_int128_t_to_string".}
else:
  static :
    hint("Declaration of " & "kuzu_int128_t_to_string" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_float):
  proc kuzu_value_get_float*(value: ptr kuzu_value_570425816;
                             out_result: ptr cfloat): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_float".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_float" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_double):
  proc kuzu_value_get_double*(value: ptr kuzu_value_570425816;
                              out_result: ptr cdouble): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_double".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_double" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_internal_id):
  proc kuzu_value_get_internal_id*(value: ptr kuzu_value_570425816;
                                   out_result: ptr kuzu_internal_id_t_570425820): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_internal_id".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_internal_id" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_date):
  proc kuzu_value_get_date*(value: ptr kuzu_value_570425816;
                            out_result: ptr kuzu_date_t_570425824): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_date".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_date" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_timestamp):
  proc kuzu_value_get_timestamp*(value: ptr kuzu_value_570425816;
                                 out_result: ptr kuzu_timestamp_t_570425844): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_timestamp".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_timestamp" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_timestamp_ns):
  proc kuzu_value_get_timestamp_ns*(value: ptr kuzu_value_570425816;
                                    out_result: ptr kuzu_timestamp_ns_t_570425828): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_timestamp_ns".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_timestamp_ns" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_timestamp_ms):
  proc kuzu_value_get_timestamp_ms*(value: ptr kuzu_value_570425816;
                                    out_result: ptr kuzu_timestamp_ms_t_570425832): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_timestamp_ms".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_timestamp_ms" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_timestamp_sec):
  proc kuzu_value_get_timestamp_sec*(value: ptr kuzu_value_570425816;
                                     out_result: ptr kuzu_timestamp_sec_t_570425836): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_timestamp_sec".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_timestamp_sec" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_timestamp_tz):
  proc kuzu_value_get_timestamp_tz*(value: ptr kuzu_value_570425816;
                                    out_result: ptr kuzu_timestamp_tz_t_570425840): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_timestamp_tz".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_timestamp_tz" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_interval):
  proc kuzu_value_get_interval*(value: ptr kuzu_value_570425816;
                                out_result: ptr kuzu_interval_t_570425848): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_interval".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_interval" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_decimal_as_string):
  proc kuzu_value_get_decimal_as_string*(value: ptr kuzu_value_570425816;
      out_result: ptr cstring): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_value_get_decimal_as_string".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_decimal_as_string" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_string):
  proc kuzu_value_get_string*(value: ptr kuzu_value_570425816;
                              out_result: ptr cstring): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_string".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_string" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_blob):
  proc kuzu_value_get_blob*(value: ptr kuzu_value_570425816;
                            out_result: ptr ptr uint8): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_blob".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_blob" &
        " already exists, not redeclaring")
when not declared(kuzu_value_get_uuid):
  proc kuzu_value_get_uuid*(value: ptr kuzu_value_570425816;
                            out_result: ptr cstring): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_value_get_uuid".}
else:
  static :
    hint("Declaration of " & "kuzu_value_get_uuid" &
        " already exists, not redeclaring")
when not declared(kuzu_value_to_string):
  proc kuzu_value_to_string*(value: ptr kuzu_value_570425816): cstring {.cdecl,
      importc: "kuzu_value_to_string".}
else:
  static :
    hint("Declaration of " & "kuzu_value_to_string" &
        " already exists, not redeclaring")
when not declared(kuzu_node_val_get_id_val):
  proc kuzu_node_val_get_id_val*(node_val: ptr kuzu_value_570425816;
                                 out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_node_val_get_id_val".}
else:
  static :
    hint("Declaration of " & "kuzu_node_val_get_id_val" &
        " already exists, not redeclaring")
when not declared(kuzu_node_val_get_label_val):
  proc kuzu_node_val_get_label_val*(node_val: ptr kuzu_value_570425816;
                                    out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_node_val_get_label_val".}
else:
  static :
    hint("Declaration of " & "kuzu_node_val_get_label_val" &
        " already exists, not redeclaring")
when not declared(kuzu_node_val_get_property_size):
  proc kuzu_node_val_get_property_size*(node_val: ptr kuzu_value_570425816;
                                        out_value: ptr uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_node_val_get_property_size".}
else:
  static :
    hint("Declaration of " & "kuzu_node_val_get_property_size" &
        " already exists, not redeclaring")
when not declared(kuzu_node_val_get_property_name_at):
  proc kuzu_node_val_get_property_name_at*(node_val: ptr kuzu_value_570425816;
      index: uint64; out_result: ptr cstring): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_node_val_get_property_name_at".}
else:
  static :
    hint("Declaration of " & "kuzu_node_val_get_property_name_at" &
        " already exists, not redeclaring")
when not declared(kuzu_node_val_get_property_value_at):
  proc kuzu_node_val_get_property_value_at*(node_val: ptr kuzu_value_570425816;
      index: uint64; out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_node_val_get_property_value_at".}
else:
  static :
    hint("Declaration of " & "kuzu_node_val_get_property_value_at" &
        " already exists, not redeclaring")
when not declared(kuzu_node_val_to_string):
  proc kuzu_node_val_to_string*(node_val: ptr kuzu_value_570425816;
                                out_result: ptr cstring): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_node_val_to_string".}
else:
  static :
    hint("Declaration of " & "kuzu_node_val_to_string" &
        " already exists, not redeclaring")
when not declared(kuzu_rel_val_get_src_id_val):
  proc kuzu_rel_val_get_src_id_val*(rel_val: ptr kuzu_value_570425816;
                                    out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_rel_val_get_src_id_val".}
else:
  static :
    hint("Declaration of " & "kuzu_rel_val_get_src_id_val" &
        " already exists, not redeclaring")
when not declared(kuzu_rel_val_get_dst_id_val):
  proc kuzu_rel_val_get_dst_id_val*(rel_val: ptr kuzu_value_570425816;
                                    out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_rel_val_get_dst_id_val".}
else:
  static :
    hint("Declaration of " & "kuzu_rel_val_get_dst_id_val" &
        " already exists, not redeclaring")
when not declared(kuzu_rel_val_get_label_val):
  proc kuzu_rel_val_get_label_val*(rel_val: ptr kuzu_value_570425816;
                                   out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_rel_val_get_label_val".}
else:
  static :
    hint("Declaration of " & "kuzu_rel_val_get_label_val" &
        " already exists, not redeclaring")
when not declared(kuzu_rel_val_get_property_size):
  proc kuzu_rel_val_get_property_size*(rel_val: ptr kuzu_value_570425816;
                                       out_value: ptr uint64): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_rel_val_get_property_size".}
else:
  static :
    hint("Declaration of " & "kuzu_rel_val_get_property_size" &
        " already exists, not redeclaring")
when not declared(kuzu_rel_val_get_property_name_at):
  proc kuzu_rel_val_get_property_name_at*(rel_val: ptr kuzu_value_570425816;
      index: uint64; out_result: ptr cstring): kuzu_state_570425864 {.cdecl,
      importc: "kuzu_rel_val_get_property_name_at".}
else:
  static :
    hint("Declaration of " & "kuzu_rel_val_get_property_name_at" &
        " already exists, not redeclaring")
when not declared(kuzu_rel_val_get_property_value_at):
  proc kuzu_rel_val_get_property_value_at*(rel_val: ptr kuzu_value_570425816;
      index: uint64; out_value: ptr kuzu_value_570425816): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_rel_val_get_property_value_at".}
else:
  static :
    hint("Declaration of " & "kuzu_rel_val_get_property_value_at" &
        " already exists, not redeclaring")
when not declared(kuzu_rel_val_to_string):
  proc kuzu_rel_val_to_string*(rel_val: ptr kuzu_value_570425816;
                               out_result: ptr cstring): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_rel_val_to_string".}
else:
  static :
    hint("Declaration of " & "kuzu_rel_val_to_string" &
        " already exists, not redeclaring")
when not declared(kuzu_destroy_string):
  proc kuzu_destroy_string*(str: cstring): void {.cdecl,
      importc: "kuzu_destroy_string".}
else:
  static :
    hint("Declaration of " & "kuzu_destroy_string" &
        " already exists, not redeclaring")
when not declared(kuzu_destroy_blob):
  proc kuzu_destroy_blob*(blob: ptr uint8): void {.cdecl,
      importc: "kuzu_destroy_blob".}
else:
  static :
    hint("Declaration of " & "kuzu_destroy_blob" &
        " already exists, not redeclaring")
when not declared(kuzu_query_summary_destroy):
  proc kuzu_query_summary_destroy*(query_summary: ptr kuzu_query_summary_570425852): void {.
      cdecl, importc: "kuzu_query_summary_destroy".}
else:
  static :
    hint("Declaration of " & "kuzu_query_summary_destroy" &
        " already exists, not redeclaring")
when not declared(kuzu_query_summary_get_compiling_time):
  proc kuzu_query_summary_get_compiling_time*(
      query_summary: ptr kuzu_query_summary_570425852): cdouble {.cdecl,
      importc: "kuzu_query_summary_get_compiling_time".}
else:
  static :
    hint("Declaration of " & "kuzu_query_summary_get_compiling_time" &
        " already exists, not redeclaring")
when not declared(kuzu_query_summary_get_execution_time):
  proc kuzu_query_summary_get_execution_time*(
      query_summary: ptr kuzu_query_summary_570425852): cdouble {.cdecl,
      importc: "kuzu_query_summary_get_execution_time".}
else:
  static :
    hint("Declaration of " & "kuzu_query_summary_get_execution_time" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_ns_to_tm):
  proc kuzu_timestamp_ns_to_tm*(timestamp: kuzu_timestamp_ns_t_570425828;
                                out_result: ptr struct_tm_570425866): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_ns_to_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_ns_to_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_ms_to_tm):
  proc kuzu_timestamp_ms_to_tm*(timestamp: kuzu_timestamp_ms_t_570425832;
                                out_result: ptr struct_tm_570425866): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_ms_to_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_ms_to_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_sec_to_tm):
  proc kuzu_timestamp_sec_to_tm*(timestamp: kuzu_timestamp_sec_t_570425836;
                                 out_result: ptr struct_tm_570425866): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_sec_to_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_sec_to_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_tz_to_tm):
  proc kuzu_timestamp_tz_to_tm*(timestamp: kuzu_timestamp_tz_t_570425840;
                                out_result: ptr struct_tm_570425866): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_tz_to_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_tz_to_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_to_tm):
  proc kuzu_timestamp_to_tm*(timestamp: kuzu_timestamp_t_570425844;
                             out_result: ptr struct_tm_570425866): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_to_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_to_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_ns_from_tm):
  proc kuzu_timestamp_ns_from_tm*(tm: struct_tm_570425866;
                                  out_result: ptr kuzu_timestamp_ns_t_570425828): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_ns_from_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_ns_from_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_ms_from_tm):
  proc kuzu_timestamp_ms_from_tm*(tm: struct_tm_570425866;
                                  out_result: ptr kuzu_timestamp_ms_t_570425832): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_ms_from_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_ms_from_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_sec_from_tm):
  proc kuzu_timestamp_sec_from_tm*(tm: struct_tm_570425866;
                                   out_result: ptr kuzu_timestamp_sec_t_570425836): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_sec_from_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_sec_from_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_tz_from_tm):
  proc kuzu_timestamp_tz_from_tm*(tm: struct_tm_570425866;
                                  out_result: ptr kuzu_timestamp_tz_t_570425840): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_tz_from_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_tz_from_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_timestamp_from_tm):
  proc kuzu_timestamp_from_tm*(tm: struct_tm_570425866;
                               out_result: ptr kuzu_timestamp_t_570425844): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_timestamp_from_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_timestamp_from_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_date_to_string):
  proc kuzu_date_to_string*(date: kuzu_date_t_570425824; out_result: ptr cstring): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_date_to_string".}
else:
  static :
    hint("Declaration of " & "kuzu_date_to_string" &
        " already exists, not redeclaring")
when not declared(kuzu_date_from_string):
  proc kuzu_date_from_string*(str: cstring; out_result: ptr kuzu_date_t_570425824): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_date_from_string".}
else:
  static :
    hint("Declaration of " & "kuzu_date_from_string" &
        " already exists, not redeclaring")
when not declared(kuzu_date_to_tm):
  proc kuzu_date_to_tm*(date: kuzu_date_t_570425824; out_result: ptr struct_tm_570425866): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_date_to_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_date_to_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_date_from_tm):
  proc kuzu_date_from_tm*(tm: struct_tm_570425866; out_result: ptr kuzu_date_t_570425824): kuzu_state_570425864 {.
      cdecl, importc: "kuzu_date_from_tm".}
else:
  static :
    hint("Declaration of " & "kuzu_date_from_tm" &
        " already exists, not redeclaring")
when not declared(kuzu_interval_to_difftime):
  proc kuzu_interval_to_difftime*(interval: kuzu_interval_t_570425848;
                                  out_result: ptr cdouble): void {.cdecl,
      importc: "kuzu_interval_to_difftime".}
else:
  static :
    hint("Declaration of " & "kuzu_interval_to_difftime" &
        " already exists, not redeclaring")
when not declared(kuzu_interval_from_difftime):
  proc kuzu_interval_from_difftime*(difftime: cdouble;
                                    out_result: ptr kuzu_interval_t_570425848): void {.
      cdecl, importc: "kuzu_interval_from_difftime".}
else:
  static :
    hint("Declaration of " & "kuzu_interval_from_difftime" &
        " already exists, not redeclaring")
when not declared(kuzu_get_version):
  proc kuzu_get_version*(): cstring {.cdecl, importc: "kuzu_get_version".}
else:
  static :
    hint("Declaration of " & "kuzu_get_version" &
        " already exists, not redeclaring")
when not declared(kuzu_get_storage_version):
  proc kuzu_get_storage_version*(): uint64 {.cdecl,
      importc: "kuzu_get_storage_version".}
else:
  static :
    hint("Declaration of " & "kuzu_get_storage_version" &
        " already exists, not redeclaring")