# bash 变量

## 变量定义  

* 定义常量 `declare -r var` 或者 `readonly var`  
* 定义数字变量 `declare -i number`  
* 定义数组 `declare -a array`  
* 定义函数 `declare -f function`
* 定义全局变量 `declare -x var`

## 变量引用

* 强引用 `"${var}"` 变量替换，防止单词分割  
* 弱引用 `'${var}'` 不进行变量替换  

## 变量赋值  

* 使用`=`, 例如 `a="xxx"`
* 使用`$()`, 例如 `a=$(uname -m)`

## 变量间接引用

* a变量的值是b变量的名字

```
a=letter_of_alphabet
letter_of_alphabet=z
eval a=\$$a
echo "Now a = $a" # Now a=z
```

* 引用位置参数

```
args=$# #位置参数个数
lastarg=${!args} 
lastarg=${!#}
```

## 常用变量  

* 命令行参数 `$0 $1 ... $10`
* 命令行或位置参数的个数 `$#`
* 所有位置参数，作为一个单词，必须被`""`引用 `$*`
* 同`$*`, 但每个参数都是一个独立的引用 `$@`
* 在后台运行的最后的工作的PID `$!`
* 保存之前执行的命令的最后一个参数 `$_`
* 命令，函数或者脚本本身的退出状态 `$?`
* 脚本自身继承ID, 常用来构造临时唯一文件名 `$$`
* 当前函数的名字 `FUNCNAME`
* 当前行号 `LINENO`


## 数组使用

```
#定义数组
declare -a names

#给数组赋值
names[0]="tiankonguse"
names[1]="shen1000"

#获取长度
echo ${#names[@]}

#遍历数组
for i in ${!names[@]}
do
    echo "$i : ${names[$i]}"
done
```


## 对象map使用


```
#定义对象
declare -A namemap

#给对象赋值
namemap["tiankonguse"]="hello"
namemap["shen1000"]="word"

#得到长度
echo ${#namemap[@]}

#遍历对象
for i in ${!namemap[@]}
do
    echo "$i : ${namemap[$i]}"
done
```


## 注意事项

* 变量时不区分类别的
* 使用 `${var}`， 而不是 `$var`  
* `"${var}"` 与 `${var}` 的区别
* 赋值前后一定不要有空格
