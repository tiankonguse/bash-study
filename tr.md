# tr 简单笔记

tr 能够替换或者删除字符。  

## 替换字符

语法： `tr SET1 SET2`  

第一个参数是替换的旧字符，第二个参数是新字符。  

```
tiakonguse:~ $ date +%F
2015-05-05

tiakonguse:~ $ date +%F | tr - /
2015/05/05
```

如果`SET1`和`SET2`长度相等，则相同位置的会被替换。  
如果第二个参数长度较长，则忽略剩余的部分。  
如果第一个参数较长，则第二个参数以第一个参数的最后一个字符补齐。  

```
tiakonguse:~ $ echo "1 2 3 4 5"
1 2 3 4 5

tiakonguse:~ $ echo "1 2 3 4 5" | tr "012345" "123456"
2 3 4 5 6

tiakonguse:~ $ echo "1 2 3 4 5" | tr "012345" "123"
2 3 3 3 3

tiakonguse:~ $ echo "1 2 3 4 5" | tr "12" "234"
2 3 3 4 5
```

## 删除字符

`-d`参数用来删除字符。  

```
tiakonguse:~ $ date +%F
2015-05-05

tiakonguse:~ $ date +%F | tr -d -
20150505
```

## 补集替换

有时候我们不知道要替换的数据是什么样子，但是不要替换的数据我们知道，这个时候就可以使用`-c`参数来使用补集替换了。  

```
tiakonguse:~ $ date +%F
2015-05-05

tiakonguse:~ $ date +%F | tr -c "[0-9\n]" "_"
2015_05_05

tiakonguse:~ $ date +%D
05/05/15

tiakonguse:~ $ date +%D | tr -c "[0-9\n]" "_"
05_05_15
```

## 删除重复的字符

有时候我们替换完了，发现有重复的字符，这个时候就可以使用`-s`参数了。  

```
tiakonguse:~ $ echo "12345"
12345

tiakonguse:~ $ echo "11345" | tr "1234" "1122"
11225

tiakonguse:~ $ echo "11345" | tr -s "1234" "1122"
125

tiakonguse:~ $ echo "1122334455"
1122334455

tiakonguse:~ $ echo "1122334455" | tr -s [1-9] 
12345
```

## 字符范围

对于`tr`的参数，我们可以使用范围符号。  

```
[a-z] a-z内的字符组成的字符串。 
[A-Z] A-Z内的字符组成的字符串。 
[0-9] 数字串。 
```

```
tiakonguse:~ $ echo "12345"
12345

tiakonguse:~ $ echo "12345" | tr [1-9] [a-z]
abcde
```

## 特殊字符

```
\a Ctrl-G  铃声\007 
\b Ctrl-H  退格符\010 
\f Ctrl-L  走行换页\014 
\n Ctrl-J  新行\012 
\r Ctrl-M  回车\015 
\t Ctrl-I  tab键\011 
\v Ctrl-X  \030 
```

