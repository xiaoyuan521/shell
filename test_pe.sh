#!/bin/bash

# shell parameter expansion
# 英文手册
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html

### 如果aa的值为空，则使用bb的值，不给aa赋值
# bb=11
# echo ${aa-$bb}
# echo $aa

### 如果aa的值为空，则使用bb的值，同时给aa赋值
# bb=11
# echo ${aa:=$bb}
# echo $aa


### 巧用##符号，取得文件名字和扩展名字
path="/root/gitWorkspace/shell/test.sh"
file_name=${path##*/}
echo $file_name

ext_name=${path##*.}
echo $ext_name
