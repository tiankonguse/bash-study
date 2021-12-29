# netstat

Print network status.  


netstat - Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships  
netstat 命令用于显示各种网络相关信息，如网络连接，路由表，接口状态 (Interface Statistics)，masquerade 连接，多播成员 (Multicast Memberships) 等等。  



## 已过期

This program is obsolete.    


Replacement for netstat is ss.  
Replacement for netstat -r is ip route（路由表）.   
Replacement for netstat  -i  is  ip  -s  link (接口状态).
Replacement for netstat -g is ip maddr(多播成员).


## HELP

```
usage: netstat [-vWeenNcCF] [<Af>] -r         netstat {-V|--version|-h|--help}
       netstat [-vWnNcaeol] [<Socket> ...]
       netstat { [-vWeenNac] -I[<Iface>] | [-veenNac] -i | [-cnNe] -M | -s [-6tuw] } [delay]

        -r, --route              display routing table
        -I, --interfaces=<Iface> display interface table for <Iface>
        -i, --interfaces         display interface table
        -g, --groups             display multicast group memberships
        -s, --statistics         display networking statistics (like SNMP)
        -M, --masquerade         display masqueraded connections

        -v, --verbose            be verbose
        -W, --wide               don't truncate IP addresses
        -n, --numeric            don't resolve names
        --numeric-hosts          don't resolve host names
        --numeric-ports          don't resolve port names
        --numeric-users          don't resolve user names
        -N, --symbolic           resolve hardware names
        -e, --extend             display other/more information
        -p, --programs           display PID/Program name for sockets
        -o, --timers             display timers
        -c, --continuous         continuous listing

        -l, --listening          display listening server sockets
        -a, --all                display all sockets (default: connected)
        -F, --fib                display Forwarding Information Base (default)
        -C, --cache              display routing cache instead of FIB
        -Z, --context            display SELinux security context for sockets

  <Socket>={-t|--tcp} {-u|--udp} {-U|--udplite} {-S|--sctp} {-w|--raw}
           {-x|--unix} --ax25 --ipx --netrom
  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: inet
  List of possible address families (which support routing):
    inet (DARPA Internet) inet6 (IPv6) ax25 (AMPR AX.25) 
    netrom (AMPR NET/ROM) ipx (Novell IPX) ddp (Appletalk DDP) 
    x25 (CCITT X.25)
```

## 参数说明

* -a (all)显示所有选项，默认不显示LISTEN相关
* -t (tcp)仅显示tcp相关选项
* -u (udp)仅显示udp相关选项
* -n 拒绝显示别名，能显示数字的全部转化成数字。
* -l 仅列出有在 Listen (监听) 的服務状态
* -p 显示建立相关链接的程序名
* -r 显示路由信息，路由表
* -e 显示扩展信息，例如uid等
* -s 按各个协议进行统计
* -c 每隔一个固定时间，执行该netstat命令


## 实用命令

* 列出所有端口 netstat -a
* 列出所有 tcp 端口 netstat -at
* 列出所有 udp 端口 netstat -au
* 只显示监听端口 netstat -l
* 只列出所有监听 tcp 端口 netstat -lt
* 只列出所有监听 udp 端口 netstat -lu
* 只列出所有监听 UNIX 端口 netstat -lx
* 显示所有端口的统计信息 netstat -s
* 显示 TCP 或 UDP 端口的统计信息 netstat -st 或 -su
* 显示核心路由信息 netstat -r
* 找出程序运行的端口 netstat -ap | grep 程序名
* TCP各种状态列表 netstat -nat |awk '{print $6}'|sort|uniq -c'


## 常见结构解释  


### RtoAlgorithm


用于计算RTO的算法	


RTO算法遵循RFC2698，对应值为1.


### RtoMin


限定RTO的最小值


使用常量HZ/5限定，即200ms


### RtoMax


限定RTO的最大值


使用常量120HZ限定，即120s


### MaxConn


TCP流数量的上限


并不会在协议栈层限制，默认值为-1


### ActiveOpens	


CLOSE => SYN-SENT次数，可理解为主动建联数


在tcp_connect()函数中计数，相当于SYN包的发送次数(但不包含重传次数)


### PassiveOpens


LISTEN => SYN-RECV次数，可理解为被动建联数


实现上则是在三次握手成功后，建立tcp_sock结构体后才加1。在tcp_create_openreq_child()函数中调用


### AttemptFails


SYN-SENT => CLOSE次数
加上SYN-RECV => CLOSE次数
加上SYN-RECV => LISTEN次数
建联失败的次数

回CLOSE部分在tcp_done()函数中计数，
回LISTEN部分在tcp_check_req()中计数



### EstabResets	

ESTABLISHED => CLOSE次数
加上CLOSE-WAIT => CLOSE次数
这些情况，基本都是reset导致的

在tcp_set_state()函数中，如果之前的状态是
TCP_CLOSE_WAIT或TCP_ESTABLISHED就加1


### CurrEstab

ESTABLISHED和CLOSE-WAIT状态的TCP流数

在tcp_set_state()中处理，实现体现的是进入ESTABLISHED之后，进入CLOSE之前的TCP流数


### InSegs

所有收到的TCP包，即使是个错误包

在tcp_v4_rcv()和tcp_v6_rcv()中计数


### OutSegs

所有发送出去的TCP包。包括新数据包、重传数据包、syn包、synack包和reset包

tcp_v4_send_reset()中统计reset包
tcp_v4_send_ack()中统计SYN-RECV和TIME-WAIT状态下发送的ACK包
tcp_v6_send_response()中统计ipv6相应数据
tcp_make_synack()中统计发送的SYNACK包
tcp_transmit_skb()中统计所有的其他包


### RetransSegs

所有重传出去的TCP包

tcp_v4_rtx_synack()和tcp_v6_rtx_synack()中统计重传的SYNACK包，tcp_retransmit_skb()中统计其他重传包


### InErrs

所有收到的有问题的TCP包数量，比如checksum有问题

tcp_validate_incoming()中统计seq有问题的包
tcp_rcv_established()、tcp_v4_do_rcv()、tcp_v4_rcv()、tcp_v6_do_rcv()、tcp_v6_rcv()中根据checksum来判断出错误包


### OutRsts

发送的带RST标记的TCP包数量

在tcp_v4_send_reset()、tcp_send_active_reset()、tcp_v6_send_response()中统计


### InCsumErrors

checksum有问题的数据包数量
是3.10相对于2.6.32新增的内容，算是细化InErrs统计
