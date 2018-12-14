#!/bin/bash
set -e
export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-std=c++17/-std=c++98/')
cmake . -DCMAKE_INSTALL_PREFIX=$PREFIX -DINSTALL_PREFIX=$PREFIX
make
make install
