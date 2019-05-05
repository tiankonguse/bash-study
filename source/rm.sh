#########################################################################
# File Name: rm.sh
# Author: tiankonguse
# mail: i@tiankonguse.com
# Created Time: Tue 13 May 2014 05:15:51 PM CST
#########################################################################
#!/bin/sh 
# script to send removed files to trash directory
mv $@ ~/.local/share/Trash/files/          #有$1~$9个数量, $@代表all

