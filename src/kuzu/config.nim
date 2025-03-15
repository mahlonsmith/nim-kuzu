# vim: set et sta sw=4 ts=4 :

proc kuzuConfig*(
    buffer_pool_size     = KUZU_DEFAULT_CONFIG.buffer_pool_size,
    max_num_threads      = KUZU_DEFAULT_CONFIG.max_num_threads,
    enable_compression   = KUZU_DEFAULT_CONFIG.enable_compression,
    read_only            = KUZU_DEFAULT_CONFIG.read_only,
    max_db_size          = KUZU_DEFAULT_CONFIG.max_db_size,
    auto_checkpoint      = KUZU_DEFAULT_CONFIG.auto_checkpoint,
    checkpoint_threshold = KUZU_DEFAULT_CONFIG.checkpoint_threshold
    ): kuzu_system_config =
    ## Returns a new kuzu database configuration object.

    return kuzu_system_config(
        buffer_pool_size:     buffer_pool_size,
        max_num_threads:      max_num_threads,
        enable_compression:   enable_compression,
        read_only:            read_only,
        max_db_size:          max_db_size,
        auto_checkpoint:      auto_checkpoint,
        checkpoint_threshold: checkpoint_threshold
    )


