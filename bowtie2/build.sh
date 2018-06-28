#!/bin/bash
set -e

CXXFLAGS=$(echo $CXXFLAGS | sed 's/-std=c++17/-std=c++98/')

export CPATH=$PREFIX/include
export LD_RUN_PATH=$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib

make CC="$CC" CFLAGS="$CFLAGS" CPP="$CPP" CXX="$CXX" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" prefix=$PREFIX NO_TBB=1

binaries="\
bowtie2 \
bowtie2-align-l \
bowtie2-align-s \
bowtie2-build \
bowtie2-build-l \
bowtie2-build-s \
bowtie2-inspect \
bowtie2-inspect-l \
bowtie2-inspect-s \
"
directories="scripts"
pythonfiles="bowtie2-build bowtie2-inspect"

PY3_BUILD="${PY_VER%.*}"

if [ $PY3_BUILD -eq 3 ]
then
    for i in $pythonfiles; do 2to3 --write $i; done
fi

for i in $binaries; do cp $i $PREFIX/bin && chmod +x $PREFIX/bin/$i; done
for d in $directories; do cp -r $d $PREFIX/bin; done
