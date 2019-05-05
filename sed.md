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


## 实践

### 修改替换文件的内容  

理论知识：  
`-i` 参数用于修改文件。  
`s///` 用于替换内容  


```
for f in $(grep -r -l "../../suanfa_xiaomiquan.jpg" .)
do
    sed -i 's/..\/..\/suanfa_xiaomiquan.jpg/\/images\/suanfa_xiaomiquan.jpg/' $f
done
```


### 批量复制文件并修改后缀


这个问题的关键步骤是: 获得文件列表, 提取前缀, 一个一个copy. 


1. rename命令  

最简单的方式应该是复制到其他地方, 然后使用 [rename][] 命令.  

```
cp *.html ./test/;
cd test;
rename .html .php *.html
cp *.php ../;
```


2. xargs命令

直接复制并重名名, 这就需要使用 xargs 命令了.  
 

```
ls -1 *.html | sed "s/.html//" | xargs -i cp {}.html {}.php
```

3. 循环

当然我们也可以使用循环一个一个重命名.  

```
find *.html  | while read i
do
    preFile=`echo "$i" | sed "s/.html//"`
    cp $preFile.html $preFile.php
done
```


### 文件批量增加内容

这里我希望在所有文件的前面追加一行内容.  


```
find *.html  | while read i
do
    preFile=`echo "$i" | sed "s/.html//"`
    cat $preFile.html | sed "1 i \<?php require_once(\"./check_login.php\"); ?>" > $preFile.php
done
```


### 文本处理问sql文本

这里有这样的文本

```
年      条件
2016	c_year:2016
2015	c_year:2015
2014	c_year:2014
2013	c_year:2013
2012	c_year:2012
2011	c_year:2011
2010	c_year:2010
2009	c_year:2009
2008	c_year:2008
2007	c_year:2007
2006	c_year:2006
2005	c_year:2005
2004	c_year:2004
2003	c_year:2003
其他	!c_year:2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003
```

希望使用脚本生成sql格式插入到表中.  
表有一个自增id

```
'自增id','年','编号','条件','创建时间','修改时间','0','空'

```

```
cat in.txt | \
awk 'BEGIN{ id=1177 } { print id,$1,NR,$2; id++ } END{  }' | \
sed "s/^\([0-9]\+\) \([^ ]\+\) \([0-9]\+\) \(.\+\)/'\1','\2','\3','\4','','',0,''/"

cat in.txt | \
awk 'BEGIN{ id=1177;out="" } { out=out"+"id; id++ } END{ print out }'
```


## leetcode 题目处理

```
cat all.json | sed 's/"stat"/\n/g' | grep -E "question__title_slug"  | sed 's/^.*"question__title_slug": "\([^"]\+\)".*"frontend_question_id": \([0-9]\+\).*$/\1 \2/'
```


参考资料  [sed 学习笔记](http://tiankonguse.com/record/record.php?id=638)

