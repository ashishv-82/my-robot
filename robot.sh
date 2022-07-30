#!/bin/bash
 
forward_count=0
backward_count=0
 
echo "Please provide steps to Mr. Robot and press ENTER."
read steps
 
echo "Calculating..."

IFS=','

read -a steparr <<< "$steps"
