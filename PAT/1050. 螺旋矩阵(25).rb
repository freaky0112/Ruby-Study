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
puts Time.now
no=gets.chomp.to_i
arr=strToList(gets.chomp.split(' '))
m,n=getMatrix(no)

row=Array.new(n)
list=Array.new(m) { |i| i=row }
list[0]=arr[0,n]
puts list.to_s