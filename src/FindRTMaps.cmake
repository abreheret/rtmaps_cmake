
if(RTMAPS_VERSION MATCHES "RTMAPS_4")
	SET(RTMAPS_DIR $ENV{RTMAPS_SDKDIR})
	SET(RTMAPS_LINK_FLAGS "/INCLUDE:_MAPSPckInit /INCLUDE:_MAPSGetModulesDefStruct")
else()
	SET(RTMAPS_DIR $ENV{RTMAPS_INSTDIR})
	if (NOT DEFINED RTMAPS_VERSION)
		set(RTMAPS_VERSION RTMAPS_3)
	endif()
endif()
find_path( RTMAPS_INCLUDE maps.hpp PATHS ${RTMAPS_DIR}/include )
if( ${RTMAPS_INCLUDE} STREQUAL "RTMAPS_INCLUDE-NOTFOUND" ) 
	message( FATAL_ERROR "FATAL_ERROR : RTMaps is not found ! ")
else ()
	message(STATUS "Found RTMaps in ${RTMAPS_INCLUDE}")
endif()

if(WIN32)
	if(MSVC) 
		if(MSVC80)
			find_library (RTMAPS_LIBRARY rtmaps_pck.lib PATHS ${RTMAPS_DIR}/lib/vc.net2005)
			SET(RTMAPS_LIB_DIR ${RTMAPS_DIR}/lib/vc.net2005)
		elseif(MSVC90)
			find_library (RTMAPS_LIBRARY rtmaps_pck.lib PATHS ${RTMAPS_DIR}/lib/vc.net2008)
			SET(RTMAPS_LIB_DIR ${RTMAPS_DIR}/lib/vc.net2008)
		elseif(MSVC10)
			find_library (RTMAPS_LIBRARY rtmaps_pck.lib PATHS ${RTMAPS_DIR}/lib/vc.net2010)
			SET(RTMAPS_LIB_DIR ${RTMAPS_DIR}/lib/vc.net2010)
		elseif(MSVC11)
			find_library (RTMAPS_LIBRARY rtmaps_pck.lib PATHS ${RTMAPS_DIR}/lib/vc.net2012)
			SET(RTMAPS_LIB_DIR ${RTMAPS_DIR}/lib/vc.net2012)
		else(MSVC80)
			message( FATAL_ERROR " msvc was not found !")
		endif (MSVC80)
	else(MSVC) 
		message( FATAL_ERROR "not link lib RTMaps without msvc ! ")
	endif(MSVC)
else(WIN32) 	
	SET(RTMAPS_LIB_DIR ${RTMAPS_DIR}/lib)
endif(WIN32)


message( STATUS "RTMAPS_INCLUDE = ${RTMAPS_INCLUDE}")
message( STATUS "RTMAPS_LIBRARY = ${RTMAPS_LIB_DIR}")

if(NOT RTMAPS_INCLUDE MATCHES NOTFOUND)
  if(NOT RTMAPS_LIBRARY MATCHES NOTFOUND)
    set( RTMAPS_FOUND TRUE )
    include_directories( ${RTMAPS_INCLUDE} )
    link_directories( ${RTMAPS_LIB_DIR} )
  endif( )
endif( )

if(NOT DEFINED RTMAPS_FOUND)
  message( STATUS "RTMaps was not found (required)!")
else ( )
  message( STATUS "RTMaps was found here ${RTMAPS_DIR}")
endif( )

macro(configure_rtmaps name_pck )
	SET_TARGET_PROPERTIES(${name_pck} PROPERTIES SUFFIX ".pck")
	SET_TARGET_PROPERTIES(${name_pck} PROPERTIES LINK_FLAGS "${LINK_FLAGS} ${RTMAPS_LINK_FLAGS}")
	if(RTMAPS_VERSION MATCHES "RTMAPS_4")		
		add_custom_command(TARGET ${name_pck} POST_BUILD COMMAND  $ENV{RTMAPS_SDKDIR}/bin/rtmaps_package_sign.exe -platform Win32 -package $<TARGET_FILE:${name_pck}> -info $<TARGET_FILE:${name_pck}>.pckinfo)
	else()
		add_custom_command(TARGET ${name_pck} POST_BUILD COMMAND  $ENV{RTMAPS_INSTDIR}/bin/rtmaps_license_validation.exe $<TARGET_FILE:${name_pck}> )	
	endif()
endmacro()