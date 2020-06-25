#!/bin/sh
openapi=$(cat "openapi.yml")
# Replace flag with
sed -i "s/OPENAPI/${openapi}/" stack.yml
