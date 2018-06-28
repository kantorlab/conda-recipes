#!/bin/bash

binaries="\
prinseq-lite.pl \
prinseq-graphs.pl \
prinseq-graphs-noPCA.pl \
"

mkdir -p $PREFIX/bin
for f in $binaries
do 
  sed -e 's|/usr/bin/perl|/usr/bin/env perl|' $SRC_DIR/$f >$PREFIX/bin/$f
  chmod +x $PREFIX/bin/$f
done
