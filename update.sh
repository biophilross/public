#!/usr/bin/env bash

set -eu

for file in $(ls *.md); do
	pandoc -f markdown_github -t html5 -c style.css $file > ${file%*}.html
done

git add --all
git commit -m "update"
git push origin gh-pages
