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
def Insertion(list,match)
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
		if list==match
			return true
		end
	end
	return false
end

# def merge_sort(list)
# 	if list.count<=1
# 		return list
# 	end
# 	mid=list.count/2
# 	left=Array.new()
# 	right=Array.new()
# 	i=0
# 	while i<mid
# 		left<<list[i]
# 		i+=1
# 	end
# 	while i<list.count
# 		right<<list[i]
# 		i+=1
# 	end
# 	left=merge_sort(left)
# 	right=merge_sort(right)
# 	puts left.to_s<<right.to_s
# 	return merge(right,left)
# end

# def merge(right,left)
# 	temp=Array.new() 
# 	while right.count>0&&left.count>0
# 		if left[0]<=right[0]
# 			temp<<left[0]
# 			left.shift
# 		else
# 			temp<<right[0]
# 			right.shift
# 		end
# 	end 
# 	if left.count>0
# 		left.each { |e| 
# 			temp<<e
# 		 }
# 	end
# 	if right.count>0
# 		right.each { |e| 
# 			temp<<e
# 		 }
# 	end
# 	return temp
# end

def min(x,y)
	min=(x>y)?x:y
	return min
end

def mergesort(list)
	i=1
	count=list.count
	arr=Array.new(count)
	while i<list.count
		j=0
		while j<count
			low=j
			mid=min(i+j,count)
			high=min(i+i+j,count)
			k=low
			start1=low
			end1=mid
			start2=mid
			end2=high
			while start1<end1&&start2<end2
				arr[k+=1]=list[start1]<list[start2]?list[start1+=1]:list[start2+=1]
			end
			while start1<end1
				arr[k+=1]=list[start1+=1]
			end
			while start2<end2
				arr[k+=1]=list[start2+=1]
			end
			j+=i+i
			puts arr.to_s
		end
		i+=i
	end

end


def strToNum(list)
	newlist=Array.new()
	list.each { |e| newlist<<e.to_i }
	return newlist
end


gets
list=strToNum(gets.chomp.split(' '))
match=strToNum(gets.chomp.split(' '))
# puts match.to_s
puts mergesort(list)