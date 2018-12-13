#!/bin/bash
set -e
ln -s $CC $PREFIX/bin/cc
python setup.py install --single-version-externally-managed --record=record.txt
rm $PREFIX/bin/cc
