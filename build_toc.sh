#!/bin/bash

echo -e "# Table of Contents\n" >TOC.md

IFS=$'\n'

for FILEPATH in $(find . -path "*.md" | sed -e "s/^\.\///" -e "s/\.md$//"); do
	echo -e "- ["$FILEPATH"](https://ganiulis.github.io/knowledge-base/"$FILEPATH")" >>TOC.md
done
