@echo off

setlocal EnableDelayedExpansion


set PREFIX_PATH=!CD!/../glew-1.12.0;!CD!/../glfw-3.1.1.bin.WIN64/include/lib-vc2013


if not exist build mkdir build
if not exist build\Release mkdir build\Release
if not exist build\Debug mkdir build\Debug


rem copy !CD!\..\freeglut\bin\freeglut.dll !CD!\build\Release
copy !CD!\..\glew-1.12.0\bin\glew32.dll !CD!\build\Release
copy !CD!\..\glfw-3.1.1.bin.WIN64\lib-vc2013\glfw3.dll !CD!\build\Release

copy !CD!\..\glew-1.12.0\bin\glew32.dll !CD!\build\Debug
copy !CD!\..\glfw-3.1.1.bin.WIN64\lib-vc2013\glfw3.dll !CD!\build\Debug



cd build
cmake.exe -G "Visual Studio 12 2013 Win64" .. ^
  -DCMAKE_PREFIX_PATH="!PREFIX_PATH!" ^
  -DCMAKE_BUILD_TYPE=Debug ^
  %*