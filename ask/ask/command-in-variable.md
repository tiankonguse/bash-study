<h1>变量中的命令</h1>


<h2>命令保存在变量中</h2>

直接当做字符串保存即可。

例如：

<pre>
    v="ls";
    echo $v;
</pre>

执行后，是直接把字符串输出的

<pre>
tiankonguse@tiankonguse:~/github/bash-study/test$ ./c-i-v.1.0.sh 
ls
</pre>


<h2>执行变量中的命令</h2>

直接调用即可。

<pre>
    v="ls";
    $v;
</pre>

执行后，输出的是执行命令后输出的内容

<pre>
    tiankonguse@tiankonguse:~/github/bash-study/test$ ./c-i-v.1.1.sh 
    c-i-v.1.0.sh  c-i-v.1.1.sh
</pre>






