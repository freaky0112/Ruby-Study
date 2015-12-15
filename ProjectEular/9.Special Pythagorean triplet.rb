def Pythagorean(a,b)
	c=Math.sqrt(a**2+b**2).to_i
	if a**2+b**2==c**2
		return c
	else
		return 0
	end
end

a=2
while a<333
	b=a
	while b<500
		c=Pythagorean(a,b)
		if a+b+c==1000
			puts a*b*c
		end
		b+=1
	end
	a+=1
end