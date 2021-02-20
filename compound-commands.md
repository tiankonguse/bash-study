# Compound Commands(复合命令)  

[[toc]]


## 1.`(list)`


子 shell 运算。  

子 shell 不能修改当前 shell 的环境变量。 



> list is executed in a subshell environment.  
>
> Variable assignments and builtin commands that affect the shell’s environment do not remain in effect after the command completes. 
>
> The return status is the exit status of list.

## 2. `{ list; }`  


一组命令。  


> list is simply executed in the current shell environment.  
> 
> list must be terminated with a newline or semicolon.  
> 
> This is known as a group command.  
> 
> The return status is the exit status  of list.  
> 
> Note  that  unlike the metacharacters `(` and `)`, `{` and `}` are reserved words and must occur where a reserved word is permitted to be recognized.  
> 
> Since they do not cause a word break, they must be separated from list by whitespace or another shell metacharacter.  
 

## 3. `((expression))`


算数表达式。  

> The expression is evaluated according to the rules described below under [ARITHMETIC EVALUATION](./arithmetic-evaluation.md).  
> 
> If the value of the expression is non-zero, the return status is 0;  otherwise  the  return status is 1.  
> 
> This is exactly equivalent to let "expression".


## 4. `[[ expression ]]`  


Return  a  status  of 0 or 1 depending on the evaluation of the conditional expression expression.  
Expressions are composed of the primaries described below under CONDITIONAL EXPRESSIONS.


Word splitting and pathname expansion are not performed on the words between the `[[` and `]]`; tilde expansion, parameter and variable expansion, arithmetic expansion,  command  substitution, process substitution, and quote removal are performed.  
Conditional operators such as -f must be unquoted to be recognized as primaries.


When used with `[[`, The `<` and `>` operators sort lexicographically using the current locale.

When  the  `==`  and `!=` operators are used, the string to the right of the operator is considered a pattern and matched according to the rules described below under Pattern Matching.  
If the shell option nocasematch is enabled, the match is performed without regard to the case of alphabetic characters.  
The return value is 0 if the string matches `(==)` or does  not  match  `(!=)` the pattern, and 1 otherwise.  
Any part of the pattern may be quoted to force it to be matched as a string.

An  additional binary operator, `=~`, is available, with the same precedence as `==` and `!=`.  
When it is used, the string to the right of the operator is considered an extended regular expression and matched accordingly (as in regex(3)).  
The return value is 0 if the string matches the pattern, and 1 otherwise.  
If the regular expression is syntactically incorrect, the  conditional expression’s return value is 2.  
If the shell option nocasematch is enabled, the match is performed without regard to the case of alphabetic characters.  

Any part of the pattern may be quoted to force it to be matched as a string.  
Substrings matched by parenthesized subexpressions within the regular expression are saved in the array variable BASH_REMATCH.  
The  element  of  BASH_REMATCH with index 0 is the portion of the string matching the entire regular expression.  
The element of BASH_REMATCH with index n is the portion of the string matching the nth parenthesized subexpression.

Expressions may be combined using the following operators, listed in decreasing order of precedence:

* `( expression )` Returns the value of expression.  This may be used to override the normal precedence of operators.
* `! expression` True if expression is false.
* `expression1 && expression2`  True if both expression1 and expression2 are true.
* `expression1 || expression2` True if either expression1 or expression2 is true.

The `&&` and `||` operators do not evaluate expression2 if the value of expression1 is sufficient to determine the return value of the entire conditional expression.


## 5. `for name [ [ in [ word ... ] ] ; ] do list ; done`  


The list of words following in is expanded, generating a list of items.  

The variable name is set to each element of this list in turn, and list is executed each time.  

If the in  word  is omitted,  the  for command executes list once for each positional parameter that is set (see PARAMETERS below).  

The return status is the exit status of the last command that executes.  
If the expansion of the items following in results in an empty list, no commands are executed, and the return status is 0.


## 6. `for (( expr1 ; expr2 ; expr3 )) ; do list ; done`  

First, the arithmetic expression expr1 is evaluated according to the rules described below under ARITHMETIC EVALUATION.  

The arithmetic expression expr2 is then evaluated repeatedly  until it  evaluates to zero.  
Each time expr2 evaluates to a non-zero value, list is executed and the arithmetic expression expr3 is evaluated.  

If any expression is omitted, it behaves as if it evaluates to 1.  

The return value is the exit status of the last command in list that is executed, or false if any of the expressions is invalid.


## 7. `select name [ in word ] ; do list ; done`  


The list of words following in is expanded, generating a list of items.  

The set of expanded words is printed on the standard error, each preceded by a number.  

If the in word is  omitted, the  positional parameters are printed (see PARAMETERS below).  


The PS3 prompt is then displayed and a line read from the standard input.  

If the line consists of a number corresponding to one of the displayed words, then the value of name is set to that word.  
If the line is empty, the words and prompt are displayed again.  

If EOF is read, the command completes.  

Any  other value  read  causes name to be set to null.  

The line read is saved in the variable REPLY.  

The list is executed after each selection until a break command is executed.  

The exit status of select is the exit status of the last command executed in list, or zero if no commands were executed.

8. `case word in [ [(] pattern [ | pattern ] ... ) list ;; ] ... esac`  



9. `if list; then list; [ elif list; then list; ] ... [ else list; ] fi`  


The if list is executed.  

If its exit status is zero, the then list is executed.  

Otherwise, each elif list is executed in turn, and if its exit status is zero, the corresponding then list is  executed  and the command completes.  


Otherwise, the else list is executed, if present.  

The exit status is the exit status of the last command executed, or zero if no condition tested true.

10. `while list; do list; done`  
11. `until list; do list; done`


The while command continuously executes the do list as long as the last command in list returns an exit status of zero.  

The until command is identical to the while  command,  except  that the  test is negated; the do list is executed as long as the last command in list returns a non-zero exit status.  

The exit status of the while and until commands is the exit status of the last do list command executed, or zero if none was executed.

