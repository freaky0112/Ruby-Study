def defPrimes(limit)
	primes=Array.new(limit) { |i| i=true  }
	i=2
	while i<limit
		if primes[i]
			n=2
			while i*n<limit
				primes[i*n]=false
				n+=1
			end
		end
		i+=1	
	end
	return primes
end

number=600851475143
i=Math.sqrt(number).to_i
primes=defPrimes(i)
while i>0
	if primes[i]
		if number%i==0
			puts i
			break
		end
	end
	i-=1
end


