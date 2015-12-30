# 1024. 科学计数法 (20)
# 科学计数法是科学家用来表示很大或很小的数字的一种方便的方法，其满足正则表达式[+-][1-9]"."[0-9]+E[+-][0-9]+，即数字的整数部分只有1位，小数部分至少有1位，该数字及其指数部分的正负号即使对正数也必定明确给出。
# 现以科学计数法的格式给出实数A，请编写程序按普通数字表示法输出A，并保证所有有效位都被保留。
# 输入格式：
# 每个输入包含1个测试用例，即一个以科学计数法表示的实数A。该数字的存储长度不超过9999字节，且其指数的绝对值不超过9999。
# 输出格式：
# 对每个测试用例，在一行中按普通数字表示法输出A，并保证所有有效位都被保留，包括末尾的0。
# 输入样例1：
# +1.23400E-03
# 输出样例1：
# 0.00123400
# 输入样例2：
# -1.2E+10
# 输出样例2：
# -12000000000

str=gets.chomp.split('E')
number=str[0]
exp=str[1].to_i
i=number.length
while number[number.length-1]=='0'
	number.chop!
end
count= i-number.length
int=number.split('.')[0]
decimal=number.split('.')[1]
int="%09999d" %int
decimal=decimal<<'0'*9999
if exp>0
	int<<decimal[0,exp]
	decimal=decimal[exp,decimal.length-exp]
elsif exp<0
	decimal.insert(0,int[int.length+exp,-exp])
	int=int[0,int.length+exp]
end
# puts int
# puts decimal
result=""
if int[0]=="-"
	result<<"-"
	int.delete!("-")
end
while int[0]=="0"
	if int.length==1
		break
	end
	int=int[1,int.length-1]
end

while decimal[decimal.length-1]=="0"
	if decimal.length==1
		break;
	end
	decimal.chop!
end

result<<int
if decimal!='0'
	result<<'.'
	result<<decimal
	result<<'0'*count
end
puts result
