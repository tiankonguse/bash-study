# BASH STUDY

这个项目目的在于学习 bash.

#说明

由于初学shell,所以进程管理和系统级shell 没有记录。

#历史

* 2014.3,读了 《学习 bash》第二版。
* 2014.3.14,建立目录框架
* 2014.3.28,增加了 awk,windows bat, python 脚本。

## 目录

*  [入门简介](<introduction.md>)
*  [函数与字符串](<base.md>)
*  [shell环境编辑介绍](<edite.md>)
*  [shell环境查看与配置](<guid.md>)
*  [类型](<type.md>)
*  [各种变量介绍](<variable.md>)
*  [shell 常见命令含义](<command.md>)
*  [shell 配置文件](<env.md>)
*  [shell 流程控制简介](<process.md>)
*  [awk 学习笔记](awk.md)
*  [windows bat 学习笔记](bat.md)
*  [python 学习笔记](python.md)


## 快捷笔记



### seq 生成序列

语法：`seq 首数 [增量] 末数`

```
# 输出奇数
seq 1 2 10
```


### 循环 for


```
for ((i = 0; i < 10; i++)); do echo $i; done

for x (1 2 3); do echo $x; done
for x in 1 2 3; do echo $x; done

d=(1 2 3)   
for x in $d; do print $x; done
for x ($d); do print $x; done

for i in {1..10}; do print $i; done
for x ({1..10}); do print $x; done

for i in {1..10..2}; do print $i; done
for x ({2..10..2}); do print $x; done

for x ("("{0..4..2}","{a..c}")"); do print $x; done
```


### ssh 免密登陆


1、 本地生成密钥


```
ssh-keygen -t rsa -C "email@xxx.com"
ssh-add ~/.ssh/id_rsa
```


2、本地配置免密登陆  

打开配置文件：`~/.ssh/config`  


配置下面的内容


```
Host remote
HostName 192.168.0.1
User tiankonguse
Port 22
ServerAliveInterval 10
ControlMaster auto
IdentityFile ~/.ssh/id_rsa
```

设置权限：`chmod 600 ~/.ssh/config`


3、远程主机配置

将`~/.ssh/id_rsa.pub` 上传到远程主机。

执行：`cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys`


4、本地测试免密登陆

```
ssh tiankonguse@192.168.0.1
```


### ssh 别名登陆

第一步：在 `~/.ssh/config` 目录创建别名

大概如下

```
Host one
    HostName 192.168.0.1
    Port 22
    User tiankonguse
    ServerAliveInterval 10
    ControlMaster auto
    IdentityFile ~/.ssh/id_rsa_tiankonguse

Host two
    HostName 192.168.0.2
    Port 22
    User tiankonguse
    ServerAliveInterval 10
    ControlMaster auto
    IdentityFile ~/.ssh/id_rsa_tiankonguse
```

登陆命令：`ssh one`



## 实战


### 1、批量替换指定文件的指定内容


涉及知识点：[基础语法](introduction.md)、[grep 数据搜索](grep.md)、[awk 数据提取](awk.md)、[sed 数据修改](sed.md)。  


```
# 当然， grep 可以直接得到文件名的，这里作为演戏，先得到默认的匹配内容，然后使用awk处理得到文件名

for l in $(grep -r res.tiankonguse . | grep "res.tiankonguse.com/images/2019/0[1-8]")
do
    f=$(echo $l | awk -F: '{print $1}')
    echo "begin replease $f"
    sed -i 's/res.tiankonguse.com/res2019.tiankonguse.com/' $f
done

Mac： sed -i "" 's/res.tiankonguse.com/res2020.tiankonguse.com/' $f
linux： sed -i 's/res.tiankonguse.com/res2020.tiankonguse.com/' $f


```




