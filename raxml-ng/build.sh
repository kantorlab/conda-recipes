#!/bin/bash
set -e
mkdir build_pthreads
cd build_pthreads
cmake ..
make
install -d ${PREFIX}/bin
install ../bin/raxml-ng ${PREFIX}/bin
