#!/bin/bash

echo -e "# Table of Contents\n" >TOC.md

IFS=$'\n'

for FILEPATH in $(find . -path "*.md" | sed -e "s/^\.\///" -e "s/\.md$//"); do
	echo "- ["$FILEPATH"](https://ganiulis.github.io/knowledge-base/"$(echo $FILEPATH | tr -s ' ' '%20')")" >>TOC.md
done
