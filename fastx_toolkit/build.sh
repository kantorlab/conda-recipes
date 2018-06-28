#!/bin/bash
export CXXFLAGS="$CXXFLAGS -Wimplicit-fallthrough=0"
./configure --prefix="$PREFIX"
make
make install
