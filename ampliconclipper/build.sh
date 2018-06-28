#!/bin/bash
set -e
sed -i~ -e "s|g++|$CXX|" Makefile
make
mkdir -p $PREFIX/bin
cp AmpliconClipper $PREFIX/bin/
