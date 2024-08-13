#!/bin/bash
cd /usr/src/app

# Create build directory if it doesn't exist
mkdir -p build
cd build

# Configure and build the project
cmake ..
make

if [ $? -eq 0 ]; then
    ./api
else
    echo "Build failed. Please check your code."
    /bin/bash
fi