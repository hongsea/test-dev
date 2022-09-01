#!/bin/bash 

npx depcheck -f ../ | sed '/Missing/q' | grep '\*' | cut -c 3- | while read my_package; do
  wc -l "$my_package"
done