# 23Non-abundant sums
# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

def sumOfDivisors(number)
	sum=0
	limit=number/2
	i=1
	while i<=limit
		if number%i==0
			sum+=i
		end
		i+=1
	end
	return sum
end

max=28123
list=Array.new()
i=1
loop { 
	if sumOfDivisors(i)>i
		list<<i
	end
	if i>max
		break
	end
	i+=1
 }
 result=Array.new(max) { |i| i=true }
puts "list completed"
i=0
while i<list.count
	j=i
	while j<list.count
		no=list[i]+list[j]
		if no>max
			break
		end
		# puts no
		result[no]=false
	 	j+=1
	end
	i+=1 	
end
puts "calurate completed"
sum=0
i=0
while i<result.count
	if result[i]
		sum+=i
	end
	i+=1
end
puts sum



