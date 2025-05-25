#!/bin/bash

cd ../

# This script builds the package using debuild
# and moves all build artifacts to ./build-artifacts

# Clean up previous artifacts
rm -rf build-artifacts
mkdir -p build-artifacts

# Remove old artifacts from parent dir
rm -f ../*.deb ../*.changes ../*.build ../*.buildinfo ../*.dsc ../*.tar.*

# Build, automatically answer 'y' to 'continue anyway?' prompt
yes | dpkg-buildpackage -us -uc -b

# Move new artifacts to build-artifacts/
mv ../hello-debian* build-artifacts/ 2>/dev/null
mv ../*.deb build-artifacts/ 2>/dev/null
mv ../*.changes build-artifacts/ 2>/dev/null
mv ../*.build build-artifacts/ 2>/dev/null
mv ../*.buildinfo build-artifacts/ 2>/dev/null
mv ../*.dsc build-artifacts/ 2>/dev/null
mv ../*.tar.* build-artifacts/ 2>/dev/null