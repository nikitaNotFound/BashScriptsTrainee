#!/usr/bin/env bash

function fib() {
  num=$1

  if [[ $num == 0 ]] || [[ $num == 1 ]]; then
    echo 1
  fi

  prevResult=1
  currentResult=1

  for ((i=2; i <= $num; i++)) do
    let newResult=$prevResult+$currentResult
    prevResult=$currentResult
    currentResult=$newResult
  done

  echo $currentResult
}

echo $(fib $1)