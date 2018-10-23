#!/bin/bash

set -e

wget http://www.apache.org/licenses/LICENSE-2.0

python setup.py install --single-version-externally-managed --record=record.txt

