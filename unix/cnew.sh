#!/bin/bash

if [ -z "$1" ]; then
    echo "(v1.0.0) Usage: cnew <project_name>"
    exit 1
fi

PROJECT_NAME=$1
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

mkdir -p "$PROJECT_DIR/src"
mkdir -p "$PROJECT_DIR/build"

cat <<EOF > "$PROJECT_DIR/.gitignore"
/build
EOF

cat <<EOF > "$PROJECT_DIR/src/main.c"
#include <stdio.h>

int main() {
    printf("Hello, World!\\n");
    return 0;
}
EOF

cat <<EOF > "$PROJECT_DIR/CMakeLists.txt"
cmake_minimum_required(VERSION 3.10)

project($PROJECT_NAME VERSION 1.0 LANGUAGES C)

set(CMAKE_BINARY_DIR \${CMAKE_SOURCE_DIR}/build)

file(GLOB SOURCES "src/*.c")

add_executable($PROJECT_NAME \${SOURCES})
EOF

echo "Project '$PROJECT_NAME' created in $PROJECT_DIR"
echo "You can now build your project using CMake!"