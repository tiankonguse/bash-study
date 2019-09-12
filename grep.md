# grep 搜索


## 一、基本语法  


功能：搜索符合预期的内容。  


```
#语法  
grep content path
```


## 二、常用参数  


### 1、目录递归


参数：`-r`  


遍历所有符号链接：`-R`  


```
--include=FILE_PATTERN  只查找匹配FILE_PATTERN 的文件
--exclude=FILE_PATTERN  跳过匹配FILE_PATTERN 的文件和目录
--exclude-from=FILE   跳过所有除FILE 以外的文件
--exclude-dir=PATTERN  跳过所有匹配PATTERN 的目录。
```


### 2、显示行号  


参数：`-n`


### 3、文件名控制

输出文件名和内容：`-H`  
不输出文件名只输出内容：`-h`
只输出文件名：`-l`  
只输出不匹配的文件名：`-L`


### 4、匹配的不显示  

参数：`-v`  


### 5、输出更多内容  


输出匹配行数之前的若干行内容：`-B num`  
输出匹配行数之后的若干行内容：`-A num`  


### 6、高亮匹配  


参数：`--color`  


### 7、正则搜索  


启用扩展正则表达式：`-E`  
启用基本正则表达式：`-G`
启用 Perl 正则表达式：`-P`  
忽略大小写：`-i`  





