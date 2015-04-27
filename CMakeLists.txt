project(rtmaps_cmake)
cmake_minimum_required(VERSION 2.8)

include(FindRTMaps.cmake)
#------------------------------------------------------------------------------
if(CMAKE_BUILD_TOOL MATCHES "(msdev|devenv|nmake|MSBuild)")
	add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif()

if(APPLE)
	add_definitions(-DHAVE_XLOCALE_H)
endif(APPLE)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

#set(OpenCV_DIR "X:/DAR_EXTL/opencv-2.4.10/build")
#set(OpenCV_DIR "C:/OpenCV/OpenCV2.4.10/opencv/build")

set(ENABLE_SOLUTION_FOLDERS "TRUE")

if(ENABLE_SOLUTION_FOLDERS)
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)
  set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "!CMakeTargets")
endif()

#find_path( JPEG_INCLUDE libjpeg.h PATHS "C:/mylib/libjpeg" "/third_party/libjpeg" )
#find_library(libjpeg NAMES libjpeg PATHS "usr/lib/libjpeg" "C:/mylib/libjpeg" "/third_party/libjpeg")

add_subdirectory(src)
add_subdirectory(app_rtmaps)
