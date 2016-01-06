# 1037. 在霍格沃茨找零钱（20）
# 如果你是哈利·波特迷，你会知道魔法世界有它自己的货币系统 —— 就如海格告诉哈利的：“十七个银西可(Sickle)兑一个加隆(Galleon)，二十九个纳特(Knut)兑一个西可，很容易。”现在，给定哈利应付的价钱P和他实付的钱A，你的任务是写一个程序来计算他应该被找的零钱。
# 输入格式：
# 输入在1行中分别给出P和A，格式为“Galleon.Sickle.Knut”，其间用1个空格分隔。这里Galleon是[0, 107]区间内的整数，Sickle是[0, 17)区间内的整数，Knut是[0, 29)区间内的整数。
# 输出格式：
# 在一行中用与输入同样的格式输出哈利应该被找的零钱。如果他没带够钱，那么输出的应该是负数。
# 输入样例1：
# 10.16.27 14.1.28
# 输出样例1：
# 3.2.1
# 输入样例2：
# 14.1.28 10.16.27
# 输出样例2：
# -3.2.1

class Money
	def initialize(money)

		@galleon=money.split('.')[0].to_i
		@sickle=money.split('.')[1].to_i
		@knut=money.split('.')[2].to_i
	end

	def galleon
		return @galleon
	end

	def sickle
		return @sickle
	end

	def knut
		return @knut
	end

	def +(other)
		@galleon+=other.galleon
		@sickle+=other.sickle
		@knut+=other.knut
		return Money.new(@galleon,@sickle,@knut)
	end
	
	def -(other)
		@galleon-=other.galleon
		@sickle-=other.sickle
		@knut-=other.knut
		return Money.new(to_s)
	end

	def >=(other)
		return toKunt>=other.toKunt
	end
	
	def toKunt
		return @galleon*17*29+@sickle*17+@knut
	end

	def to_s
		if @knut>=29
			@knut=29-@knut
			@sickle+=1
		elsif @knut<0
			@knut=29+@knut
			@sickle-=1
		end	

		if @sickle>=17
			@sickle=17-@sickle
			@galleon+=1
		elsif @sickle<0
			@sickle=17+@sickle
			@galleon-=1
		end

		return "#{@galleon}.#{@sickle}.#{@knut}"
	end	
end

get=gets.chomp.split(' ')
b=Money.new(get[0])
a=Money.new(get[1])
result=""
if a>=b
	result=""
else
	a,b=b,a
	result<<"-"
end
result<<(a-b).to_s
puts result