#!/bin/bash

set -e

mkdir -p $PREFIX/bin

make -f Makefile.SSE3.gcc CC="$CC"
cp raxmlHPC-SSE3 $PREFIX/bin/
make -f Makefile.SSE3.gcc clean

make -f Makefile.SSE3.PTHREADS.gcc CC="$CC"
cp raxmlHPC-PTHREADS-SSE3 $PREFIX/bin/
make -f Makefile.SSE3.PTHREADS.gcc clean

make -f Makefile.AVX.gcc CC="$CC"
cp raxmlHPC-AVX $PREFIX/bin/
make -f Makefile.AVX.gcc clean

make -f Makefile.AVX.PTHREADS.gcc CC="$CC"
cp raxmlHPC-PTHREADS-AVX $PREFIX/bin/
make -f Makefile.AVX.PTHREADS.gcc clean

make -f Makefile.AVX2.gcc CC="$CC"
cp raxmlHPC-AVX2 $PREFIX/bin/
make -f Makefile.AVX2.gcc clean

make -f Makefile.AVX2.PTHREADS.gcc CC="$CC"
cp raxmlHPC-PTHREADS-AVX2 $PREFIX/bin/
make -f Makefile.AVX2.PTHREADS.gcc clean

