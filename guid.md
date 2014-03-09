
shell 的任务是将用户的命令翻译成系统指令。

### 判断使用的shell的版本:

````
tiankonguse@tiankonguse-PC:~$ echo $SHELL
/bin/bash
````
### 查看 bash 在系统上的位置


````
tiankonguse@tiankonguse-PC:~$ whereis bash
bash: /bin/bash /etc/bash.bashrc /usr/share/man/man1/bash.1.gz
````
或


````
tiankonguse@tiankonguse-PC:~$ which bash
/bin/bash
````
或者


````
tiankonguse@tiankonguse-PC:~$ grep bash /etc/passwd | awk -F: '{print $7}' | sort -u
/bin/bash
````

### 将 bash 设置为登录的默认shell

````
tiankonguse@tiankonguse-PC:~$ chsh
Password: 
Changing the login shell for tiankonguse
Enter the new value, or press ENTER for the default Login Shell \[/bin/bash]: /bin/bash
````
或者

````
tiankonguse@tiankonguse-PC:~$ chsh -s /bin/bash
Password:
````






