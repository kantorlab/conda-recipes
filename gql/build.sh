#!/bin/bash

set -e

wget https://github.com/graphql-python/gql/raw/master/LICENSE

python setup.py install --single-version-externally-managed --record=record.txt

