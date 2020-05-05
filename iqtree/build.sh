#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"
export CPATH=${PREFIX}/include

mkdir build
cd build

$BUILD_PREFIX/bin/cmake -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX -DIQTREE_FLAGS=omp ..
make
make install
