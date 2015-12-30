# 1022. D进制的A+B (20)
# 输入两个非负10进制整数A和B(<=230-1)，输出A+B的D (1 < D <= 10)进制数。
# 输入格式：
# 输入在一行中依次给出3个整数A、B和D。
# 输出格式：
# 输出A+B的D进制数。
# 输入样例：
# 123 456 8
# 输出样例：
# 1103
def exchange(no,d)
	i=0
	while d**i<no
		i+=1
	end
	i=i-1
	result=""
	while no>0
		dig=no/(d**i)
		no=no%d**i
		result<<dig.to_s
		i-=1
	end
	return result
end


str=gets.chomp.split(' ')
a=str[0].to_i
b=str[1].to_i
d=str[2].to_i
puts exchange(a+b,d)