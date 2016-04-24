#!/bin/bash
variable_from_common="hello common variable"

# 如果return，返回值就是该值，使用 $? 取得
# 如果没有return， 返回值就是最后一句的执行退出码，$? 取得，通常为 0 表示成功
common_add(){
	return `expr $1 + $2`
}