# Testing:
# enable dashboard scripting

if(CMAKE_Fortran_COMPILER_ID MATCHES "unknown")
    STRING(REGEX REPLACE ".*/([^ ])" "\\1" fcompilername "${CMAKE_Fortran_COMPILER}" )
    SET(BUILDNAME "${osname}-${cpu}-${fcompilername}")
else()
    SET(BUILDNAME "${osname}-${cpu}-${CMAKE_Fortran_COMPILER_ID}")
endif()

if (MADX_FORCE_32 AND NOT ${CMAKE_SIZEOF_VOID_P} EQUAL 4)
    set(BUILDNAME "${BUILDNAME}-32")
endif ()
if(BUILD_TESTING)
    SET(BUILDNAME "${BUILDNAME}" CACHE STRING "Name of build on the dashboard")
    MARK_AS_ADVANCED(BUILDNAME)
endif()
# End of defining build name...

enable_testing()
include(CTest)

