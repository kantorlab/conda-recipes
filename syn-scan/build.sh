#!/bin/bash

set -e

mkdir -p $PREFIX/opt/syn-scan-0.9

cp -r Data $PREFIX/opt/syn-scan-0.9/
sed "s|Data/|$PREFIX/opt/syn-scan-0.9/Data/|" SynSCAN.pm >$PREFIX/opt/syn-scan-0.9/SynSCAN.pm

mkdir -p $PREFIX/bin

PERL=$(which perl)
sed "1c#!$PERL\nuse lib '$PREFIX/opt/syn-scan-0.9';" syn-scan.pl >$PREFIX/bin/syn-scan.pl
chmod a+x $PREFIX/bin/syn-scan.pl

