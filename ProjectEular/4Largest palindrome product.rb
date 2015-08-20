def JudgeString(number)
	return number==number.reverse
end
array=Array.new
limit=999
i=limit
loop {
	j=limit
	loop {
		number=i*j
		if JudgeString(number.to_s)
			array=array.push(number)
			break
		end				
		j-=1
		if j==0
			break
		end
	  }
	  i-=1
	  if i==0
	  	break
	  end
 }
 puts array.max