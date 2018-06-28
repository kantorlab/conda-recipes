#!/bin/bash

set -e

sed -i.bak 's/^CPPFLAGS =$//g' Makefile
sed -i.bak 's/^LDFLAGS  =$//g' Makefile

sed -i.bak 's/^CPPFLAGS =$//g' htslib-$PKG_VERSION/Makefile
sed -i.bak 's/^LDFLAGS  =$//g' htslib-$PKG_VERSION/Makefile

# varfilter.py in install fails because we don't install Python
sed -i.bak 's#misc/varfilter.py##g' Makefile

cd htslib*
./configure --prefix=$PREFIX --enable-libcurl
make
cd ..
# Problem with ncurses from default channel we now get in bioconda so skip tview
# https://github.com/samtools/samtools/issues/577
./configure --prefix=$PREFIX --enable-libcurl --without-curses
make install prefix=$PREFIX LIBS+=-lcrypto LIBS+=-lcurl

mkdir -p ${PREFIX}/lib
cp libbam.a ${PREFIX}/lib/
mkdir -p ${PREFIX}/include/bam
cp *.h ${PREFIX}/include/bam/
