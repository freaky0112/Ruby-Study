# 1013. 数素数 (20)
# 令Pi表示第i个素数。现任给两个正整数M <= N <= 104，请输出PM到PN的所有素数。

# 输入格式：

# 输入在一行中给出M和N，其间以空格分隔。

# 输出格式：

# 输出从PM到PN的所有素数，每10个数字占1行，其间以空格分隔，但行末不得有多余空格。

# 输入样例：
# 5 27
# 输出样例：
# 11 13 17 19 23 29 31 37 41 43
# 47 53 59 61 67 71 73 79 83 89
# 97 101 103

def defPrimes(limit)
	primes=Array.new(limit) { |i| i=true  }
	i=2
	while i<limit
		if primes[i]
			n=i
			while i*n<=limit
				primes[i*n]=false
				n+=1
			end
		end
		i+=1	
	end
	return primes
end

str=gets.chomp.split(' ')
start_no=str[0].to_i
end_no=str[1].to_i

primes=defPrimes(200)
i=start_no
result=Array.new()
primes.each_index { |i|
	if primes[i]&&i>=2
		result<<i
	end
  }
i=0
str=""
while start_no<=end_no
	str<<"#{result[start_no-1]} "
	i+=1
	if i==10
		puts str.rstrip
		str=""
		i=0
	end
	
	start_no+=1
end
puts str.rstrip
