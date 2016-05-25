#!/bin/bash

_main(){

  result=`lss`
  echo $? # display 127


  local result2=`lss`
  echo $? # display 0
}

_main