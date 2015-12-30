# 1021. 个位数统计 (15)
# 给定一个k位整数N = dk-1*10k-1 + ... + d1*101 + d0 (0<=di<=9, i=0,...,k-1, dk-1>0)，请编写程序统计每种不同的个位数字出现的次数。例如：给定N = 100311，则有2个0，3个1，和1个3。
# 输入格式：
# 每个输入包含1个测试用例，即一个不超过1000位的正整数N。
# 输出格式：
# 对N中每一种不同的个位数字，以D:M的格式在一行中输出该位数字D及其在N中出现的次数M。要求按D的升序输出。
# 输入样例：
# 100311
# 输出样例：
# 0:2
# 1:3
# 3:1
class Numbers
	def initialize(no,count)
		@no=no
		@count=count
	end
	
	def no
		return @no
	end

	def count
		return @count
	end

	def to_s
		return "#{@no}:#{@count}"
	end
end
no=gets.chomp
i=0
hash=Hash.new { |hash, key| hash[key] = 0 }
while i<no.length
	key=no[i]
	if hash[key]!=0
		hash[key]+=1
	else
		hash[key]=1
	end
	i+=1
end
list=Array.new()
hash.each_key { |key|
	number=Numbers.new(key,hash[key])
	list<<number
  }

puts list.sort_by { |e| e.no }