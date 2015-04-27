set BUILD_DIR=vstudio2010win32-rtmaps4

mkdir %BUILD_DIR%
cd %BUILD_DIR%
cmake -DRTMAPS_VERSION=RTMAPS_4 -G"Visual Studio 10" ..

PAUSE