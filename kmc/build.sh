#!/bin/bash
set -e
cp $RECIPE_DIR/gpl-2.0.txt .
mkdir -p $PREFIX/bin
cp kmc* $PREFIX/bin/
