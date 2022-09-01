#!/bin/bash 
# set -x
npx depcheck | sed '/Missing/q' | grep '\*' | cut -c 3- > file.txt
COUNT=$(wc -l file.txt | awk '{print $1}')

if (($COUNT != 0))
then
  echo "- Checked Unused Dependencies: $COUNT"
  echo "- Uninstalling Unused Dependencies..."

  npx depcheck | sed '/Missing/q' | grep '\*' | cut -c 3- | while read my_package; do
    npm uninstall "$my_package" >  /dev/null
  done; 

  echo "- Passed Check Unused Dependencies."
else
  echo "- Passed Check Unused Dependencies."
fi
