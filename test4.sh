#!/bin/bash

############ 错误处理 ##############
## 出错的时候，结束处理，退出
# function fn1(){
# 	echo "fn 1111"
# 	if [ "1" = "1" ]; then
# 		echo "error"
# 		exit 1
# 	fi
# }

# function fn2(){
# 	echo "fn 2222"
# }

# fn1
# fn2

# # 对于有返回值的函数来说，
# # 同时返回函数的处理结果和正确/错误码是一个困难的事情

# # 出错无法取得错误码，因为有local想当于2句话了？
# # local result=`ls` 
# # 正确：
# # local result=""
# # result="labcde"

# # 出错无法取得错误码，因为有 () 想当于2句话了？
# # result=(`ls`)

# # 总结方法：
# # 见下面的例子

# function fn(){
# 	local sql_result=()
# 	sql_result=`mysql -hlocalhost -udev -ppassword -N -D adnet -e "$1" `
# 	if [ $? -ne 0 ]; then
# 		echo "error"
# 		return 1
# 	else
# 		echo sql_result
# 		return 0
# 	fi
# }
# result=(`fn "select * from ad limit 1,1"`)
# if [ $? -eq 0 ]; then
# 	echo "successed ...."
# 	echo ${#result[@]}
# else
# 	echo "fail ..."
# fi


# 2个echo都是返回值
# function fn(){
# 	echo "aaabbcc"
# 	echo `ls`
# }
# result=`fn`
# echo $result
