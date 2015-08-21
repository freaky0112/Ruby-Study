def SumOfSquares(start_no,end_no)
	result=0
	while start_no<=end_no
		result+=start_no**2
		start_no+=1
	end
	return result
end

def SquaresOfSum(start_no,end_no)
	result=0
	while start_no<=end_no
		result+=start_no
		start_no+=1
	end
	return result**2
end

start_no=1
end_no=100
result=SquaresOfSum(start_no,end_no)-SumOfSquares(start_no,end_no)
p result