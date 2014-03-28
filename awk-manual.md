# AWK 手册

学习一个东西，首先需要看手册。
下面来看看这个手册吧。



## NAME

```text
       gawk - pattern scanning and processing language
       gawk 是一种扫描和处理模式的语言。
```

## SYNOPSIS

```text
       gawk [ POSIX or GNU style options ] -f program-file [ -- ] file ...
       gawk [ POSIX or GNU style options ] [ -- ] program-text file ...

       pgawk [ POSIX or GNU style options ] -f program-file [ -- ] file ...
       pgawk [ POSIX or GNU style options ] [ -- ] program-text file ...
```

## DESCRIPTION

```text
       Gawk  is  the  GNU Project's implementation of the AWK programming language.  
       GAWK是GNU项目的实施AWK编程语言。

        It conforms to the definition of the language in the POSIX 1003.2 Command Language And Utilities Standard.  

       它符合POSIX1003.2命令语言和实用程序标准语言的定义。
	   
	   This version in turn is based on the description in The AWK Programming Language, by Aho, Kernighan, and Weinberger, with the additional features found in the System V Release 4 version of UNIX awk.  
	   这个版本是基于 Aho, Kernighan, 和 Weinberger 的AWK编程语言 而在系统V版本4的UNIX版本中附加了一些新功能的awk。
	   
	   Gawk also provides more recent Bell Laboratories awk extensions, and a number of GNU-specific extensions.
	   gawk中还提供了更近的贝尔实验室awk的扩展，以及一些GNU特定的扩展。

       Pgawk is the profiling version of gawk.  
	   Pgawk是gawk中的分析版本。
	   
	   It is identical in every way to gawk, except that programs run more slowly, and it automatically produces an execution profile in the file awkprof.out when done. 
	   它在各方面都和 gawk 相同，除了程序运行的比较慢和当它运行结束时，会自动生成一个名字是 awkprof.out 的可执行程序。
	   
	   See the --profile option, below.
	   看下面的 --profile 选项。

       The command line consists of options to gawk itself, the AWK program text (if not supplied via the -f or --file options), and values to be made available in the ARGC and ARGV pre-defined AWK variables.
	   命令的选项包含 gawk 本身、 awk 程序文本(如果没有提供 -f 或 --file 选项) 和在 argc和argv 预定义的AWK变量的值。
```

## OPTION FORMAT

```text
        Gawk options may be either traditional POSIX one letter options, or GNU style long options. 
	   gawk的选项可以是传统的POSIX一个字母的选项，也可以是GNU风格的长选项。

	   POSIX options start with a single "-", while long options start with "--".  
	   POSIX选项开始为“ - ”，而长选项开始为“ - ”。
	   
	   Long options are provided for both GNU-specific features  and  for  POSIX-mandated  features.
	   长选项支持GNU特有的功能和POSIX规定的功能。

       Following  the  POSIX  standard, gawk-specific options are supplied via arguments to the -W option.  
	   按照POSIX标准，gawk特定的选项可以通过 -W 选项而得到支持。
	   
	   Multiple -W options may be supplied Each -W option has a corresponding long option, as detailed below.  
	   多个 -W 选项也可以支持，只需要在每一个 -W 选项后跟着相应的长选项即可。详细内容看下面。
	   
	   Arguments to long options are either joined with the option by an = sign, with no intervening spaces, or they may be provided in the next command line argument.  
	   长选项的参数可以使用两边没有空格的等号连接，也可以在下一条命令里提供参数。
	   
	   Long options may be abbreviated, as long as the abbreviation remains unique.
	   长选项可以一直缩写，只要可以区分长选项。
```

## OPTIONS

```text
       Gawk accepts the following options, listed alphabetically.
	   gawk 接受下面的选项，按字母顺序列出。
	   下面主要介绍一个选项吧。

       -F fs
       --field-separator fs
              Use fs for the input field separator (the value of the FS predefined variable).
			  使用 fs 当作输入字段的分隔符(预定义变量 FS 的值)。
```
			  
## AWK PROGRAM EXECUTION

```text
    An AWK program consists of a sequence of pattern-action statements and optional function definitions.
              pattern   { action statements }

		一个 awk 程序包含模式动作语句和可选功能定义。
```

    手册后面还有好长好长的说明，这里就不多少了。


## 推荐

* [awk 基础](awk-base.md)  
* [awk 手册](awk-manual.md)
* [awk 主页](awk.md)

