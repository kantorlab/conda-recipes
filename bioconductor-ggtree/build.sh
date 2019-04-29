#!/bin/bash
set -e
$R -e 'install.packages("BiocManager", repos=c("https://cran.cnr.berkeley.edu/")); BiocManager::install("ggtree", version = "3.8")'
