def Fibonacci(a,b)
	return a+b
end
array=Array.new
array[0]=1
array[1]=2
array[2]=3
i=2
while array[i]<4000000
	i+=1
	array[i]=Fibonacci(array[i-2],array[i-1])	
end
sum=0
array.each { |e| 
	if e%2==0
		sum+=e
	end
 }
 puts sum