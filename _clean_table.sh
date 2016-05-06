#!/bin/bash

. `dirname "$0"`/common.sh

sql="show tables like 'bl_%'"
tbs=`_do_sql "$sql"`
reg='bl_ad_conv_log_[0-9]{8}$'
for tb in $tbs; do
    echo "$tb" | grep -q -E "$reg"
    if [ $? -eq 0 ]; then
        # echo $tb

        cnt_sql="select count(*) from $tb"
        cnt=`_do_sql "$cnt_sql"`
        if [ $cnt -ne 0 ]; then
            echo "preserve $tb"
            echo $cnt
        else
            echo "drop table $tb"
            drop_sql="drop table $tb"
            _do_sql "$drop_sql"
        fi
    fi
done


