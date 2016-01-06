# 1042. 字符统计(20)
# 请编写程序，找出一段给定文字中出现最频繁的那个英文字母。
# 输入格式：
# 输入在一行中给出一个长度不超过1000的字符串。字符串由ASCII码表中任意可见字符及空格组成，至少包含1个英文字母，以回车结束（回车不算在内）。
# 输出格式：
# 在一行中输出出现频率最高的那个英文字母及其出现次数，其间以空格分隔。如果有并列，则输出按字母序最小的那个字母。统计时不区分大小写，输出小写字母。
# 输入样例：
# This is a simple TEST.  There ARE numbers and other symbols 1&2&3...........
# 输出样例：
# e 7

class Char
	def initialize(chr,no)
		@chr=chr
		@no=no
	end
	
	def chr
		return @chr
	end

	def no
		return @no		
	end

	def to_s
		return "#{chr} #{no}"
	end
	
end

def strToHash(str)
	hash=Hash.new { |hash, key| hash[key] = 0 }
	str.each_char { |chr|
		hash[chr]+=1
	 }
	 return hash
end

def hashToList(hash)
	list=Array.new()
	hash.each_key { |key|  
		chr=Char.new(key,hash[key])
		list<<chr
	}
	
	list.sort! { |b, a| [a.no, b.chr]<=>[b.no,a.chr]}
	return list
end

str=gets.chomp.downcase
regex=/[a-z]/
result=""
str.scan(regex) { |match| 
	result<<match
 }
puts hashToList(strToHash(result))[0]