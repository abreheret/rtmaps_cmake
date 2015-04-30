#link_directories(${OpenCV_LIB_DIR})
include_directories( ../src )
add_library( rtmaps_test SHARED rtmaps_test.cpp )
target_link_libraries(rtmaps_test rtmaps_pck rtmaps_cmake)
configure_rtmaps(rtmaps_test)

if(ENABLE_SOLUTION_FOLDERS)
  set_target_properties(rtmaps_test PROPERTIES FOLDER "rtmaps_package")
endif()