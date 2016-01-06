# 1035. 插入与归并(25)
# 插入排序是迭代算法，逐一获得输入数据，逐步产生有序的输出序列。每步迭代中，算法从输入序列中取出一元素，将之插入有序序列中正确的位置。如此迭代直到全部元素有序。
# 归并排序进行如下迭代操作：首先将原始序列看成N个只包含1个元素的有序子序列，然后每次迭代归并两个相邻的有序子序列，直到最后只剩下1个有序的序列。
# 现给定原始序列和由某排序算法产生的中间序列，请你判断该算法究竟是哪种排序算法？
# 输入格式：
# 输入在第一行给出正整数N (<=100)；随后一行给出原始序列的N个整数；最后一行给出由某排序算法产生的中间序列。这里假设排序的目标序列是升序。数字间以空格分隔。
# 输出格式：
# 首先在第1行中输出“Insertion Sort”表示插入排序、或“Merge Sort”表示归并排序；然后在第2行中输出用该排序算法再迭代一轮的结果序列。题目保证每组测试的结果是唯一的。数字间以空格分隔，且行末不得有多余空格。
# 输入样例1：
# 10
# 3 1 2 8 7 5 9 4 6 0
# 1 2 3 7 8 5 9 4 6 0
# 输出样例1：
# Insertion Sort
# 1 2 3 5 7 8 9 4 6 0
# 输入样例2：
# 10
# 3 1 2 8 7 5 9 4 0 6
# 1 3 2 8 5 7 4 9 0 6
# 输出样例2：
# Merge Sort
# 1 2 3 8 4 5 7 9 0 6
def insertion(list)
	result=Array.new()
	i=0
	while i<list.count
		temp=list[i]
		j=i-1
		while j>=0&&list[j]>temp
			list[j+1]=list[j]
			j-=1	
		end
		list[j+1]=temp
		i+=1
		result<<list.to_s
	end
	return result
end

def merge(right,left)
	if right==nil
		right=Array.new(0)
	end
	if left==nil
		left=Array.new(0)
	end
	temp=Array.new() 
	while right.count>0&&left.count>0
		if left[0]<=right[0]
			temp<<left[0]
			left.shift
		else
			temp<<right[0]
			right.shift
		end
	end 
	if left.count>0
		left.each { |e| 
			temp<<e
		 }
	end
	if right.count>0
		right.each { |e| 
			temp<<e
		 }
	end
	return temp
end

def mergesort(list)
	result=Array.new()
	i=1
	count=list.count
	arr=Array.new()
	while i<list.count
		j=0
		while j<count
			left=list[j,i]
			right=list[j+i,i]
			merge(right,left).each { |e| 
				arr<<e
			 }
			j+=i+i			
		end
		if list!=arr
			list.clear
			arr.each { |e|
				list<<e
			  }
			arr.clear
		end
		result<<list.to_s
		i+=i
	end
	return result
end


def strToNum(list)
	newlist=Array.new()
	list.each { |e| newlist<<e.to_i }
	return newlist
end

def strToResult(str)
	str=str[1,str.length-2]
	result=""
	str.split(',').each { |e|
		result<<"#{e.strip} "
	  }
	return result.rstrip
end


gets
list1=strToNum(gets.chomp.split(' '))
match=strToNum(gets.chomp.split(' '))
list2=Array.new() 
list1.each { |e|  
	list2<<e
}
insertion=insertion(list1)
merge=mergesort(list2)
i=1
while i<insertion.count
	if insertion[i]==match.to_s
		puts "Insertion Sort"
		puts strToResult(insertion[i+1])
	end
	i+=1
end
i=0
while i<merge.count
	if merge[i]==match.to_s
		puts "Merge Sort"
		puts strToResult(merge[i+1])
	end
	i+=1
end


