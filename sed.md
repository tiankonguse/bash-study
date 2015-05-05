# sed 简单笔记

sed 是一个很强大的处理字符串的命令, 核心功能是过滤和替换。  

这里简单记录一下。  


## 替换  

语法： `s/regexp/replacement/`

例如下面的替换行首空白和行尾空白的命令。  

```
skyyuan:~ $ echo "   123   "
   123   
skyyuan:~ $ echo "   123   " | wc -c
10

skyyuan:~ $ echo "   123   " | sed 's/^\s*//g'
123   
skyyuan:~ $ echo "   123   " | sed 's/^\s*//g' | wc -c
7

skyyuan:~ $ echo "   123   " | sed 's/\s*$//g'
   123
skyyuan:~ $ echo "   123   " | sed 's/\s*$//g' | wc -c
7

skyyuan:~ $ echo "   123   " | sed 's/^\s*\|\s*$//g'
123
skyyuan:~ $ echo "   123   " | sed 's/^\s*\|\s*$//g' | wc -c
4
```


上面的替换内容是空，我们可以换成其他的来使效果更明显些。  

例如在字符串的前后都加上一个特殊符号，来区分开头语结尾。  

```
skyyuan:~ $ echo "   123   " | sed 's/^\|$/|/g'
|   123   |
```

### 正则表达式

由于这里是介绍sed的，所以这里不详细讲解正则表达式了。  
这里简单的罗列出基本的sed中的正则符号。  

* `^`  代表行首
* `$`  代表行尾
* `\|` 代表或者，只要满足一个就行了
* `\+` 代表至少一个
* `*` 代表可以没有，或者有多个
* `[]` 范围内只要满足一个即可
* `[^]` 不在范围内的所有的都符合条件
* `\{n,m\}` 至少满足n个，至多m个。  
* `.` 代表任意字符


## 文件处理参数

实际上sed主要是用来处理文本文件的，所以大部分命令是对行操作的。  


*  `n` 禁止input stream的输出。
*  `p` 打印匹配行
*  `s/regexp/replacement/` 替换模式
*  `d` 删除指定行
*  `=` 输出行号
*  `a`  追加内容
*  `i`  插入内容
*  `q` 匹配的第一个完成后退出
*  `r` 从一个文件读内容并添加到最后
*  `R` 从一个文件读取内容

例如下面的例子  

```
cat input | sed -n '1p'  #输出第一行
cat input | sed -n '$='  #输出最后一行行号
cat input | sed -n '/3/'p #打印含有3的行
cat input | sed -n '1~2'p #打印奇数行
cat input | sed    '2,2'd #删除偶数行
cat input | sed   '5,7 s/^/\t/' #5至7行缩进
```

参考资料  [sed 学习笔记](http://tiankonguse.com/record/record.php?id=638)

