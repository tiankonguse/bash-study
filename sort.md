# sort 命令笔记  

sort 主要用于对文件的行数据进行排序。  


```
-f  ：忽略大小写的差异
-b  ：忽略最前面的空格符部分；
-n  ：使用纯数字进行排序(默认是以文字型态来排序的)；
-r  ：反向排序；
-u  ：就是uniq，相同的数据中，仅出现一行代表；
-t  ：分隔符，默认是用 [tab] 键来分隔；
-k  ：以那个区间 (field) 来进行排序的意思
```

例如  

```
tiankonguse@tiankonguse:~$ history 10 | sort -r -k1
 2007  history 10 | sort -r -k1
 2006  history 10 | sort
 2005  history --help
 2004  history -n10 | sort
 2003  history -n 10 | sort
 2002  history -n 10 }
 2001  man sort
 2000  git pull origin master 
 1999  git push origin master 
 1998  git pull origin master
```


