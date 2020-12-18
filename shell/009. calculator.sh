#!/bin/bash
read -p " Input the first number: " num_fst
read -p " Input the operator: "  operator
read -p " Input the second number: " num_sec
echo " $num_fst$operator$num_sec=$(($num_fst$operator$num_sec))"
