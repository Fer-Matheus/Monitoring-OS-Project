#!/bin/bash

cat /var/log/audit/audit.log | grep $1 >> utils/log.txt

pid=`python3 utils/getPid.py`

lines=`cat logs/temp`
> logs/temp
printf "pid: ${pid} \n${lines}\n" >> logs/$1.txt