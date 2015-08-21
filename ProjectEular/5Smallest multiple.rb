def Divisible(limit,number)
	status=true
	while limit>1
		if number%limit!=0
			status=false
			break
		end
		limit-=1
	end
	return status
end

i=20
while !Divisible(20,i)
	i+=20
end
puts i