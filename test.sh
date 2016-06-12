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

# 关于echo显示字符串的问题
# 如果想保持字符串原样，需要使用双引号
# 例如，下面的例子中，字符串是\t分割的，有无双引号输出结果是不一样的
a="111  222 333"
echo "$a"
echo $a

