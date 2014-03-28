#########################################################################
# File Name: logrotation.sh
# Author: tiankonguse
# mail: i@tiankonguse.com
# Created Time: Sun 23 Mar 2014 10:29:03 PM CST
#########################################################################
#!/bin/bash
alarmrate=500 # 备份目录的最大容量
file_max_size=5 # 每个日记的大小限制
log_ram_dir=/var/log # 日记产出目录
working_dir=/mnt/log # 日记备份目录
SLEEPTIME=5

# 给文件名打时间截

filenameConvert(){
    timestamp=$(date +%Y%m%d%H%M%S)
    timestamp=`echo $timestamp`
    RETVAL=$1.$timestamp
}

# 搜索文件夹下最老的文件
searchdir(){
    oldestlog=`ls -rt | head -n1 | awk '{print $1}'`
}


# 清除旧日记
clear_old_log_under_working_dir (){
    cd $working_dir
    while ture
    do
        logsize=`du -ms $working_dir | awk '{print $1}'`
        if [ $logsize -gt $alarmrate ]
        then
            searchdir
            rm -rf $oldestlog
        else
            break
        fi
    done
}


# 日记备份
backuplog_process(){
    cd $log_ram_dir
    for i in *
    do
        file_size=`du -m $i | awk '{print $1}'`
        case $i in
            access.log | error.log | apcupsd.events | evms-engine.log |\
                messages | soho.log | kern.log | lpr.log | mail.err |\
                mail.info | mail.log | mail.warn | news |\
                rsyncd.log | user.log | dmesg | dmesg.0 | dmesg.new)
            if [ ! -d $working_dir ]
            then
                filenameConvert $i
                cp $log_ram_dir/$i $working_dir/$RETVAL
                echo "" > $log_ram_dir/$i
                clear_old_log_under_working_dir
            fi
            ;;
        *)
            if [ file_size -gt file_max_size ]
            then
                echo "" > $log_ram_dir/$i
            fi
    esac
done
}

while ture # 间隔5秒运行
do
    backuplog_process
    sleep $SLEEPTIME
done
