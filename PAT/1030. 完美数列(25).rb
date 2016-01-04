# 1030. 完美数列(25)
# 给定一个正整数数列，和正整数p，设这个数列中的最大值是M，最小值是m，如果M <= m * p，则称这个数列是完美数列。
# 现在给定参数p和一些正整数，请你从中选择尽可能多的数构成一个完美数列。
# 输入格式：
# 输入第一行给出两个正整数N和p，其中N（<= 105）是输入的正整数的个数，p（<= 109）是给定的参数。第二行给出N个正整数，每个数不超过109。
# 输出格式：
# 在一行中输出最多可以选择多少个数可以用它们组成一个完美数列。
# 输入样例：
# 10 8
# 2 3 20 4 5 1 6 7 8 9
# 输出样例：
# 8

str=gets.chomp.split(' ')
no=str[0].to_i
p=str[1].to_i
list=Array.new()
gets.chomp.split(' ').each { |e| 
	list<<e.to_i
 }
list.sort!
max=0
while list.count!=0
	e=list[0]
	i=0
	while i<list.count
		m=e*p
		if list[i]>m
			break
		end
		i+=1
	end
	if max<i
		max=i
	end
	list.shift
end
 puts max
