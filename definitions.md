# bash 中名字定义

我们先来文档的说明吧.  

```
blank  
    A space or tab.
word   
    A sequence of characters considered as a single unit by the shell.  
    Also known as a token.
name   
    A  word  consisting  only  of alphanumeric characters and underscores, 
    and beginning with an alphabetic character or an under‐score.  Also referred to as an identifier.
metacharacter 
    A character that, when unquoted, separates words.  
    One of the following: |  & ; ( ) < > space tab
control operator
    A token that performs a control function.  
    It is one of the following symbols: || & && ; ;; ( ) | |& <newline>
```


也就是 bash 中有五种名字: 空白(blank), 单词(work), 名字(name), 元字符(metacharacter), 控制操作符(control operator).  


* 空白就是空格或者tab字符.  
* 单词就是被shell看做一个单元的字符的序列.也被成为token.  
* 名字只能由字母数字和下划线组成, 而且以字母或下划线开始.也被成为标识符.  
* 元字符 当被引用时,分隔单词的字符.包含这几个`| & ; ( ) < > space tab`  
* 控制操作符 一个执行控制功能的单词(token).包含这几个 `|| & && ; ;; ( ) | |& <newline>`    


然后我们看看这几个字符的功能吧.  


* `|` 管道
* `&` 后台运行
* `;` 语句分隔符
* `( )` 内部是子shell
* `< >` 重定向输入和输出
* `||` 条件或
* `&&` 条件与
* `;;` 用在`switch`中的`case`后面,相当于c语言中的 `break`. 功能是结束`switch`.  
* `|&` 标准错误也重定向到管道,等价与 ` 2>&1 |`.  






