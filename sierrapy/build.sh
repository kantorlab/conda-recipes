#!/bin/bash

set -e

wget https://github.com/hivdb/sierra-client/raw/master/LICENSE

python setup.py install --single-version-externally-managed --record=record.txt

