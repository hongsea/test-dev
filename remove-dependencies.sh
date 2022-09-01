#!/bin/bash 

npx depcheck | sed '/Missing/q' | grep '\*' | cut -c 3- | while read my_package; do
  echo "$my_package"
done