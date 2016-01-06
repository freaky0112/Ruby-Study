# 1044. 火星数字(20)
# 火星人是以13进制计数的：
# 地球人的0被火星人称为tret。
# 地球人数字1到12的火星文分别为：jan, feb, mar, apr, may, jun, jly, aug, sep, oct, nov, dec。
# 火星人将进位以后的12个高位数字分别称为：tam, hel, maa, huh, tou, kes, hei, elo, syy, lok, mer, jou。
# 例如地球人的数字“29”翻译成火星文就是“hel mar”；而火星文“elo nov”对应地球数字“115”。为了方便交流，请你编写程序实现地球和火星数字之间的互译。
# 输入格式：
# 输入第一行给出一个正整数N（<100），随后N行，每行给出一个[0, 169)区间内的数字 —— 或者是地球文，或者是火星文。
# 输出格式：
# 对应输入的每一行，在一行中输出翻译后的另一种语言的数字。
# 输入样例：
# 4
# 29
# 5
# elo nov
# tam
# 输出样例：
# hel mar
# may
# 115
# 13



def earthToMars(no,hashLowETM,hashHighETM)
	if no==0
		return "tret"
	end
	i=0
	loop { 
		if i*13>no
			break
		end
		i+=1
	 }
	 i-=1
	 no-=i*13
	 return "#{hashHighETM[i]} #{hashLowETM[no]}".lstrip.rstrip
end

def marsToEarth(str,hashlowMTE,hashHighMTE)
	if str=="tret"
		return 0
	end
	ten=str.split(' ')[0]
	bit=str.split(' ')[1]
	return hashHighMTE[ten]*13+hashlowMTE[bit]
end

def listToHash(list)
	i=0
	hash1=Hash.new { |hash, key| hash[key] = "" }
	hash2=Hash.new { |hash, key| hash[key] = 0 }
	while i<list.count
		hash1[i+1]=list[i]
		hash2[list[i]]=i+1
		i+=1
	end	
	return hash1,hash2
end

bits=["jan","feb","mar","apr","may","jun","jly","aug","sep","oct","nov","dec"]
ten=["tam","hel","maa","huh","tou","kes","hei","elo","syy","lok","mer","jou"]
hashLowETM,hashlowMTE=listToHash(bits)
hashHighETM,hashHighMTE=listToHash(ten)
# puts earthToMars(5,hashLowETM,hashHighETM)
# puts marsToEarth("tam",hashlowMTE,hashHighMTE)
count=gets.chomp.to_i
list=Array.new()
while count>0
	str=gets.chomp
	# puts str.is_a?(Numeric)
	if str.to_i.to_s==str
		list<<earthToMars(str.to_i,hashLowETM,hashHighETM).to_s
	else
		list<<marsToEarth(str,hashlowMTE,hashHighMTE)
	end
	count-=1
end
puts list