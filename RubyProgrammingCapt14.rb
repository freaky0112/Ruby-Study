#创建数组
def split_str(str)
	return coloum=str.split(/ /)
end

#转大写
def capitalize_str(coloum)
	str=""
	str=coloum.join(" ")
	return str
end

def statistics_str(str)
	chars=Hash.new { |hash, key| hash[key] = 0 }
	str.each_char { |chr|
		if chars.has_key?(chr)
			chars[chr]+=1
		else
			chars[chr]=1
		end
	  }
	#return chars.sort
	show_statistics_char(chars)
end

def show_statistics_char(chars)
	chars.sort.each do |key,value|
		i=0
		print "'"+key.to_s+"':"
		while i<chars[key].to_i
			print "*"
			i+=1
		end
		print "\n"
	end
end

def han2num(str)
	i=0
	i+=splite_str(str,"千")*1000
	p i
	i+=splite_str(str,"百")*100
	p i
	i+=splite_str(str,"十")*10
	p i
	i+=get_num(str[-1,1])
	return i
end

def get_num(char)	
	number=["零","一","二","三","四","五","六","七","八","九"]
	number.each_with_index do |elem,i|
		p elem
		if elem==char
			return i
		end
	end
	return 0
end

def splite_str(str,char)
	m=str.split(char)
	if m.size==2

		return get_num(m[0])
	else
		return 0
	end
end

# str="Ruby is an object oriented programming language"
# #排序
# p split_str(str)
# #不分大小写排序
# puts split_str(str).sort_by { |e| e.downcase }
# #首字母转大写
# p capitalize_str(split_str(str))
# #统计字符串中的字符及其数量并输出结果
# statistics_str(str)
#中文数字转数字
str="一千二百三十四"
puts han2num(str)