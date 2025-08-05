#!/bin/bash
set -e

# First remove existing Redis++ installation
rm -rf /usr/local/lib/libredis++*
rm -rf /usr/local/include/sw

mkdir build
cd build

# Configure with libc++
cmake .. \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
    -DCMAKE_EXE_LINKER_FLAGS="-stdlib=libc++" \
    -DCMAKE_SHARED_LINKER_FLAGS="-stdlib=libc++" \
    -DREDIS_PLUS_PLUS_USE_TLS=ON \
    -DREDIS_PLUS_PLUS_CXX_STANDARD=20 \
    -DREDIS_PLUS_PLUS_BUILD_TEST=OFF

# Build and install
ninja -j8 install

