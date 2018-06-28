#!/bin/bash
set -e
mkdir -p $PREFIX/bin
cp -R bin/blastn bin/makeblastdb $PREFIX/bin/
