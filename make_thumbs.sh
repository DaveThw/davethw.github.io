#!/bin/bash

# resize all .jpg files in current directory to 600px wide
for file in *.jpg; do convert $file -resize 600 th-$file; done