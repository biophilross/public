#!/usr/bin/env bash

set -eu

pandoc -f markdown_github -t html5 -c style.css list.md > list.html

git add --all
git commit -m "update"
git push origin gh-pages
