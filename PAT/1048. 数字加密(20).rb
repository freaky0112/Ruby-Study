# 1048. 数字加密(20)
# 本题要求实现一种数字加密方法。首先固定一个加密用正整数A，对任一正整数B，将其每1位数字与A的对应位置上的数字进行以下运算：对奇数位，对应位的数字相加后对13取余——这里用J代表10、Q代表11、K代表12；对偶数位，用B的数字减去A的数字，若结果为负数，则再加10。这里令个位为第1位。
# 输入格式：
# 输入在一行中依次给出A和B，均为不超过100位的正整数，其间以空格分隔。
# 输出格式：
# 在一行中输出加密后的结果。
# 输入样例：
# 1234567 368782971
# 输出样例：
# 3695Q8118

def mod(no)
	list=Array(1..9)
	list<<"J"<<"Q"<<"K"
	return list[no%13-1].to_s
end

def max(a,b)
	if a>b
		return a
	else
		return b
	end

	# return a>b?a:b
end

def encoder(a,b)
	max=max(a.length,b.length)
	result=""
	i=0
	while i<max
		
			result<<mod(a[i].to_i+b[i].to_i)
		
			n=b[i+1].to_i-a[i+1].to_i
			if n<0
				n+=10
			end
			result<<n.to_s
		
		i+=2
	end
	return result.reverse
end

str=gets.chomp.split(' ')
# str="1234567 368782971".split(' ')
result=encoder(str[0].reverse,str[1].reverse)
if result[0]=='0'
	result=result[1,result.length-1]
end
puts result