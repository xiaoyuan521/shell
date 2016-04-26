#!/bin/bash

. ./common.sh

## string split ###
# str="1,2,3"
# arr=(${str//,/ })
# len=${#arr[@]}
# for((i=0;i<$len;i++)); do
# 	echo ${arr[$i]}
# done


#### sql ####

## 检索一条数据
# server_id=9999

# results=(`mysql \
# -h $DB_HOST \
# -P $DB_PORT \
# -u $DB_U \
# -p$DB_P \
# -N \
# -e "SELECT * FROM sys_info_db.bl_ad_conv_log_executed WHERE server_id = $server_id"`)

# echo ${results[0]}


## 通过函数检索一条数据
## 因为bash函数的返回值只能是整数，所以采用全局变量来接收返回结果

# _getsql() {

# 	sql_result_arr=(`mysql \
# 	-h $DB_HOST \
# 	-P $DB_PORT \
# 	-u $DB_U \
# 	-p$DB_P \
# 	-N \
# 	-e "$1"`)

# 	if [ $? -ne 0 ] ; then
# 		_logerror "${1}実行エラー"
# 		exit 1
# 	fi
# }

# server_id=9999
# sql_result_arr=()
# _getsql "SELECT * FROM sys_info_db.bl_ad_conv_log_executed WHERE server_id = $server_id"

# echo ${sql_result_arr[2]}


############### REG EXP #################
## 用正则表达式来匹配字符串
# myname="zhaohs"
# result=`echo $myname | grep "zhao"`
# # 用$?来进行判断
# if [ $? -eq 0 ]; then
# 	echo "have first name in your name"
# else
# 	echo "no first name in your name"
# fi

# # 用返回值是否为空来判断
# if [ -z $result ]; then
# 	echo "bbbbbbbbbbbbbb"
# else
# 	echo "nnnnnnnnn bbbbbbbbb"
# fi

# _test() {
# 	echo "zhaohs"
# }

# result=`_test`
# echo $result

_trim() {
    echo $* | grep -o "[^ ]\+\( \+[^ ]\+\)*"
}
result=`_trim   a bb cc     `
echo $result