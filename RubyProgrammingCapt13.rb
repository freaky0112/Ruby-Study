
def creat_arr
	arr=[]
	i=1
	while i<=100
		arr<<i
		i+=1
	end
	return arr
end

def expend_arr (a)
	arr=[]
	a.each do |elem|
		arr<<elem*100
	end
	 return arr
end

def get_threemultiplearr(a)
	arr=[]
	a.each { |elem| 
		if elem%3==0
			arr<<elem

		end
	}
	return arr
end

def desc_arr(a)
	return a.reverse!	
end

def sum_arr(a)
	i=0
	a.each { |e| 
		i+=e.to_i
	 }	
	 return i
end


def sum_array(a,b)
	result=[]
	a.zip(b) { |a1,b1| 
		result<<a1+b1
	 }
	return result
end

p sum_array([1,2,3],[4,6,8])