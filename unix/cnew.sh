#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: cnew <project_name>"
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

cat <<EOF > "$PROJECT_DIR/Makefile"
BUILD_DIR := build
EXECUTABLE := \$(BUILD_DIR)/$PROJECT_NAME
CC := gcc
CFLAGS := -O3 -fvisibility=hidden
SRC := \$(wildcard src/*.c)

\$(BUILD_DIR): 
	@mkdir -p \$(BUILD_DIR)

compile: \$(BUILD_DIR)
	@\$(CC) \$(SRC) -o \$(EXECUTABLE) \$(CFLAGS)

default: compile
	@./\$(EXECUTABLE)
EOF

echo "Project '$PROJECT_NAME' created in $PROJECT_DIR"