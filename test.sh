#!/bin/bash

# 将tsv文件读入到数组中
# while read line
# do
#   line=`echo $line | sed -r "s/\t/,/g"`
#   IFS=",";line_arr=($line)
#   for i in ${line_arr[@]}; do
#     echo $i
#   done
# done

# 关于echo显示字符串的问题
# 如果想保持字符串原样，需要使用双引号
# 例如，下面的例子中，字符串是\t分割的，有无双引号输出结果是不一样的
# a="111  222 333"
# echo "$a"
# echo $a

# #### 数值的运算（整数）(正负均可)####
# echo "2 + 1" | bc

# #### 数值的运算(整数)（浮点数）（正负均可） ####
# echo "0.1 - 0.3" | bc | sed -r 's/^(-?)\./\10./'
# echo "0.1 - 0.3" | bc | xargs printf "%g"

# 科学计数法的数值计算
# echo `perl -e"print 1.9274838549e+01 + 6.8220021491e+07"` 
# 科学计数法的数值计算
# echo "1.9274838549e+01 + 6.8220021491e+07" | awk '{printf "%.14f", $1 + $2}' 

# 计算后，去掉末尾多余的0，（整数小数均可）
# s/\.0+$//g -> 去掉整数的0
# s/(\..*?[1-9])0+$/\1/g -> 去掉小数点儿后的多余0
# echo "$1 - $2" | bc | xargs printf "%.14f" | sed -r "s/\.0+$//g;s/(\..*?[1-9])0+$/\1/g"

# #### 数值的比较 ####
# # 非浮点数的比较方法
# a="111" 
# b="222" 
# if [ "$a" -lt "$b" ]; then
#   echo "a 小于 b" 
# else
#   echo "a 不小于 b" 
# fi

# # 浮点数的比较方法，正数，负数均可
# a="0.111" 
# b="0.112" 
# if [ `echo "$a < $b" | bc` -eq 1 ]; then
#   echo "a 小于 b" 
# else
#   echo "a 不小于 b" 
# fi


OLD_IFS=$IFS

a="1,2,3"
IFS=',';arr=($a)
IFS=$OLD_IFS
echo ${arr[1]}

while read line
do 
  echo $line
  IFS=',';line_arr=($line)
  OLD_IFS=$IFS
  echo ${#line_arr[@]}
done


