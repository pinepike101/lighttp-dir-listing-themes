#!/bin/sh



count=10
dest_path=$(pwd)/files
maxfilesize=1000000
fnmin=8
fnmax=128

mkdir -p $dest_path
for num in $(seq 0 $count);
do
  fnlength=$(shuf -i $fnmin-$fnmax -n1)
  fn=$dest_path/$(cat /dev/urandom | tr -dc 0-9a-z. | head -c$fnlength)
  filesize=$(shuf -i 0-$maxfilesize -n1)
  fallocate -l $filesize $fn
  sleep 0.1
done