# 1050. 螺旋矩阵(25)
# 本题要求将给定的N个正整数按非递增的顺序，填入“螺旋矩阵”。所谓“螺旋矩阵”，是指从左上角第1个格子开始，按顺时针螺旋方向填充。要求矩阵的规模为m行n列，满足条件：m*n等于N；m>=n；且m-n取所有可能值中的最小值。
# 输入格式：
# 输入在第1行中给出一个正整数N，第2行给出N个待填充的正整数。所有数字不超过104，相邻数字以空格分隔。
# 输出格式：
# 输出螺旋矩阵。每行n个数字，共m行。相邻数字以1个空格分隔，行末不得有多余空格。
# 输入样例：
# 12
# 37 76 20 98 76 42 53 95 60 81 58 93
# 输出样例：
# 98 95 93
# 42 37 81
# 53 20 76
# 58 60 76
def getMatrix(no)
	m=(no**0.5).to_i
	n=1
	while m<no
		n=(no/m).to_i
		if m>=n&&m*n==no
			break
		end
		m+=1
	end
	return m,n
end

def strToList(str)
	list=Array.new()
	str.each { |e|  
		list<<e.to_i
	}
	return list.sort.reverse
end

def listToStr(list)
	arr=Array.new()
	list.each { |e| 
		str=""
		e.each { |chr| 
			str<<"#{chr} "
		 }
		 arr<<str.rstrip
	 }
	 return arr
end

no=gets.chomp.to_i
arr=strToList(gets.chomp.split(' '))
m,n=getMatrix(no)
list=Array.new(m) { |i| i=Array.new(n)}
low=0
while arr.count>0
	i=0
	j=1
	while i<n
		list[low][low+i]=arr.shift
		i+=1
	end	
	# puts list.to_s
	while j<m-1
		list[low+j][low+i-1]=arr.shift
		j+=1
	end
	# puts list.to_s
	while i>low
		list[j][low+i-1]=arr.shift
		i-=1		
	end
	while j>low+1
		list[low+j-1][i]=arr.shift
		j-=1
	end
	m-=2
	n-=2
	low+=1
	if n==1
		list[low][low]=arr.shift
		list[low+1][low]=arr.shift
	end
	if arr.count==0
		break
	end
	# puts list.to_s
end
puts listToStr(list)