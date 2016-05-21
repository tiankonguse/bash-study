# rename 简单笔记

rename 可以把输入的文件列表按照指定格式重命名.  



语法: rename from to file

例如修改后缀

```
rename .html .php *.html
```

例如文件名的数字加前缀0.  


```

> ls -1 *.php
test1.php
test11.php
test111.php

> rename test test0 test?.php 
> ls -1 *.php                
test01.php
test11.php
test111.php

> rename test test0 test??.php
> ls -1 *.php                 
test001.php
test011.php
test111.php
```









