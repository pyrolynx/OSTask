#!/bin/bash

if [  ! -f $1 ]; then
  echo "Source image not found."
  exit 2
fi
if [ $2 -eq 0 ] || [ $((360%$2)) -ne 0 ]; then
  echo "Angle koefficient is not valid!"
  exit 2
fi
if [ $3 -le 1 ]; then
  echo "Invalid delay of animation!"
  exit 2
fi
if [ $4 == "" ]; then
  echo "Empty name of out file!"
  exit 2
fi
echo "Making temporary directory..."
mkdir _tmp
angle=$2
nullmask="000"
echo "Rotate source image..."
while [ $angle -le 360 ]; do
  a=${nullmask:${#angle}}$angle
  echo -n 'Rotate at angle: '$angle$'\r'
  convert $1 -rotate $angle _tmp/$a.jpg
  angle=$(($angle+$2))
done
echo
echo "Creating GIF..."
convert -delay $3 -loop 0 _tmp/*.jpg $4
echo "Clear temporary files..."
rm -rf _tmp
echo "Success!"



