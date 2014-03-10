# 流程控制

## if/else

如果某条件为真/假，执行一个语句列表。

### 语法
````
if condition
then
    statements
elif
    statement
else
    statements
fi
````
### 退出状态和返回

条件实际上是语句列表而不是一般的布尔表达式。

每个UNIX 命令，当其结束时都对其调用进程返回一个整数值。这称为退出状态。

if 检查条件中语句列表中的最后一个语句的退出状态。0则真，其它的则假。


builtin 告诉 shell 使用内置命令并忽略该名字的任何函数。

$? 为运行的最后一个命令的退出状态。


#### 返回

return N 结束函数

exit N 退出整个脚本


#### 组合退出状态


且 && 

或 ||

非 !


### 条件测试

shell 使用\[] 结构提供了测试各种条件的方式,称为test测试。

可以使用该结构检验一个文件的各种属性(是否存在，文件类型，权限和所有者)，或比较两个文件那个更新，以及对字符串进行比较。

\[ 和  ] 的后和前必须有空格。 

#### 字符串比较

* == 匹配
* != 不匹配
* < 小于
* \> 大于
* -n str 为null,长度大于0
* -z str 为null,长度为0

分号是 shell 的标准语句分隔字符。


#### 文件属性检查

* -d file file存在并且为一个目录
* -e file file存在
* -f file file存在并且为一个正规文件
* -r file 对 file 有读权限
* -s file 文件存在且非空
* -w file 对 file 有写权限
* -x file 对file有可执行权限，如果为目录，则有目录搜索权限
* -O file 你是file的所有者
* -G file file的组ID匹配你的ID
* file1 -nt file2 file1比file2新
* file1 -ot file2 file1比file2旧

-a 和 -o 操作符类似于退出状态时所用的 && 和 ｜｜ 操作符。只有在test条件表达式内可用。

#### 整数条件

* -lt 小于
* -le 小于等于
* -eq 等于
* -ge 大于等于
* -gt 大于
* -ne 不等于


## for

````
for name \[in list]
do
    statement
done
````

in list 默认为 $@.

command 是 shell 内置命令，它屏蔽函数和别名查找。

## case

类似与 switch语句。

````
case expression in
    pattern1)
        statements;;
    pattern12)
        statements;;
esac
````

## select


````
select WORD \[in LIST]; 
do
    RESPECTIVE-COMMANDS; 
done
````

## while 和 until

### while 语法

````
while condition
do
    statements;;
done
````


### until 语法

````
until command; do
    statements;;
done
````







