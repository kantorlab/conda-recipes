NCBI_OUTDIR=$SRC_DIR/ncbi-outdir

pushd ngs-sdk
./configure \
    --prefix=$PREFIX \
    --build-prefix=$NCBI_OUTDIR \
    CXX=$CXX
make
make install
make test
popd
