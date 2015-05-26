

## How to use FindRTMaps.cmake : 


Here is a simple example of use to create your RTMaps project with CMakeLists.txt :

```cmake

include(FindRTMaps.cmake)
add_library( my_module SHARED my_module.cpp my_module.h )
target_link_libraries(my_module rtmaps_pck)
configure_rtmaps(my_module)

```


To test the sample launch build_x86_vc10.bat or enter these command lines : 
	
	> mkdir x86_vc10
	> cd x86_vc10
	> cmake -G"Visual Studio 10" ../src
	-- The C compiler identification is MSVC 16.0.40219.1
	-- The CXX compiler identification is MSVC 16.0.40219.1
	-- Check for working C compiler using: Visual Studio 10
	-- Check for working C compiler using: Visual Studio 10 -- works
	-- Detecting C compiler ABI info
	-- Detecting C compiler ABI info - done
	-- Check for working CXX compiler using: Visual Studio 10
	-- Check for working CXX compiler using: Visual Studio 10 -- works
	-- Detecting CXX compiler ABI info
	-- Detecting CXX compiler ABI info - done
	-- Found RTMaps in C:/Program Files (x86)/Intempora/RTMaps 4/include
	-- RTMAPS_INCLUDE = C:/Program Files (x86)/Intempora/RTMaps 4/include
	-- RTMAPS_LIBRARY = C:\Program Files (x86)\Intempora\RTMaps 4/lib/vc.net2010
	-- RTMaps was found here C:\Program Files (x86)\Intempora\RTMaps 4
	-- Configuring done
	-- Generating done
	-- Build files have been written to: A:/git/rtmaps_cmake/x86_vc10



![](logo/RTMaps_intempora.png)