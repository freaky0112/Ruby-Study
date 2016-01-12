# 1001. A+B Format (20)
# Calculate a + b and output the sum in standard format -- that is, the digits must be separated into groups of three by commas (unless there are less than four digits).

# Input

# Each input file contains one test case. Each case contains a pair of integers a and b where -1000000 <= a, b <= 1000000. The numbers are separated by a space.

# Output

# For each test case, you should output the sum of a and b in one line. The sum must be written in the standard format.

# Sample Input
# -1000000 9
# Sample Output
# -999,991

def format(no)
	sign=no<0?"-":""		

	reslut=no.abs.to_s.reverse
	i=3
	while i<reslut.length
		reslut.insert(i,",")
		i+=4
	end
	return sign<<reslut.reverse
end


numbers=gets.chomp.split(' ')
a=numbers[0].to_i
b=numbers[1].to_i
sum=a+b
puts format(sum)