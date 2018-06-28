#!/bin/bash
set -e
mkdir -p $PREFIX/bin
cp -R bin/blastdbcmd bin/blastdb_aliastool bin/makeblastdb $PREFIX/bin/
