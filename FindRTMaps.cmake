
if(RTMAPS_VERSION MATCHES "RTMAPS_4")
	SET(RTMAPS_DIR $ENV{RTMAPS_SDKDIR})
	SET(RTMAPS_LINK_FLAGS "/INCLUDE:_MAPSPckInit /INCLUDE:_MAPSGetModulesDefStruct /NODEFAULTLIB:MSVCRTD")
else()
	SET(RTMAPS_DIR $ENV{RTMAPS_INSTDIR})
	if (NOT DEFINED RTMAPS_VERSION)
		set(RTMAPS_VERSION RTMAPS_3)
	endif()
endif()
find_path( RTMAPS_INCLUDE maps.hpp PATHS ${RTMAPS_DIR}/include )

message(RTMAPS_INCLUDE=${RTMAPS_INCLUDE})

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

#message( STATUS "-----------------------------------")
#message( STATUS "RTMAPS_INCLUDE = "${RTMAPS_INCLUDE})
#message( STATUS "RTMAPS_LIBRARY  = "${RTMAPS_LIB_DIR})
#message( STATUS "-----------------------------------")

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
