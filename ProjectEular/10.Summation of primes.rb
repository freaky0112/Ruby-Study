def defPrimes(limit)
	primes=Array.new(limit) { |i| i=true  }
	i=2
	while i<limit
		if primes[i]
			n=i
			while i*n<limit
				primes[i*n]=false
				n+=1
			end
		end
		i+=1	
	end
	return primes
end
limit=2000000
primes=defPrimes(limit)
i=2
sum=0
while i<=limit
	if primes[i]
		sum+=i		
	end
	i+=1
end
puts sum