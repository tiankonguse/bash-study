# shell变量算数运算


有时候需要在shell中进行四则运算，这里记录一下。  


## 1. expr命令

加法：result=`expr 3 + 6`  
减法：result=`expr 3 - 6`  
乘法：result=`expr 3 \* 6`  
除法：result=`expr 30 / 6`  

注意事项1：各个数字和运算符之间需要有空格。  
注意事项2：乘法需要进行转义。  


## 2. $(( ))

加法：result=$(( 3 + 6 ))  
减法：result=$(( 3 - 6 ))  
乘法：result=$(( 3 * 6 ))    
除法：result=$(( 30 / 6 ))  

## 3. $[ ]  

加法：result=$[ 3 + 6 ]  
减法：result=$[ 3 - 6 ] 
乘法：result=$[ 3 * 6 ]   
除法：result=$[ 30 / 6 ]

## 4. let 命令

加法：let result=3+6-1
减法：let result=3-6
乘法：let result=3*6
除法：let result=30/6

注意事项：数字和运算符之间不能有空格  

