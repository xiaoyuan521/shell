#!/bin/sh

# 実行ディレクトリ検索
THIS="$0"
BINDIR=`dirname "$THIS"`
BINDIR=`cd "$BINDIR"; pwd`

BLADE_DATA_EXTENSION=".tsv"
BLADE_OK_EXTENSION=".ok"
DIR_SID="/home/www/res/serverid.res"
DIR_CONV_LOG="/mnt/bladelogs/conv_log/"
DIR_CONV_LOG_CN="/mnt/bladelogs/conv_log_china/"
DIR_CONV_LOG_OTHERS="/mnt/bladelogs/conv_log_others/"

SHELL_NAME=`basename ${THIS} | cut -f1 -d'.'`

##################################################
## 日付定数
##  ※引数はYYYYMMDD（8桁）
##  ※処理に影響があるため最初に実行
##  ※dateコマンドはcron～shell含めて1度まで
##################################################
if [ "" == "$1" ] ; then
	DATE=`date '+%Y%m%d' --date '1 days ago'`
else
	DATE=$1
fi

YYYY=`echo $DATE | cut -c 1-4`
MM=`echo $DATE | cut -c 5-6`
DD=`echo $DATE | cut -c 7-8`
DS=$YYYY-$MM-$DD

##################################################
## 定数 ※大文字でreadonlyで使用
##################################################
# DB接続設定などを読み込み
. ${BINDIR}/config.sh

##################################################
# 函数
##################################################

_log() {
	echo `date "+%F %T"`" ${1}"
}

_log_info() {
	_log "INFO ${1}"
}

_log_error() {
	_log "ERROR ${1}"
}

# 開始ログ
_start() {
  START_UNIXTIME=`date +%s`
  START_TIME=`date "+%F %T"`
  _log_info "${0} start"
}

# 終了ログ
_end() {
  END_UNIXTIME=`date +%s`
  END_TIME=`date "+%T"`
  _log_info "${0} end"
  _log_info "HISTORY ${0} ${START_TIME} ${END_TIME} "`expr ${END_UNIXTIME} - ${START_UNIXTIME}`
}

# MySQL実行
#
# INSERT/UPDATE/DELETE
# _do_sql "UPDATE bl_ad_conv_log_executed SET server_id=9999 WHERE server_id=9999"
#
# SELECT
# sql_result_arr=(`_do_sql "select * from bl_ad_conv_log_executed where server_id=9999"`)
# echo ${sql_result_arr[@]}
_do_sql() {
  # ${MYSQL_HOME}/bin/mysql -u$MYSQL_U -p$MYSQL_P -D sys_info_db -N -e "$1"
  mysql -h 192.168.196.14 -P9103 -u root -ppassword -D sys_info_db -N -e "$1"
  if [ $? -ne 0 ] ; then
    _log_error "実行エラー : ${1}"
    exit 1
  fi
}

## SQLファイルの実行
_do_sql_file() {
	_info "${2}実行"
	${MYSQL_HOME}/bin/mysql $1 < $2

	if [ $? -ne 0 ] ; then
		_log_error "実行エラー : ${2}"
		exit 1;
	fi
}

## mysqlimport実行
_mysql_import() {
	mysqlimport --replace ${1} --local ${2}
	if [ $? -ne 0 ] ; then
		_log_error "mysqlimport実行エラー To:${1} From:${2}"
		exit 1;
	fi
}

# 前後空白除去
_trim() {
    echo $* | grep -o "[^ ]\+\( \+[^ ]\+\)*"
}

# 日の加法
 _next_n_day() {
	echo `date --date="$1 $2 day" +%Y$3%m$3%d`
}

# 重複実行を防ぐために、lock処理
# usage:
# shell_name="test_lock"
# lock_flg=`_is_lock "$shell_name"`
# if [ $lock_flg -ne 0 ]; then
#     echo "shell is running"
#     exit 1
# else
#     _lock $shell_name
# fi
_is_lock() {
    local lock_file_name=$BINDIR/$SHELL_NAME.lock
    if [ -f "$lock_file_name" ]; then
        echo 1
        return 0
    else
        echo 0
        return 0
    fi
}
_lock() {
    local lock_file_name=$BINDIR/$SHELL_NAME.lock
    echo $lock_file_name
    touch $lock_file_name
}
_unlock() {
    local lock_file_name=$BINDIR/$SHELL_NAME.lock
    rm -f $lock_file_name
}
