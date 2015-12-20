# 给定一系列正整数，请按要求对数字进行分类，并输出以下5个数字：

# A1 = 能被5整除的数字中所有偶数的和；
# A2 = 将被5除后余1的数字按给出顺序进行交错求和，即计算n1-n2+n3-n4...；
# A3 = 被5除后余2的数字的个数；
# A4 = 被5除后余3的数字的平均数，精确到小数点后1位；
# A5 = 被5除后余4的数字中最大数字。
# 输入格式：

# 每个输入包含1个测试用例。每个测试用例先给出一个不超过1000的正整数N，随后给出N个不超过1000的待分类的正整数。数字间以空格分隔。

# 输出格式：

# 对给定的N个正整数，按题目要求计算A1~A5并在一行中顺序输出。数字间以空格分隔，但行末不得有多余空格。

# 若其中某一类数字不存在，则在相应位置输出“N”。

# 输入样例1：
# 13 1 2 3 4 5 6 7 8 9 10 20 16 18
# 输出样例1：
# 30 11 2 9.7 9
# 输入样例2：
# 8 1 2 4 5 6 7 9 16
# 输出样例2：
# N 11 2 N 9

def A1(array)
	sum=Array.new()
	array.each { |e| 
		if e%10==0
			sum<<e
		end
	 }
	 result=0
	 if sum.count==0
	 	return "N"
	 end
	 sum.each { |e|  
	 	result+=e
	 }
	 return result
end

def A2(array)
	sum=Array.new() 
	array.each { |e| 
		if e%5==1
			sum<<e
		end
	 }	 
	 if sum.count==0
	 	return "N"
	 end
	 i=0
	 result=0
	 while i<sum.count
	 	if i%2==0
	 		result+=sum[i]
	 	else
	 		result-=sum[i]
	 	end
	 	i+=1
	 end
	 return result	
end

def A3(array)
	sum=Array.new() 
	array.each { |e| 
		if e%5==2
			sum<<e
		end
	 }
	 if sum.count==0
	 	return "N"
	 else
	 	return sum.count
	 end
end

def A4(array)
	sum=Array.new()
	array.each { |e| 
		if e%5==3
			sum<<e
		end
	 }
	 result=0
	 if sum.count==0
	 	return "N"
	 end
	 sum.each { |e|  
	 	result+=e
	 }
	 result=result.to_f/sum.count.to_f
	 return result.round(1)
end

def A5(array)
	max=0
	array.each { |e|
		if e>max&&e%5==4
			max=e
		end
	  }
	  if max==0
	  	return "N"
	  else
	  	return max 
	  end
end

array=Array.new
gets.chomp.split(' ').each { |e| 
	array<<e.to_i
 }
array.shift
puts "#{A1(array)} #{A2(array)} #{A3(array)} #{A4(array)} #{A5(array)}"


