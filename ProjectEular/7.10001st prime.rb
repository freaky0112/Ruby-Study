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

primes=defPrimes(1000000)
i=2
n=0
loop { 
	if primes[i]
		n+=1
		if n==10001
			break
		end
		# if n%100==0
		# 	puts n.to_s+","+i.to_s
		# end
	end
	i+=1
 }
puts n.to_s+","+i.to_s

