#!/bin/bash

# 実行ディレクトリ検索
THIS="$0"
BINDIR=`dirname "$THIS"`
BINDIR=`cd "$BINDIR"; pwd`

variable_from_common="hello common variable"

# 如果return，返回值就是该值，使用 $? 取得
# 如果没有return， 返回值就是最后一句的执行退出码，$? 取得，通常为 0 表示成功
common_add(){
	return `expr $1 + $2`
}

readonly DB_HOST="192.168.196.14"
readonly DB_PORT="9103"
readonly DB_U="root"
readonly DB_P="password"

# _getsql() {
#   # ${MYSQL_HOME}/bin/mysql -u $MYSQL_U -p$MYSQL_P -d sys_info_db -N -e "$1"
#   # results=(`mysql -h 192.168.196.14 -P9301 -u root -ppassword -D sys_info_db -N -e "select * from bl_ad_conv_log_executed"`)

# 	mysql \
# 	-h $DB_HOST \
# 	-P $DB_PORT \
# 	-u $DB_U \
# 	-p$DB_P \
# 	-N \
# 	-e "SELECT * FROM sys_info_db.bl_ad_conv_log_executed WHERE server_id = $server_id"

#   # if [ $? -ne 0 ] ; then
#   #   _logerror "${1}実行エラー"
#   #   exit 1
#   # else
#   	return ${results[@]}
#   # fi
# }

_is_lock() {
    local lock_file_name=$BINDIR/$1.lock
    if [ -f "$lock_file_name" ]; then
        echo 1
        return 0
    else
        echo 0
        return 0
    fi
}
_lock() {
    local lock_file_name=$BINDIR/$1.lock
    echo $lock_file_name
    touch $lock_file_name
}
_unlock() {
    local lock_file_name=$BINDIR/$1.lock
    rm -f $lock_file_name
}
