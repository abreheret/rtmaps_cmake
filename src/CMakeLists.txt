#link_directories(${OpenCV_LIB_DIR} )
include_directories( . ) #${JPEG_INCLUDE} )
					 
#------------------------------------------------------------------------------
file( GLOB rtmaps_cmake_src *.cpp ) 
file( GLOB rtmaps_cmake_hdr *.hpp ) 
add_library( rtmaps_cmake STATIC ${rtmaps_cmake_src} ${rtmaps_cmake_hdr} ) #${libjpeg}
#target_link_libraries(rtmaps_cmake libdepend)
#add_custom_command(TARGET mlda PRE_BUILD COMMAND 
#	               $ENV{TORTOISE_INSTDIR}/bin/SubWCRev.exe
#	               ${CMAKE_CURRENT_SOURCE_DIR}
#	               "${CMAKE_CURRENT_SOURCE_DIR}/../version_template.h"
#	               "${CMAKE_CURRENT_SOURCE_DIR}/../mlda_version.h")

#------------------------------------------------------------------------------
if(ENABLE_SOLUTION_FOLDERS)
  set_target_properties(rtmaps_cmake PROPERTIES FOLDER "myfolder")
endif()

