# vim: set et sta sw=4 ts=4 :

const KUZU_VERSION*             = "0.1.0"
const KUZU_EXPECTED_LIBVERSION* = "0.8.2"

let KUZU_LIBVERSION*      = kuzu_get_version()
let KUZU_STORAGE_VERSION* = kuzu_get_storage_version()
let KUZU_DEFAULT_CONFIG*  = kuzu_default_system_config()


