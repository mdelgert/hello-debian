#!/bin/bash

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "SCRIPT_DIR: $SCRIPT_DIR"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
echo "PROJECT_ROOT: $PROJECT_ROOT"

cd "$PROJECT_ROOT"
echo "PWD after cd PROJECT_ROOT: $(pwd)"

# This script builds the package using debuild
# and moves all build artifacts to ./build-artifacts

# Clean up previous artifacts
rm -rf build-artifacts
mkdir -p build-artifacts

echo "Contents of PROJECT_ROOT before build:"
ls -l "$PROJECT_ROOT"

echo "Contents of PARENT_DIR before build:"
PARENT_DIR="$(dirname "$PROJECT_ROOT")"
echo "PARENT_DIR: $PARENT_DIR"
ls -l "$PARENT_DIR"

delete_patterns=("*.deb" "*.ddeb" "*.changes" "*.build" "*.buildinfo" "*.dsc" "*.tar.*")
for pattern in "${delete_patterns[@]}"; do
    rm -f "$PARENT_DIR"/$pattern
done

# Build the package
cd "$PROJECT_ROOT"
dpkg-buildpackage -us -uc -b

echo "Contents of PROJECT_ROOT after build:"
ls -l "$PROJECT_ROOT"

echo "Contents of PARENT_DIR after build:"
ls -l "$PARENT_DIR"

# Move new artifacts from parent dir to build-artifacts/
shopt -s nullglob
for pattern in "${delete_patterns[@]}"; do
    for file in "$PARENT_DIR"/$pattern; do
        [ -e "$file" ] && mv "$file" build-artifacts/
    done
done
shopt -u nullglob

echo "Contents of build-artifacts after move:"
ls -l build-artifacts/