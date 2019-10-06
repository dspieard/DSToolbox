#!/bin/bash
ip=$1
range1=$2
range2=$3
filename=`date +"%m_%d_%Y"`
echo -e "\e[34m
 _____ _             _
|  __ (_)           (_)
| |__) | _ __   __ _ _ _ __   __ _
|  ___/ | '_ \ / _' | | '_ \ / _' |
| |   | | | | | (_| | | | | | (_| |
|_|   |_|_| |_|\__, |_|_| |_|\__, |
                __/ |         __/ |
               |___/         |___/
"
if [[ $1 == -h || $1 == --help ]]; then
        echo -e "\e[39mSyntax: ./ping [subnet] [startrange] [endrange]\nExample: ./pinghosts.sh 192.168.1. 1 254"
        exit 1
fi
for i in `seq $range1 $range2`; do
        ping -c 1 -W 1 $ip$i 1>/dev/null 2>&1
        if [[ $? -eq  0 ]]; then
                echo -e  "\e[32m$ip$i is up"
                echo -e  "\e[32m$ip$i is up" >> $filename.txt
        else
                echo -e "\e[31m$ip$i is down"
        fi
done
