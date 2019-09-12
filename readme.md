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
```




