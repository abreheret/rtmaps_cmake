project(rtmaps_cmake)
cmake_minimum_required(VERSION 2.8)
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)
set(RTMAPS_VERSION "RTMAPS_4")
include(FindRTMaps.cmake)

add_library( my_module SHARED my_module.cpp)
target_link_libraries(my_module rtmaps_pck)
configure_rtmaps(my_module)

include_directories(my_lib)
add_library( my_lib my_lib/my_lib.cpp my_lib/my_lib.hpp)
add_library( my_module_with_my_lib SHARED my_module_with_my_lib.cpp)
target_link_libraries(my_module_with_my_lib rtmaps_pck my_lib)
configure_rtmaps(my_module_with_my_lib)
