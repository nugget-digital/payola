#!/usr/bin/env bash
# Replace OPENAPI flag with openapi specification

sed -i "/OPENAPI/ {
	r openapi.yml
	d
}" stack.yml
