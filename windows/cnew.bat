@echo off
setlocal

if "%1"=="" (
    echo (v1.0.0) Usage: cnew <project_name>
    exit /b 1
)

set PROJECT_NAME=%1
set PROJECT_DIR=%cd%\%PROJECT_NAME%

mkdir "%PROJECT_DIR%\src"
mkdir "%PROJECT_DIR%\build"

echo /build > "%PROJECT_DIR%\.gitignore"

echo #include <stdio.h> > "%PROJECT_DIR%\src\main.c"
echo. >> "%PROJECT_DIR%\src\main.c"
echo int main() { >> "%PROJECT_DIR%\src\main.c"
echo     printf("Hello, World!^\\n"); >> "%PROJECT_DIR%\src\main.c"
echo     return 0; >> "%PROJECT_DIR%\src\main.c"
echo } >> "%PROJECT_DIR%\src\main.c"

echo cmake_minimum_required(VERSION 3.10) > "%PROJECT_DIR%\CMakeLists.txt"
echo. >> "%PROJECT_DIR%\CMakeLists.txt"
echo project(%PROJECT_NAME% VERSION 1.0 LANGUAGES C) >> "%PROJECT_DIR%\CMakeLists.txt"
echo. >> "%PROJECT_DIR%\CMakeLists.txt"
echo set(CMAKE_BINARY_DIR \${CMAKE_SOURCE_DIR}/build) >> "%PROJECT_DIR%\CMakeLists.txt"
echo. >> "%PROJECT_DIR%\CMakeLists.txt"
echo file(GLOB SOURCES "src/*.c") >> "%PROJECT_DIR%\CMakeLists.txt"
echo. >> "%PROJECT_DIR%\CMakeLists.txt"
echo add_executable(%PROJECT_NAME% \${SOURCES}) >> "%PROJECT_DIR%\CMakeLists.txt"

echo Project '%PROJECT_NAME%' created in %PROJECT_DIR%
echo You can now build your project using CMake!

endlocal