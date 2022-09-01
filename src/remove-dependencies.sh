#!/bin/bash 
# set -x
npx depcheck .. | sed '/Missing/q' | grep '\*' | cut -c 3- > file.txt
count=$(wc -l file.txt | awk '{print $1}')
echo "Checked Unued Dependencies: $count unued"

npx depcheck .. | sed '/Missing/q' | grep '\*' | cut -c 3- | while read my_package; do
  echo "$my_package"
done;