# 现给出两人的交锋记录，请统计双方的胜、平、负次数，并且给出双方分别出什么手势的胜算最大。
# 输入格式：
# 输入第1行给出正整数N（<=105），即双方交锋的次数。随后N行，每行给出一次交锋的信息，即甲、乙双方同时给出的的手势。C代表“锤子”、J代表“剪刀”、B代表“布”，第1个字母代表甲方，第2个代表乙方，中间有1个空格。
# 输出格式：
# 输出第1、2行分别给出甲、乙的胜、平、负次数，数字间以1个空格分隔。第3行给出两个字母，分别代表甲、乙获胜次数最多的手势，中间有1个空格。如果解不唯一，则输出按字母序最小的解。
# 输入样例：
# 10
# C J
# J B
# C B
# B B
# B C
# C C
# C B
# J B
# B C
# J J
# 输出样例：
# 5 3 2
# 2 3 5
# B B
class Person	
	def initialize()
		@win=Array.new()
		@lose=Array.new() 
		@draw=Array.new()
	end
	def wins
		return @win
	end

	def win(obj)
		@win<<obj
	end

	def draw(obj)
		@draw<<obj
	end

	def lose(obj)
		@lose<<obj
	end

	def to_s
		return "#{@win.count} #{@draw.count} #{@lose.count}"
	end
end

def judge(a,b)
	if a==b
		return 0
	elsif a!=b		
		if a=="C"&&b=="J"
			return 1
		elsif a=="C"&&b=="B"
			return 2
		elsif a=="B"&&b=="C"
			return 1
		elsif a=="B"&&b=="J"		
			return 2
		elsif a=="J"&&b=="C"
			return 2
		elsif a=="J"&&b=="B"
			return 1
		end
	end
end

class GP
	def initialize(option,no)
		@option=option
		@no=no
	end	

	def no
		return @no
	end

	def option
		return @option
	end

	def to_s
		return "#{@option} #{@no}"
	end
end


def getMax(list)
	hash=Hash.new { |hash, key| hash[key] =  0}
	list.each { |e|
		if hash[e]!=0
			hash[e]+=1
		else
			hash[e]=1
		end
		# puts "#{e} #{hash[e]}"
	  }
	list=Array.new() 
	hash.each_key { |key| 
		list<<GP.new(key,hash[key])
	 }
	 list.sort! { |a, b| [b.no,a.option]<=>[a.no,b.option]}
	 return list[0].option
end


no=gets.chomp.to_i
A=Person.new()
B=Person.new()
while no>0
	str=gets.chomp.split(' ')
	a=str[0]
	b=str[1]
	case judge(a,b)
	 when 1
	 	A.win(a)
	 	B.lose(b)
	 when 2
	 	A.lose(a)
	 	B.win(b)
	 when 0
	 	A.draw(a)		
	 	B.draw(b)
	 end
	no-=1
end

puts A
puts B
puts "#{getMax(A.wins)} #{getMax(B.wins)}"