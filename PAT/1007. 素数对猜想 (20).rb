# 1007. 素数对猜想 (20)
# 让我们定义 dn 为：dn = pn+1 - pn，其中 pi 是第i个素数。显然有 d1=1 且对于n>1有 dn 是偶数。“素数对猜想”认为“存在无穷多对相邻且差为2的素数”。
# 现给定任意正整数N (< 105)，请计算不超过N的满足猜想的素数对的个数。
# 输入格式：每个测试输入包含1个测试用例，给出正整数N。
# 输出格式：每个测试用例的输出占一行，不超过N的满足猜想的素数对的个数。
# 输入样例：
# 20
# 输出样例：
# 4

def defPrimes(limit)
	primes=Array.new(limit) { |i| i=true  }
	i=2
	while i<limit
		if primes[i]
			n=i
			while i*n<limit
				primes[i*n]=false
				n+=1
			end
		end
		i+=1	
	end
	return primes
end

n=gets.chomp.to_i
primes=defPrimes(n)
array=Array.new()
i=2
while i<=n
	if primes[i]
		array<<i		
	end	
	i+=1
end
i=0
count=0
while i<array.count-1
	minus=array[i+1]-array[i]
	if minus==2
		count+=1
	end
	i+=1
end
puts count