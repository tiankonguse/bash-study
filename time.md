# shell 时间相关笔记

时间主要是 date 和 time 命令。  

## date

date 主要用于查询或者设置系统日期和时间。  


```
tiankonguse:~ $ date
Tue May  5 11:02:34 CST 2015
```

### 输出时间

输出日期时间了，当然有一大堆的格式问题了。  

基本格式是 `date [+FORMAT]`  

其中 `FORMAT` 默认是普通文本， 可以使用`%`转义来输出指定数据。  

比如`%Y`代表年，`%m`代表月，`%d`代表天等等吧  

```
tiankonguse:~ $ date +"%Y-%m-%d %H:%M:%S"
2015-05-05 11:11:41
```

核心转义数据如下  

* %%     普通字符百分号`%`
* %a     缩写的星期几(e.g., Sun)
* %A     完整的星期几 (e.g., Sunday)
* %b     缩写的月份 (e.g., Jan)
* %B     完整的月份 (e.g., January)
* %c     本地日期时间 (e.g., Thu Mar  3 23:05:25 2005)
* %d     本月中带有前缀0的天 (e.g, 01)
* %D     日期，等价于 `%m/%d/%y`
* %F     日期，等价于 `%Y-%m-%d`
* %H     hour (00..23)
* %I     hour (01..12)
* %j     day of year (001..366)
* %k     hour ( 0..23)
* %l     hour ( 1..12)
* %m     month (01..12)
* %M     minute (00..59)
* %s     seconds since 1970-01-01 00:00:00 UTC
* %S     second (00..60)
* %T     time; same as %H:%M:%S
* %Y     year

### 设置时间

设置时间格式很简单  

```
date MMDDhhmm[YY]
```
关于设置系统时间的内容，这里就不详细展开了。  



## time

time主要用于统计命令或者资源的使用情况。  

比如  

```
tiankonguse:~ $ time

real	0m0.000s
user	0m0.000s
sys	0m0.000s

tiankonguse:~ $ time ls

real	0m0.005s
user	0m0.000s
sys	0m0.004s
```

根据字面意思就可以知道，分别是真实运行时间，用户运行时间，系统运行时间。  

关于这三个时间，这里就不详细展开了。  



