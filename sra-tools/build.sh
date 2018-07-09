#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export CPATH=${PREFIX}/include

NCBI_OUTDIR=$SRC_DIR/ncbi-outdir

ln -s $CC $PREFIX/bin/gcc
ln -s $CXX $PREFIX/bin/g++

pushd ncbi-vdb
./configure \
    --prefix=$PREFIX \
    --build-prefix=$NCBI_OUTDIR \
    --with-ngs-sdk-prefix=$PREFIX
make
popd

pushd sra-tools
./configure \
    --prefix=$PREFIX \
    --build-prefix=$NCBI_OUTDIR \
    --with-ngs-sdk-prefix=$PREFIX \
    --with-ncbi-vdb-sources=../ncbi-vdb \
    --with-ncbi-vdb-build=$NCBI_OUTDIR
make
make install
popd

rm $PREFIX/bin/gcc
rm $PREFIX/bin/g++

cp sra-tools/LICENSE .
