#!/usr/bin/env bash
# Split a big file into multiples files. Each file has 59000 lines each

tail -n +2 <my-file>.csv | split -l 59000 - split_
for file in split_*
do
    head -n 1 <my-file>.csv > tmp_file
    cat $file >> tmp_file
    mv -f tmp_file $file
done
