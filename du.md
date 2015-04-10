# du 命令


du 命令主要用于估计文件(目录也是文件)的大小。  



## 基本命令

`-a` 或 `--all` 列出所有文件的大小。 

默认只显示目录的大小。  


```
tiankonguse@tiankonguse:~$ du  千与千寻.rmvb
1717752 千与千寻.rmvb
```


## 显示大小单位

`-h` 或 `--human-readable` 自动输出可读大小单位  

`-k` 以`K`为单位输出, 等价与 `--block-size=1K`  
`-m` 以`M`为单位输出, 等价与 `--block-size=1M`  

`-B[KMGTPEZY]` 或 `--block-size=[KMGTPEZY]` 显示指定大小单位  


```
1K=2^10B 
1M=2^10K 
1G=2^10M 
...
```

例如  

```
tiankonguse@tiankonguse:~$ du  -h 千与千寻.rmvb
1.7G    千与千寻.rmvb

tiankonguse@tiankonguse:~$ du -b 千与千寻.rmvb
1758971344  千与千寻.rmvb

tiankonguse@tiankonguse:~$ du -BK 千与千寻.rmvb
1717752K    千与千寻.rmvb
tiankonguse@tiankonguse:~$ du -k 千与千寻.rmvb
1717752 千与千寻.rmvb

tiankonguse@tiankonguse:~$ du  -BM 千与千寻.rmvb
1678M   千与千寻.rmvb
tiankonguse@tiankonguse:~$ du -m 千与千寻.rmvb
1678    千与千寻.rmvb

tiankonguse@tiankonguse:~$ du  -BG 千与千寻.rmvb
2G  千与千寻.rmvb

tiankonguse@tiankonguse:~$ du  -BT 千与千寻.rmvb
1T  千与千寻.rmvb
```


## 目录指定层数


`-dN` 和 `--max-depth=N` 参数可以设置目录递归层数。 

`N`是非负数字，代表层数。  
  


`N`为0时，可以输出当前目录的大小  


有时候只需要显示当前目录的大小时，可以使用 `-s` 和 `--summarize` 参数。  

这个参数显示文件或目录的总大小，等价与 `--max-depth=0`  

例如  

```
tiankonguse@tiankonguse:~$ du -d1 github
3264    github/firstblog
2880    github/bcloud
187792  github/common
50248   github/record
35024   github/mythbox
14816   github/tiankonguse.github.io
29912   github/.vim
208820  github/empty
549708  github/ACM
137448  github/lab
332 github/gedit-source-code-browser
1220248 github

tiankonguse@tiankonguse:~$ du -d0 github
1220248 github


tiankonguse@tiankonguse:~$ du -s github
1220248 github

```

## 符号连接

`-L` 和 `--dereference` 可以指定是否显示符号链接的大小。  


```
# test2 是目录软链接
# test2.md 是文件软链接
# test3,md 是文件硬链接
tiankonguse@tiankonguse:~/test$ ll -h test1
总用量 16K
drwxrwxr-x 2 tiankonguse tiankonguse 4.0K  4月  7 23:38 ./
drwxrwxr-x 5 tiankonguse tiankonguse 4.0K  4月  7 23:39 ../
-rw-rw-r-- 1 tiankonguse tiankonguse  100  4月  7 23:38 test1.md
lrwxrwxrwx 1 tiankonguse tiankonguse   28  4月  7 23:28 test2 -> /home/tiankonguse/test/test2/
lrwxrwxrwx 1 tiankonguse tiankonguse   37  4月  7 23:28 test2.md -> /home/tiankonguse/test/test2/test2.md
-rw-rw-r-- 2 tiankonguse tiankonguse  376  4月  7 23:39 test3.md

#默认不显示文件和符号链接
tiankonguse@tiankonguse:~/test$ du -h test1
12K test1

# 加 -L 参数显示目录的软链接大小
tiankonguse@tiankonguse:~/test$ du -h -L test1
4.0K    test1/test2
20K test1

# -a 显示所有文件和目录，但是软链接的大小为0 
# 一个文件4K, 总共12K.  
tiankonguse@tiankonguse:~/test$ du -h -a test1
4.0K    test1/test1.md
4.0K    test1/test3.md
0   test1/test2.md
0   test1/test2
12K test1

# 显示软链接大小
# 一个文件4K, 总共20K
tiankonguse@tiankonguse:~/test$ du -h -L -a test1
4.0K    test1/test1.md
4.0K    test1/test3.md
4.0K    test1/test2.md
4.0K    test1/test2
20K test1

# -S 参数不包含子目录大小
tiankonguse@tiankonguse:~/test$ du -h -L -a -S test1
4.0K    test1/test1.md
4.0K    test1/test3.md
4.0K    test1/test2.md
4.0K    test1/test2
16K test1

# -c 参数显示所有目录或文件的总和
tiankonguse@tiankonguse:~/test$ du -h -L -a -S -c test1
4.0K    test1/test1.md
4.0K    test1/test3.md
4.0K    test1/test2.md
4.0K    test1/test2
16K test1
20K 总用量
```






[iamlaosong_7085178]: http://blog.csdn.net/iamlaosong/article/details/7085178
