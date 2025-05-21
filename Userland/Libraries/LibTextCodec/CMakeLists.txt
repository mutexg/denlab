include(libtextcodec_generators)

set(SOURCES
    Decoder.cpp
    Encoder.cpp
)

generate_encoding_indexes()

set(GENERATED_SOURCES
    LookupTables.cpp
)

denlab_lib(LibTextCodec textcodec)
