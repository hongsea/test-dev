#!/bin/bash 

npx depcheck -f ../ | sed '/Missing/q' | grep '\*' | cut -c 3- | while read my_package; do
  wc "$my_package"
done