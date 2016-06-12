#!/bin/bash

# 将tsv文件读入到数组中
while read line
do
  line=`echo $line | sed -r "s/\t/,/g"`
  IFS=",";line_arr=($line)
  for i in ${line_arr[@]}; do
    echo $i
  done
done
