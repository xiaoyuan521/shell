#!/bin/bash

## 文档参考(是官方的？)
# http://tldp.org/LDP/abs/html/bashver3.html

############ 正则表达式 #########
## 替换
# str="apple orange apple"
# result=`echo "$str" | sed "s/\\sa/ A/g"`
# echo $result

## 匹配
# 使用 =~ 匹配的情况下，最好前后2个都用变量
# 这段儿代码再windows的git bash下无法执行。。。
# str="apple orange appl e"
# reg='^apple.*?\se$'
# if [[ $str =~ ^a(.*?)e$ ]]; then
#     echo "ok"
# else
#     echo "ng"
# fi

## 正则不使用变量的情况
## 至少 \s 无法再正则中使用 。。。
# str="apple orange appl e"
# reg='^apple'
# if [[ $str =~ ^apple.*?e$ ]]; then
#     echo "ok"
# else
#     echo "ng"
# fi

## 参考文档给的例子
# variable="This is a fine mess."
# echo "$variable"
# # Regex matching with =~ operator within [[ double brackets ]].
# if [[ "$variable" =~ T.........fin*es* ]]
# # NOTE: As of version 3.2 of Bash, expression to match no longer quoted.
# then
#   echo "match found"
#       # match found
# fi

## 匹配，使用grep, 可以再windows的git bash中执行
## 注意 \d 不能使用，需要使用 [0-9], 原因未知。。。
## echo "$str" grep -q -R "$reg"
# tb="bl_ad_conv_log_20150901"
# reg='bl_ad_conv_log_[0-9]{8}$'
# echo "$tb" | grep -q -E "$reg"
# if [ $? -eq 0 ]; then
#     echo "match"
# else
#     echo "not match"
# fi

### 部分匹配
str="apple orange"
reg='(\w+)\s(\w+)'
if [[ $str =~ $reg ]]; then
	echo "${BASH_REMATCH[2]} ${BASH_REMATCH[1]}"
fi