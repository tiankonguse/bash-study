
# windows bat

```bat
@#;// 关闭回显
@echo off

@#;// 设置颜色
color f7

@#;// 剪切板设置内容
<nul set /p x="something"| Clip



@#;// 弹出一个窗口
msg * USE CTRL+V

@#;// 打开网页
@start http://tiankonguse.com
```

