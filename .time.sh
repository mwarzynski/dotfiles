#!/bin/bash

w=`date -d '2070-02-01 23:30:00' +%s`
n=`date +%s`

timeleft=`expr $w - $n`

days=`expr $timeleft / 86400`

#hours=`expr $timeleft % 86400 / 3600`
#minutes=`expr $timeleft % 86400 % 3600 / 60`
#seconds=`expr $timeleft % 86400 % 3600 % 60`

echo -e "\033[1;37m${days} days left to die.\033[0m"
