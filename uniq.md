# uniq 命令笔记

统计或删除重复的行  

常用参数如下  


```
-i  忽略大小写字符的不同；
-c  进行计数
-u  只显示唯一的行
-d  只显示重复的行 
```

例如  

```
tiankonguse@tiankonguse:~/test$ cat data 
1
1
2
2
3
3
4
5
tiankonguse@tiankonguse:~/test$ cat data | uniq
1
2
3
4
5
tiankonguse@tiankonguse:~/test$ cat data | uniq -c
      2 1
      2 2
      2 3
      1 4
      1 5
tiankonguse@tiankonguse:~/test$ cat data | uniq -c -u
      1 4
      1 5

```

