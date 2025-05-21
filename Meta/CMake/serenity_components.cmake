#
# Target properties and functions for optionally building libraries and applications
#

define_property(TARGET PROPERTY DENLAB_COMPONENT_NAME BRIEF_DOCS "DenLabOS component name" FULL_DOCS "-")
define_property(TARGET PROPERTY DENLAB_COMPONENT_DESCRIPTION BRIEF_DOCS "DenLabOS component description" FULL_DOCS "-")
define_property(TARGET PROPERTY DENLAB_COMPONENT_RECOMMENDED BRIEF_DOCS "DenLabOS component recommended (flag)" FULL_DOCS "-")
define_property(TARGET PROPERTY DENLAB_COMPONENT_REQUIRED BRIEF_DOCS "DenLabOS component required (flag)" FULL_DOCS "-")
define_property(TARGET PROPERTY DENLAB_COMPONENT_DEPENDS BRIEF_DOCS "DenLabOS component dependencies" FULL_DOCS "-")
define_property(TARGET PROPERTY DENLAB_SKIP_BUILD BRIEF_DOCS "DenLabOS component target should skip build (flag)" FULL_DOCS "-")

function(denlab_component name)
    cmake_parse_arguments(PARSE_ARGV 1 DENLAB_COMPONENT "RECOMMENDED;REQUIRED" "DESCRIPTION" "TARGETS;DEPENDS")
    string(TOUPPER "${name}" NAME_UPPER)
    option("BUILD_${NAME_UPPER}" "Build ${name}" "${DENLAB_COMPONENT_RECOMMENDED}")
    add_custom_target("Component${name}")
    set_target_properties(
        "Component${name}" PROPERTIES
        DENLAB_COMPONENT_NAME        "${name}"
        DENLAB_COMPONENT_DESCRIPTION "${DENLAB_COMPONENT_DESCRIPTION}"
        DENLAB_COMPONENT_RECOMMENDED "${DENLAB_COMPONENT_RECOMMENDED}"
        DENLAB_COMPONENT_REQUIRED    "${DENLAB_COMPONENT_REQUIRED}"
        DENLAB_COMPONENT_DEPENDS     "${DENLAB_COMPONENT_DEPENDS}"
    )
    set(static_should_disable_target TRUE)
    if(BUILD_EVERYTHING OR "${BUILD_${NAME_UPPER}}" OR DENLAB_COMPONENT_REQUIRED)
        set(static_should_disable_target FALSE)
    endif()

    set(should_disable_target $<BOOL:${static_should_disable_target}>)
    if(NOT "${DENLAB_COMPONENT_TARGETS}" STREQUAL "") # note: one component is /bin/false, which makes this tricky
        foreach(target IN LISTS DENLAB_COMPONENT_TARGETS)
            add_dependencies("Component${name}" "${target}")
            set(should_disable_target $<OR:${should_disable_target},$<BOOL:$<TARGET_PROPERTY:${target},DENLAB_SKIP_BUILD>>>)
        endforeach()
    endif()
    set_target_properties("Component${name}" PROPERTIES EXCLUDE_FROM_ALL ${should_disable_target})
    foreach(dependency IN LISTS DENLAB_COMPONENT_DEPENDS)
        add_dependencies("Component${name}" "Component${dependency}")
    endforeach()
endfunction()

function(export_components_helper file_name current_dir)
    get_property(sub_dirs DIRECTORY "${current_dir}" PROPERTY SUBDIRECTORIES)
    foreach(sub_dir IN LISTS sub_dirs)
        export_components_helper("${file_name}" "${sub_dir}")
    endforeach()

    get_property(targets DIRECTORY "${current_dir}" PROPERTY BUILDSYSTEM_TARGETS)
    foreach(target IN LISTS targets)
        get_target_property(type "${target}" TYPE)
        if (type STREQUAL "INTERFACE_LIBRARY")
            continue() # Custom properties are not allowed to be set on INTERFACE libraries
        endif()
        get_target_property(component_name "${target}" DENLAB_COMPONENT_NAME)
        if(NOT "${component_name}" STREQUAL "" AND NOT "${component_name}" STREQUAL "component_name-NOTFOUND")
            get_target_property(component_name        "${target}" DENLAB_COMPONENT_NAME)
            get_target_property(component_description "${target}" DENLAB_COMPONENT_DESCRIPTION)
            get_target_property(component_recommended "${target}" DENLAB_COMPONENT_RECOMMENDED)
            get_target_property(component_required    "${target}" DENLAB_COMPONENT_REQUIRED)
            get_target_property(component_depends     "${target}" DENLAB_COMPONENT_DEPENDS)
            file(APPEND "${file_name}" "[${component_name}]\n")
            file(APPEND "${file_name}" "description=${component_description}\n")
            if(component_recommended)
                file(APPEND "${file_name}" "recommended=1\n")
            else()
                file(APPEND "${file_name}" "recommended=0\n")
            endif()
            if(component_required)
                file(APPEND "${file_name}" "required=1\n")
            else()
                file(APPEND "${file_name}" "required=0\n")
            endif()
            string(TOUPPER "${component_name}" component_name_upper)
            if("${BUILD_${component_name_upper}}")
                file(APPEND "${file_name}" "user_selected=1\n")
            else()
                file(APPEND "${file_name}" "user_selected=0\n")
            endif()

            file(APPEND "${file_name}" "depends=${component_depends}\n")
            file(APPEND "${file_name}" "\n")
        endif()
    endforeach()
endfunction()

function(export_components file_name)
    file(WRITE "${file_name}" "[Global]\n")
    if(BUILD_EVERYTHING)
        file(APPEND "${file_name}" "build_everything=1\n")
    else()
        file(APPEND "${file_name}" "build_everything=0\n")
    endif()
    file(APPEND "${file_name}" "\n")
    export_components_helper("${file_name}" "${CMAKE_CURRENT_SOURCE_DIR}")
endfunction()
