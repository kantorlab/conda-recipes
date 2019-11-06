#!/bin/bash
set -e
$R -e 'install.packages("BiocManager", repos=c("https://mirror.las.iastate.edu/CRAN/")); BiocManager::install("ggtree", version = "3.10")'
