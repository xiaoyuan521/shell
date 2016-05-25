#### bash shell

* 注意点

	* 反斜线(backslash)的使用
	
		参考 test_fn_call.sh

	* local变量

		local变量的作用域为*当前函数*和*子函数*！
	
		local变量的声明分为2步  
		1） 赋值  
		2） 限制作用域  
		这个特点可能影响到 $? 的值。  
		参考 test_local.sh
