# expect 命令笔记

expect　命令常用来做一些需要输入密码的事情。  
比如我们登录ssh, 我们scp传文件，一般需要传入密码，这个时候　expect 就可以帮我们的忙了。  


## 自动登录 scp

```
expect -c "
  spawn scp test.md tiankonguse@127.0.0.1:/home/tiankonguse/test/ 
  expect {
    \"*assword\" {set timeout 300; send \"password\r\";}
    \"yes/no\" {send \"yes\r\"; exp_continue;}
  }
expect eof"
```

## 自动登录 ssh


```
expect -c "
spawn ssh tiankonguse@127.0.0.1 \"ls;\"
expect {
    \"*assword\" {set timeout 300; send \"password\r\";}
    \"yes/no\" {send \"yes\r\"; exp_continue;}
      }
expect eof"
```



