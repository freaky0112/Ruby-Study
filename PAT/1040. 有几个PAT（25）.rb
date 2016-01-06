# 1040. 有几个PAT（25）
# 字符串APPAPT中包含了两个单词“PAT”，其中第一个PAT是第2位(P),第4位(A),第6位(T)；第二个PAT是第3位(P),第4位(A),第6位(T)。
# 现给定字符串，问一共可以形成多少个PAT？
# 输入格式：
# 输入只有一行，包含一个字符串，长度不超过105，只包含P、A、T三种字母。
# 输出格式：
# 在一行中输出给定字符串中包含多少个PAT。由于结果可能比较大，只输出对1000000007取余数的结果。
# 输入样例：
# APPAPT
# 输出样例：
# 2
def countPat(str)
	sum=0
	p=0
	while p<str.length-2
		if str[p]=='P'
			a=p+1
			while a<str.length-1
				t=a+1
				if str[a]=='A'
					while t<str.length
						if str[t]=='T'
							sum+=1
						end
						t+=1
					end
				end
				a+=1
			end
		end
		p+=1
	end
	return sum%1000000007
end

str=gets.chomp
puts countPat(str)