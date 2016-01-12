# 1002. A+B for Polynomials (25)
# This time, you are supposed to find A+B where A and B are two polynomials.
# Input
# Each input file contains one test case. Each case occupies 2 lines, and each line contains the information of a polynomial: K N1 aN1 N2 aN2 ... NK aNK, where K is the number of nonzero terms in the polynomial, Ni and aNi (i=1, 2, ..., K) are the exponents and coefficients, respectively. It is given that 1 <= K <= 10，0 <= NK < ... < N2 < N1 <=1000.
# Output
# For each test case you should output the sum of A and B in one line, with the same format as the input. Notice that there must be NO extra space at the end of each line. Please be accurate to 1 decimal place.
# Sample Input
# 2 1 2.4 0 3.2
# 2 2 1.5 1 0.5
# Sample Output
# 3 2 1.5 1 2.9 0 3.2

class Number
	def initialize(a,b)
		@a=a
		@b=b
	end

	def a
		return @a.to_i
	end

	def b
		return @b.to_f
	end

	def +(other)
		sum=@b+other.b
		no=other.a
		return Number.new(no,sum)
	end	
	
	def to_s
		result=eval(sprintf("%8.1f",@b))
		return "#{@a} #{result}"
	end
end

def listToResult(list)
	sum=0
	result=""
	list.each { |e| 
		if e.b!=0
			result<<"#{e.to_s} "
			sum+=1
		end
	 }
	 if sum!=0	 	
	 	return "#{sum} #{result.rstrip}"
	 else
	 	return 0
	 end
end

# line1=gets.chomp.split(' ')
# line2=gets.chomp.split(' ')
line1="2 1 -2.4 0 3.2".split(' ')
line2="2 2 1.5 1 2.4".split(' ')
hash=Hash.new { |hash, key| hash[key] = Number.new(0,0) }

no=line1[0].to_i
line1.shift
i=0
while i<no*2
	a=line1[i].to_i
	b=line1[i+1].to_f
	number=Number.new(a,b)
	# puts number
	hash[a]+=number
	i+=2
end

no=line2[0].to_i
line2.shift
i=0
while i<no*2
	a=line2[i].to_i
	b=line2[i+1].to_f
	number=Number.new(a,b)
	# puts number
	hash[a]+=number
	i+=2
end
list=hash.values.sort_by { |e| e.a }.reverse
puts listToResult(list)
