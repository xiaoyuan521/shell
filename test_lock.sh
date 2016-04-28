. `dirname $0`/common.sh

shell_name="test_lock"
lock_flg=`_is_lock "$shell_name"`
if [ $lock_flg -ne 0 ]; then
    echo "shell is running"
    exit 1
else
    _lock $shell_name
fi

echo "begin"

sleep 2

echo "end"

_unlock $shell_name