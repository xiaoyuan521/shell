#!/bin/bash

# day_plus=0
# while [ $day_plus -lt 30 ]; do
# 	echo `date "+%Y%m%d" --date="+${day_plus} day"`
# 	day_plus=`expr $day_plus + 1`
# done

# for name in `ls`
# do
# 	echo $name
# done

##### CALL SQL ######

# name=`mysql -h localhost -udev -ppassword -N -D adnet -e "SELECT * FROM ad" 2>/dev/null`
# for name_item in $name
# do
# 	echo $name_item
# done


##### ARRARY #####

# 数组是用空格分开的

## -- 遍历sql的执行结果 --
# names=`mysql -h localhost -udev -ppassword -N -D adnet -e "show tables like 't%'" 2>/dev/null`
# for name in $names
# do
# 	echo $name
# done

## -- 普通数组 --
# arr=(1 2 3)
# for item in ${arr[@]}; do
# 	echo $item
# done

# arrStr=("a" "b" "c")
# for item in ${arrStr[@]}; do
# 	echo $item
# done

# arrStr=("a" "b" "c")
# arrStr[0]="zhaohs"
# arrStr[3]="4444"
# for item in ${arrStr[@]}; do
# 	echo $item
# done

## 数组显示
# arr=(1 2 3)
# echo ${arr[@]} # 全部显示
# echo ${arr[0]} # 单个显示

## 数组综合
# compareArr=("20160426" "20160428")
# ndaysArr=()
# function getNDaysArr(){
# 	local i=0
# 	while [ $i -lt $1 ]; do
# 		local d=`date "+%Y%m%d" --date="+${i} day"`
# 		ndaysArr[$i]=$d
# 		i=`expr $i + 1`
# 	done
# }

## 二维数组遍历
# arr_num=(1 2 3)
# arr_str=("a" "b" "c")
# arr=()
# arr[0]=${arr_num[@]}
# arr[1]=${arr_str[@]}
# for arr_item in ${arr[@]}; do
#   for item in ${arr_item[@]}; do
#     echo "$item"
#   done
# done

# dayCount=6
# getNDaysArr $dayCount
# for day in ${ndaysArr[@]}; do
# 	echo ${day}
# done

# echo "----------"

# compareArrLen=${#compareArr[@]}
# for ((i=0;i<$dayCount;i++));do
# 	source=${ndaysArr[$i]}

# 	for((j=0;j<$compareArrLen;j++)){
# 		compareItem=${compareArr[$j]}
# 		if [ $compareItem = $source ]; then
# 			echo $source
# 		fi
# 	}
# done

#### 变量 ####
# -- 变量 --
# a=1
# function fn(){
# 	local a=2
# }
# fn
# echo $a

#### 方法 ####
# function add(){
# 	result=`expr $1 + $2`
# }
# add 1 2
# echo $result


### module import
## usage
##. ./common.sh 或者 source ./common.sh
# source ./common.sh
# echo $variable_from_common
# common_add 1 8
# result=$?
# echo $result

## 循环控制 continue & break
# while :
# do
#   read aNum
#   if [  $aNum -lt 5 ]; then
#     echo "good for you , it's [$aNum]"
#   else
#     continue
#     # break
#     echo "wrong number, less then 5!"
#   fi
# done

## case
while :; do
  read input
  case "$input" in
    [a-z]|[A-Z] )
      echo "input is alph";;
    [0-9] )
      echo "input is number";;
    * )
      echo "input something else ...";;
  esac
done
