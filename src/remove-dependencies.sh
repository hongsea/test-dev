#!/bin/bash 

unued=$(npx depcheck -f ../ | sed '/Missing/q' | grep '\*' | cut -c 3-)
wc $unued
n=1
while read line; do
echo "uninstall : $dep"

$unued | while read my_package; do
  echo "$my_package"
done