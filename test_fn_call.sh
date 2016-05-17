#!/bin/bash


# 使用2个反斜线 `` 来调用方法的意义
# 1. 执行反斜线中的命令
# 2. 将STDOUT的结果再次执行
#    例如result=`ls` ，是将ls的结果赋值给result变量
# 3. STDERR的内容不会赋值给变量，会输出到控制台
# 4. 如果需要STDERR的内容 -> result = `ls 2>&1`

function f(){
  local result=""
  result=`lss`
  if [ $? -ne 0 ]; then
    echo "ffff" >&2
    exit 1
  else 
    echo "ssss"
    exit 0
  fi
}

r=`f`
echo "[$r]"