# wc 命令笔记  


统计文件里面有多少单词，多少行，多少字符。  


```
-l  ：仅列出行；
-w  ：仅列出多少字(英文单字)；
-m  ：多少字符；
```


```
tiankonguse@tiankonguse:~/test$ ls -l
总用量 44
-rw-rw-r-- 1 tiankonguse tiankonguse   379  3月 14 17:00 0.cpp
-rwxrwxr-x 1 tiankonguse tiankonguse 13789  3月 14 21:28 a.out
-rw-rw-r-- 1 tiankonguse tiankonguse    16  5月  6 01:06 data
-rw-r----- 1 tiankonguse tiankonguse  1269  3月 14 21:28 old.cpp
drwxrwxr-x 2 tiankonguse tiankonguse  4096  4月  7 23:38 test1
drwxrwxr-x 2 tiankonguse tiankonguse  4096  4月  7 23:39 test2
drwxrwxr-x 2 tiankonguse tiankonguse  4096  4月  7 23:39 test3
-rw-r----- 1 tiankonguse tiankonguse   993  3月 14 20:28 Untitled1.cpp

tiankonguse@tiankonguse:~/test$ ls -l | wc -l
9
```


