def getSum(n)
	i=0
	sum=0
	while i<1000
		if i%n==0
			sum+=i
		end
		i+=1
	end
	return sum
end

result=getSum(3).to_i+getSum(5).to_i-getSum(15).to_i
p result