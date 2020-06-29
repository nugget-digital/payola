#!/usr/bin/env bash
# Replace OPENAPI flag with openapi specification

# Read openapi spec and
openapi="openapi.yml"
while IFS= read -r line
do
  echo "			" + "$line"
done < "$openapi"

# sed -i "/OPENAPI/ {
# 	r openapi.yml
# 	d
# }" stack.yml
