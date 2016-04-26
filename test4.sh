#!/bin/bash

function fn1(){
	echo "fn 1111"
	if [ "1" = "1" ]; then
		echo "error"
		exit 1
	fi
}

function fn2(){
	echo "fn 2222"
}

fn1
fn2