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

limit=20
primes=defPrimes(limit)
i=2
array=Hash.new
while i<limit	
	if primes[i]
		n=0
		while i**n<=20
			n+=1
		end
		array.store(i,n-1)
	end
	i+=1
end
sum=1
array.each { |key,value| 
	sum*=key**value
 }
 puts sum