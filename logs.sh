#!/bin/bash

if [ "$1" = "" ] || [ ! -f $1 ]; then
  echo "File not found!"
  exit 2
fi
sumtime=0
sum=`cut -f5 -d"|" $1 | cut -f2 -d" " | awk '{s+=$1} END {print s}'`
count=`cut -f5 -d"|" $1 | cut -f2 -d" "| wc -l | cut -f1 -d" "`
echo "Median for $count requests: `echo $sum/$count | bc -l`"
#while read line; do
#  cut
#done < $1

