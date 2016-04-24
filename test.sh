#!/bin/bash

# echo "please input mysql password:"
# read psw
# DB_NAME=adnet
# T_NAME=ad
# `mysql \
# 	-h localhost \
# 	-u dev \
# 	-p \
# 	-D $DB_NAME \
# 	-N \
# 	-e "select * from $T_NAME limit 0,5" > a.txt` << EOF
# password
# EOF



# name="zhaohs"
# echo \
# 	"ni" \
# 	$name


# `mysql -h localhost -u dev -ppassword -N -D adnet -e "select * from ad;" > a.txt`
# result=`echo "hello"` 
# echo $result
# echo "hello111">a.txt

# $result>>a.txt
# echo $result
# `mysql --help` > b.txt

# mysql -h localhost -u dev -p -N -D adnet -e "select * from ad;" 1>a.txt 2>&1 << echo "password"

# /bin/bash << EOF
# mysql -h localhost -u dev -p -N -D adnet -e "select * from ad;" 
# passowrd
# EOF

# cat << EOF
# hello
# EOF

# /bin/bash << EOF
# echo "world ~"
# EOF

a=1
b=`expr $a + 1`
echo $b;