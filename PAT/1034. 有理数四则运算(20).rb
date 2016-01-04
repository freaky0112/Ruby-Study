# 1034. 有理数四则运算(20)
# 本题要求编写程序，计算2个有理数的和、差、积、商。
# 输入格式：
# 输入在一行中按照“a1/b1 a2/b2”的格式给出两个分数形式的有理数，其中分子和分母全是整型范围内的整数，负号只可能出现在分子前，分母不为0。
# 输出格式：
# 分别在4行中按照“有理数1 运算符 有理数2 = 结果”的格式顺序输出2个有理数的和、差、积、商。注意输出的每个有理数必须是该有理数的最简形式“k a/b”，其中k是整数部分，a/b是最简分数部分；若为负数，则须加括号；若除法分母为0，则输出“Inf”。题目保证正确的输出中没有超过整型范围的整数。
# 输入样例1：
# 2/3 -4/2
# 输出样例1：
# 2/3 + (-2) = (-1 1/3)
# 2/3 - (-2) = 2 2/3
# 2/3 * (-2) = (-1 1/3)
# 2/3 / (-2) = (-1/3)
# 输入样例2：
# 5/3 0/6
# 输出样例2：
# 1 2/3 + 0 = 1 2/3
# 1 2/3 - 0 = 1 2/3
# 1 2/3 * 0 = 0
# 1 2/3 / 0 = Inf

class Fraction
	def initialize(number)
		# if number[0]=='-'
		# 	@sign='-'
		# 	number.delete!(@sign)
		# else
		# 	@sign=" "
		# end

		@a=number.split('/')[0].to_i
		@b=number.split('/')[1].to_i
		@c=@a.abs/@b.abs
		# @molecular=@a/lowest#分子
		# @denominator=@b/lowest#分母

	end
	#最小公倍数
	def lowest
		i=1
		max=0
		biger=(@a>@b)?@a:@b
		while i<=biger
			if @a%i==0&&@b%i==0
				max=i
			end
			i+=1
		end
		return max
	end
	#分子
	def a
		return @a/lowest
	end
	#分母
	def b
		return @b/lowest
	end

	def c
		if @c==0
			return ""
		else
			return @c
		end
	end

	def sign
		return @sign
	end

	def to_s
		if a==0
			return '0'
		end
		if a%b==0
			return "#{c}"
		end
		if a*b<0
			return "(-#{c} #{a.abs%b.abs}/#{b.abs})".lstrip
		else
			return "#{c} #{a.abs%b.abs}/#{b.abs}".lstrip
		end
	end

	def +(other)
		aa=a*other.b+other.a*b
		bb=b*other.b
		return Fraction.new("#{aa}/#{bb}")
	end

	def -(other)
		aa=a*other.b-other.a*b
		bb=b*other.b
		return Fraction.new("#{aa}/#{bb}")
	end

	def *(other)
		aa=a*other.a
		bb=b*other.b
		return Fraction.new("#{aa}/#{bb}")
	end

	def /(other)
		if other.a==0
			return "Inf"
		else
			aa=a*other.b
			bb=b*other.a
			return Fraction.new("#{aa}/#{bb}")
		end
	end
	
end
number=gets.chomp.split(' ')
a=Fraction.new(number[0])
b=Fraction.new(number[1])
# a=1
# b=2
puts "#{a} + #{b} = #{a+b}"
puts "#{a} - #{b} = #{a-b}"
puts "#{a} * #{b} = #{a*b}"
puts "#{a} / #{b} = #{a/b}"
