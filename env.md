# 定制用户环境

## 特殊文件

当用户登录和退出一个新的 shell 时，文件 .bash\_profile, .bash\_logout, .bashrc 被 bash 所读取。


用户每次登录到系统时，.bash\_profile 中的命令会被 bash 执行。

默认在 home 目录下有这个文件。如果没有，将会读取 /etc/profile 。

.bash\_profile ,.bash\_login , .profile 文件的含义相同，只不过越靠前，优先级越高，并且只会执行一个。

启动一个子 shell 时， ,bashrc 会被执行。

退出 shell 时， .bash\_logout 会被执行。

source 执行指定文件里的命令。

## 别名

用户对命令或命令字符串所定义的同义词

alias newname=oldname

别名是可以递归的。
但是不会出现无限循环。

unalias name 可以删除定义的别名。

## 选项

对用户环境各方面的控制，可以打开和关闭它们。

基本命令 set +o optionname 或 set -o optionname .

## 变量

用名字引用的可变值。

* 按惯例，内置变量名均为大写。
* 定义变量 varname=value 
* 等号两边必须没有空格。
* 如果取值多于一个单词，必须用引号括起来。
* 要在一个命令中使用变量值，在其名字前加符号$。
* 可以用 unset varname 删除变量
* 可以使用开启 nounset 选项，使用变量前必须定义，否则出错。
* 未定义的变量默认值是 null,亦即空字符串"".

### 变量和引用

* 使用变量时可以放在双引号引的字符串中。
* 在单引号中的变量无效
* 没有引号时，shell 会在替换变量值后将字符串分成单词。

### 内置变量

#### 编辑模式变量

* HISTCMD
* HISTCONTROL
* HISTIGNORE
* HISTFILE
* HISTFILESIZE
* HISTSIZE
* FCEDIT

#### mail 变量

* MAIL
* MAILCHECK
* MAILPATH


#### 提示符变量

* \H \h 主机名
* \s shell 名字
* \d,\T,\t,\@ 时间相关
* \u 当前用户名
* \a,\e,\n,\nnn,\\ 一些转义字符 
* \w,\W 当前工作目录

#### 命令搜索路径

PATH 变量的值是一个目录列表。
目录列表有冒号(:)分隔。


#### 命令缓存

使用 哈希表 实现。


##### 目录搜索路径和变量

CDPATH 变量:默认查找位置。

#### 杂项变量

* HOME 主目录名
* SECONDS 调用 shell 的秒数
* BASH 正在运行的 shell 实例的路径名
* BASH\_VERSION 正在运行的 shell 的版本号
* BASH\_VERSINFO 正在运行的 shell 的版本信息数组
* PWD 当前目录
* OLDPWD最后一个cd命令前的目录

### 定制和子进程 

#### 环境变量

只有一种事物对所有的子进程已知，即称为环境变量的特定类型的 shell 变量。
任何一个变量都可能变成一个环境变量。使用 export varnames.
也可以定义变量为特定子进程内的变量。命令前加变量赋值。

#### 终端类型

#### 其他常用变量

#### 环境文件
.bash\_profile 一般都很小。

### 定制提示






