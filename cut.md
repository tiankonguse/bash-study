# cut 命令笔记  

从文本的每一行中删除一部分内容  


```
-d  ：后面接分隔字符。与 -f 一起使用；
-f  ：依据 -d 的分隔字符将一段信息分割成为数段，用 -f 取出第几段的意思；
-c  ：以字符 (characters) 的单位取出固定字符区间；
```

例如  

```
/home/tiankonguse/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
tiankonguse@tiankonguse:~/test$ echo $PATH | cut -d ':' -f 1
/home/tiankonguse/bin
```

`-f`参数只有一个数字代表筛选第几个。  
需要筛选多个时，使用逗号分割，区间使用连接符`-`， 连接符后面没有数字代表指定数字到最后一个。  


