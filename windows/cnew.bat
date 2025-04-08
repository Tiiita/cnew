@echo off
setlocal EnableDelayedExpansion

if "%1"=="" (
    echo Usage: cnew ^<project_name^>
    exit /b 1
)

set "PROJECT_NAME=%1"
set "PROJECT_DIR=%CD%\%PROJECT_NAME%"

mkdir "%PROJECT_DIR%\src" 2>nul
mkdir "%PROJECT_DIR%\build" 2>nul

echo /build > "%PROJECT_DIR%\.gitignore"

echo #include ^<stdio.h^> > "%PROJECT_DIR%\src\main.c"
echo. >> "%PROJECT_DIR%\src\main.c"
echo int main() { >> "%PROJECT_DIR%\src\main.c"
echo     printf("Hello, World!\n"); >> "%PROJECT_DIR%\src\main.c"
echo     return 0; >> "%PROJECT_DIR%\src\main.c"
echo } >> "%PROJECT_DIR%\src\main.c"

echo BUILD_DIR := build > "%PROJECT_DIR%\Makefile"
echo EXECUTABLE := $(BUILD_DIR)/%PROJECT_NAME%.exe >> "%PROJECT_DIR%\Makefile"
echo CC := gcc >> "%PROJECT_DIR%\Makefile"
echo CFLAGS := -O3 -fvisibility=hidden >> "%PROJECT_DIR%\Makefile"
echo SRC := $(wildcard src/*.c) >> "%PROJECT_DIR%\Makefile"
echo. >> "%PROJECT_DIR%\Makefile"

echo default: compile >> "%PROJECT_DIR%\Makefile"
echo     @./$(EXECUTABLE) >> "%PROJECT_DIR%\Makefile"
echo. >> "%PROJECT_DIR%\Makefile"
echo compile: $(BUILD_DIR) >> "%PROJECT_DIR%\Makefile"
echo     @$(CC) $(SRC) -o $(EXECUTABLE) $(CFLAGS) >> "%PROJECT_DIR%\Makefile"
echo. >> "%PROJECT_DIR%\Makefile"

echo (v1) - Project '%PROJECT_NAME%' created in %PROJECT_DIR%