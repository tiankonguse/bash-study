#########################################################################
# File Name: php5-fpm.sh
# Author: tiankonguse
# mail: i@tiankonguse.com
# Created Time: Sat Mar 22 04:12:04 2014
#########################################################################
#!/bin/bash
  
#1.php5-fpm日志存放路径  
php5_fpm_logs_path="/var/log/fpm/"  
category_array=("access" "error")  
  
  
#2.php5-fpm日志名后缀  
postfix=`date -d '-1 days' +%Y%m%d`".log"  
  
  
#3.php5-fpm日志切割  
for category in ${category_array[*]}  
do  
    if [ -e $php5_fpm_logs_path/php5-fpm.$category.log ]  
    then  
        mv $php5_fpm_logs_path/php5-fpm.$category.log \  
            $php5_fpm_logs_path/php5-fpm.$category.$postfix  
    fi  
done  
  
  
#4.查找php5-fpm进程号,让其产生新的日志文件  
php5fpm_pid=`ps aux |grep -E 'php-fpm: master process'|grep -v 'grep'|awk '{print $2}'`  

#USR1:Reopen log files,刷新nginx日志文件  
#kill -USR1 $php5fpm_pid 

