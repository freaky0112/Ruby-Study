# 1043. 输出PATest(20)
# 给定一个长度不超过10000的、仅由英文字母构成的字符串。请将字符重新调整顺序，按“PATestPATest....”这样的顺序输出，并忽略其它字符。当然，六种字符的个数不一定是一样多的，若某种字符已经输出完，则余下的字符仍按PATest的顺序打印，直到所有字符都被输出。
# 输入格式：
# 输入在一行中给出一个长度不超过10000的、仅由英文字母构成的非空字符串。
# 输出格式：
# 在一行中按题目要求输出排序后的字符串。题目保证输出非空。
# 输入样例：
# redlesPayBestPATTopTeePHPereatitAPPT
# 输出样例：
# PATestPATestPTetPTePePee


def strToHash(str)
	hash=Hash.new { |hash, key| hash[key] = 0 }
	str.each_char { |chr|
		hash[chr]+=1
	 }
	 return hash
end

hash=strToHash(gets.chomp)
order="PATest"
result=""
hashstr=Hash.new()
len=0
order.each_char { |chr| 
	hashstr[chr]="#{chr*hash[chr]}"
	if hash[chr]>len
		len=hash[chr]
	end
 }
 i=0
 while i<len
 	hashstr.values.each { |e| 
 		if i<e.length
 			result<<e[i]
 		end
 	 }
 	 i+=1
 end
puts result
