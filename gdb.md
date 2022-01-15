# GDB


## 生成 core 文件


```
gcore $PID
```


## 打印所有线程堆栈  

```
gstack $PID
```


## 挂 core


```
gdb ./filename core
```



## 查看堆栈  


```
backtrace
bt
```


## 打断点  


```
b 符号
b fun
b file:linenum
```

## 切换堆栈


```
select-frame
frame 编号
f 编号
up-silently
up
down-silently
down
```

## 查看当前栈层信息  


会打印出这些信息：栈的层编号，当前的函数名，函数参数值，函数所在文件及行号，函数执行到的语句。

```
info frame
info f
```

## 查看函数参数  


```
info args
info functions
```


## 查看局部变量  

```
info locals
info variables
```


## 打印异常信息  


```
info catch
```

## 指定源码位置 

```
directory
dir
show directories
```


## 显示源码  


```
list 显示当前行后面的源程序
list - 显示当前行前面的源程序。
set listsize 设置一次显示源代码的行数。
show listsize 查看当前listsize的设置。
```

## 反汇编  


```
disassemble func
```

## 打印


* x 按十六进制格式显示变量。
* d 按十进制格式显示变量。
* u 按十六进制格式显示无符号整型。
* o 按八进制格式显示变量。
* t 按二进制格式显示变量。
* a 按十六进制格式显示变量。
* c 按字符格式显示变量。
* f 按浮点数格式显示变量。

```
p file::variable
p function::variable

p 'f2.c'::x
p *array@len
p/a i
```

## 查看内存  


* n 是一个正整数，表示显示内存的长度，也就是说从当前地址向后显示几个地址的内容。
* f 表示显示的格式，参见上面。如果地址所指的是字符串，那么格式可以是s，如果地十是指令地址，那么格式可以是i。
* u 表示从当前地址往后请求的字节数，如果不指定的话，GDB默认是4个bytes。


u参数可以用下面的字符来代替，b表示单字节，h表示双字节，w表示四字节，g表示八字节。


```
x/3uh 0x54320
```

## 自动显示

```
display/i $pc
undisplay
delete display
disable display
enable display
```

## 设置显示选项

```
打开地址输出，当程序显示函数信息时，GDB会显出函数的参数地址。系统默认为打开的
set print address
set print address on 
show print address

打开数组显示，打开后当数组显示时，每个元素占一行，如果不打开的话，每个元素则以逗号分隔。这个选项默认是关闭的。
set print array on
show print array

如果你的数组太大了，那么就可以指定一个来指定数据显示的最大长度，当到达这个长度时，GDB就不再往下显示了。如果设置为0，则表示不限制。
set print elements
show print elements

那么当显示字符串时，遇到结束符则停止显示。这个选项默认为off。
set print null-stop

打开printf pretty这个选项，那么当GDB显示结构体时会比较漂亮
set print pretty on

设置显示结构体时，是否显式其内的联合体数据
set print union

在C++中，如果一个对象指针指向其派生类，如果打开这个选项，GDB会自动按照虚方法调用的规则显示输出，如果关闭这个选项的话，GDB就不管虚函数表了。这个选项默认是off。
set print object

这个选项表示，当显示一个C++对象中的内容是，是否显示其中的静态数据成员。默认是on。
set print static-members

当此选项打开时，GDB将用比较规整的格式来显示虚函数表时。其默认是关闭的。
set print vtbl
```

## 寄存器


```
查看寄存器的情况。（除了浮点寄存器）
info registers


查看所有寄存器的情况。（包括浮点寄存器）
info all-registers

打印指定寄存器
p $eip
```


## 修改变量值


```
 print x=4
```

## 跳转执行

```
jump 内存地址
set $pc = 0x485
```


## 产生信号量


```
signal  val
```


## 强制调用函数


```
cal 
```