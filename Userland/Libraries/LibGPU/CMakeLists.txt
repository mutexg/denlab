set(SOURCES
    Driver.cpp
    Image.cpp
)

denlab_lib(LibGPU gpu)
target_link_libraries(LibGPU PRIVATE ${CMAKE_DL_LIBS})

add_dependencies(LibGPU LibSoftGPU)

if (DENLABOS)
    add_dependencies(LibGPU LibVirtGPU)
endif()
