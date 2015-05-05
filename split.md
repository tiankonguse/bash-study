# split 命令笔记  

分割文件成多份。  


语法` [OPTION]... [INPUT [PREFIX]]`

常用参数如下  

```
-b 每个文件的大小
-d 使用数字后缀(默认前缀是字符)
-l 每个文件输出指定行
```

例如  

```
tiankonguse@tiankonguse:~$ split -b 1k -d test.txt  test

tiankonguse@tiankonguse:~$ ll test*
-rw-rw-r-- 1 tiankonguse tiankonguse 1024  5月  6 01:31 test00
-rw-rw-r-- 1 tiankonguse tiankonguse  381  5月  6 01:31 test01
-rw-rw-r-- 1 tiankonguse tiankonguse 1405  4月 17 02:29 test.txt
```

