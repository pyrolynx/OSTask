#!/bin/bash

for dir in $(echo $PATH | tr ":" "\n"); do
  excount=0
  for f in $dir/*; do
    if [ -x $f ]; then
      excount=$(($excount+1))
    fi
  done
  if [ $excount -eq 0 ]; then
    echo $dir" not contains executable files."
  fi
done

