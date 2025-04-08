@echo off
if "%~1"=="" (
    echo ^(v1.0.0^) Usage^: cnew ^<project_name^>
    exit /b 1
)

set "NAME=%~1"
set "DIR=%cd%\%NAME%"

mkdir "%DIR%\src" 2>nul
mkdir "%DIR%\build" 2>nul

> "%DIR%\.gitignore" echo /build

> "%DIR%\src\main.c" (
    echo #include ^<stdio.h^>
    echo.
    echo int main^(^) {
    echo     printf^("Hello, World!\n"^);
    echo     return 0;
    echo }
)

> "%DIR%\CMakeLists.txt" (
    echo cmake_minimum_required^(VERSION 3.10^)
    echo.
    echo project^(%NAME% VERSION 1.0 LANGUAGES C^)
    echo.
    echo set^(CMAKE_BINARY_DIR $^{CMAKE_SOURCE_DIR^}/build^)
    echo.
    echo file^(GLOB SOURCES "src/*.c"^)
    echo.
    echo add_executable^(%NAME% ${SOURCES}^)
)

echo Project '%NAME%' created in %DIR%
echo You can now build your project using CMake!