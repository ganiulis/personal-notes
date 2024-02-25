#!/bin/bash

echo -e "# Table of Contents\n" >TOC.md

IFS=$'\n'

for FILEPATH in $(find . -path "*.md" | sed -e "s/^\.\///" -e "s/\.md$//"); do
	echo "[]("$FILEPATH")" >>TOC.md
done
