# 20Factorial digit sum
# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!

def Factorial(number)
	sum=0
	number.each_char { |chr| 
		sum+=chr.to_i
	 }
	 return sum
end

i=1
sum=1
while i<=100
	sum*=i
	i+=1
end
puts Factorial(sum.to_s)