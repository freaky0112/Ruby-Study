# 1039. 到底买不买（20）
# 小红想买些珠子做一串自己喜欢的珠串。卖珠子的摊主有很多串五颜六色的珠串，但是不肯把任何一串拆散了卖。于是小红要你帮忙判断一下，某串珠子里是否包含了全部自己想要的珠子？如果是，那么告诉她有多少多余的珠子；如果不是，那么告诉她缺了多少珠子。
# 为方便起见，我们用[0-9]、[a-z]、[A-Z]范围内的字符来表示颜色。例如在图1中，第3串是小红想做的珠串；那么第1串可以买，因为包含了全部她想要的珠子，还多了8颗不需要的珠子；第2串不能买，因为没有黑色珠子，并且少了一颗红色的珠子。
# 输入格式：
# 每个输入包含1个测试用例。每个测试用例分别在2行中先后给出摊主的珠串和小红想做的珠串，两串都不超过1000个珠子。
# 输出格式：
# 如果可以买，则在一行中输出“Yes”以及有多少多余的珠子；如果不可以买，则在一行中输出“No”以及缺了多少珠子。其间以1个空格分隔。
# 输入样例1：
# ppRYYGrrYBR2258
# YrR8RrY
# 输出样例1：
# Yes 8
# 输入样例2：
# ppRYYGrrYB225
# YrR8RrY
# 输出样例2：
# No 2

def strToHash(str)
	i=0
	hash=Hash.new { |hash, key| hash[key] = 0 }
	while i<str.length
		hash[str[i]]+=1
		i+=1
	end
	return hash
end

hash1=strToHash(gets.chomp)
hash2=strToHash(gets.chomp)
yes=0
no=0
hash1.each_key { |key|
	if hash1[key]>=hash2[key]
		yes+=hash1[key]-hash2[key]
	end
  }
hash2.each_key { |key|
	if hash1[key]<hash2[key]
		
		no+=hash2[key]-hash1[key]
	end
  }

 puts no>0?"No #{no}":"Yes #{yes}"