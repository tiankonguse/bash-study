#########################################################################
# File Name: ssh.sh
# Author: tiankonguse
# mail: i@tiankonguse.com
# Created Time: Thu 27 Feb 2014 11:50:04 AM CST
#########################################################################
#!/bin/bash

declare -i nameNum;


# declare show name


declare -a names;

names[0]="ms";
names[1]="msProxy";

nameNum=${#names[@]};

echo "pleace select a number that you want to connect.";

i=0;

while [ $i -lt $nameNum ];
do
    echo "$i :  ${names[$i]}";
    i=$(($i+1));
done


# declare command name 

declare -a commands;

commands[0]="ssh tiankonguse@tiankonguse.com";
commands[1]="ssh -D 7070 tiankonguse@tiankonguse.com";


read i;

if [[ $i =~ ^[0-9]+$ ]]&&[[ $i < $nameNum ]]
then
    eval ${commands[$i]};
else
    echo "input error!";
fi



