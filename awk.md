# 记录一下 AWK 的使用方法


## 历史

AWK是贝尔实验室1977年搞出来的文本处理工具。

之所以叫AWK是因为其取了三位创始人 Alfred Aho，Peter Weinberger, 和 Brian Kernighan 的Family Name的首字符


## Structure


"AWK is a language for processing text files. A file is treated as a sequence of records, and by default each line is a record. Each line is broken up into a sequence of fields, so we can think of the first word in a line as the first field, the second word as the second field, and so on. An AWK program is of a sequence of pattern-action statements. AWK reads the input a line at a time. A line is scanned for each pattern in the program, and for each pattern that matches, the associated action is executed." - Alfred V. Aho""


## 参考资料

* [wikipedia AWK](http://en.wikipedia.org/wiki/AWK)
* [The AWK Programming Language](http://plan9.bell-labs.com/cm/cs/awkbook/)



## 推荐

* [awk 基础](awk-base.md)  
* [awk 手册](awk-manual.md)
* [awk 主页](awk.md)


