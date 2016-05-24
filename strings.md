# strings 简单笔记


print the strings of printable characters in files.  
打印出文件中可以打印的字符串.  

默认打印条件:  

* at least 4 characters long(最少四个字符)  `-min-len`,`-n min-len`,`--bytes=min-len`指定长度  
* the initialized and loaded sections of object files(object文件只输出initialized段和loaded段) `-a`,`--all`,`-`扫描所有段  

