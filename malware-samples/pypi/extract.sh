#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 target-directory"
    exit 1
fi

target=$1
mkdir -p $target
find . -type f -name '*.zip' | while read sample; do
  unzipDir=$target/$(basename $sample .zip)
  mkdir -p $unzipDir
  unzip -o -P infected $sample -d $unzipDir >/dev/null 2>&1 
done