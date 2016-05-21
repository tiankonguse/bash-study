#! /bin/sh
 
#检查进程coredump情况
 
export PATH=/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:$PATH
 
sleep $(($RANDOM%20)).$(($RANDOM%50))
cur_path=$(dirname $(which $0))
log_file="$cur_path/../log/core_check_`date +%Y%m`.log"
core_dir="/data/coredump"
core_life=7 #core文件在backup目录的生命期,超过此期限则删除之
 
backup_dir="$core_dir/backup"
ip_inner=`/sbin/ifconfig eth1 2>/dev/null |grep "inet addr:"|awk -F ":" '{ print $2 }'|awk '{ print $1 }'`
 
log()
{
    if [ "$*" = "" ];then
        return
    fi
    if [ ! -f $log_file ];then touch $log_file; fi
    echo "[`date '+%Y%m%d %H:%M:%S'`] $*" >> $log_file 2>/dev/null
}
 
report()
{
    report_ip="10.130.25.170:8080"
    url_head="http://$report_ip/cgi-bin/s.fcg?dataId=1000023&"
    response_file="$cur_path/../log/response.tmp"
    wget_options="-T 5 -t 1 -O $response_file"
 
    wget $wget_options "${url_head}ipaddr=${ip_inner}&procid=${1}"  > /dev/null 2>&1
}
 
function get_process_name_from_core()
{
    local cn="$1"
    echo "$cn" | grep -i -q -E 'container|qzhttp|qzmonitor'
    if [ $? -ne 0 ];then return 1; fi
    ls -l "$cn" | awk '{print $3}' | grep -q "root"
    if [ $? -eq 0 ];then return 1; fi
 
    local tmp_core="${cn}-temp"
    dd if="$cn" of="$tmp_core" count=10 > /dev/null 2>&1
    strings $tmp_core > /tmp/strings_in_core_tmp
    rm -f $tmp_core > /dev/null 2>&1
 
    local kn=`cat /tmp/strings_in_core_tmp | grep -nwE "container|qzhttp" | awk -F":" '{print $1}'`
    if [ "x$kn" != "x" ];then
        (( kn=$kn+1 ))
        p=`cat /tmp/strings_in_core_tmp | head -n $kn | tail -n 1` 
    else
        p=`cat /tmp/strings_in_core_tmp | grep "/" | head -n 1 | awk '{print $1}'`
    fi
    if [ "x$p" = "x" ];then
        p=`cat /tmp/strings_in_core_tmp | grep -E "cgi-bin|fcg" | head -n 1 | awk '{print $1}'`
    fi
    basename $p
    rm /tmp/strings_in_core_tmp
}
 
function clear_backup()
{
    find $backup_dir -name "core_*" -type f -mtime +${core_life} |xargs rm -f
}
 
if [ ! -d $core_dir ];then
    mkdir $core_dir
fi
chmod 777 $core_dir
 
# core file name format
sysctl -w "kernel.core_pattern=$core_dir/core_%e_%t" >/dev/null
sysctl -w "kernel.core_uses_pid=0" >/dev/null
 
if [ $? -ne 0 ];then
    log "无法设置coredump文件存放路径"
    exit 1
fi
 
for file in `find $core_dir -name "core*" -maxdepth 1 -type f 2>/dev/null`
do
    proc=`get_process_name_from_core $file`
    if [ "x$proc" == "x" ];then
        proc=`basename $file | sed -e "s:^core_::" -e "s:_[0-9]*[.]*[0-9]*$::"`
    fi
    if [ "$proc" == "" ];then
        continue
    fi
     
 
    log "文件`basename $file`发现coredump进程 $proc"
    report $proc
 
    fproc=`basename $file | sed -e "s:^core_::" -e "s:_[0-9]*[.]*[0-9]*$::"`
    rm $backup_dir/core_${fproc}_[0-9]* 2>/dev/null
    disk_use=`df -l $core_dir | grep -o "[0-9]\+%" | sed -e "s:%::" | head -n 1`
    if [ "$disk_use" = "" ];then
        rm $file
    elif [ $disk_use -lt 90 ];then
        if [ ! -d $backup_dir ];then
            mkdir -p $backup_dir
            chmod 777 $backup_dir
        fi
        mv $file $backup_dir/core_${proc}
    else
        rm $file
    fi
    if [ -f $file ]; then mv $file $backup_dir/; fi   
    if [ -f $file ];then rm -f $file > /dev/null 2>&1 ; fi
 
    clear_backup
done