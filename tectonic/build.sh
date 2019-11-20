#! /bin/bash

set -ex

# 2017 Dec 4: Work around SSL problem; see https://github.com/conda-forge/mosfit-feedstock/issues/23
unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

export CFLAGS="-std=gnu99 $CFLAGS"
export CXXFLAGS="$(echo $CXXFLAGS | sed 's/-std=c++17//') -D__STDC_FORMAT_MACROS=1"
export RUSTFLAGS="-C link-args=-Wl,-rpath-link,$PREFIX/lib"

#cargo build --release --verbose
cargo install --bin tectonic --root $PREFIX
rm -f $PREFIX/.crates.toml
