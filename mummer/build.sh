#!/bin/bash

set -e

BINARY=mummer
BINARY_HOME=$PREFIX/bin
MUMMER_HOME=$PREFIX/opt/mummer-$PKG_VERSION

mkdir -p $BINARY_HOME
mkdir -p $MUMMER_HOME

cp -R * $MUMMER_HOME/

cd $MUMMER_HOME

make CC="$CC" CXX="$CXX" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" all

# patch defined(%hash) out
# https://github.com/bioconda/bioconda-recipes/issues/1254
perl -i -pe 's/defined \(%/\(%/' mummerplot

binaries="\
combineMUMs \
delta-filter \
dnadiff \
exact-tandems \
mapview \
mgaps \
mummer \
mummerplot \
nucmer \
promer \
repeat-match \
run-mummer1 \
run-mummer3 \
show-aligns \
show-coords \
show-diff \
show-snps \
show-tiling \
"

for i in $binaries; do 
  chmod +x $MUMMER_HOME/$i
  ln -s "$MUMMER_HOME/$i" "$BINARY_HOME/$i"
done

rm ACKNOWLEDGEMENTS ChangeLog conda_build.sh COPYRIGHT INSTALL LICENSE Makefile README
rm -rf docs src

mkdir scripts.new
mv scripts/*.pm scripts.new/
rm -rf scripts
mv scripts.new scripts
