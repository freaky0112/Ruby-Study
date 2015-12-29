# 1015. 德才论 (25)
# 宋代史学家司马光在《资治通鉴》中有一段著名的“德才论”：“是故才德全尽谓之圣人，才德兼亡谓之愚人，德胜才谓之君子，才胜德谓之小人。凡取人之术，苟不得圣人，君子而与之，与其得小人，不若得愚人。”
# 现给出一批考生的德才分数，请根据司马光的理论给出录取排名。
# 输入格式：
# 输入第1行给出3个正整数，分别为：N（<=105），即考生总数；L（>=60），为录取最低分数线，即德分和才分均不低于L的考生才有资格被考虑录取；H（<100），为优先录取线——德分和才分均不低于此线的被定义为“才德全尽”，此类考生按德才总分从高到低排序；才分不到但德分到线的一类考生属于“德胜才”，也按总分排序，但排在第一类考生之后；德才分均低于H，但是德分不低于才分的考生属于“才德兼亡”但尚有“德胜才”者，按总分排序，但排在第二类考生之后；其他达到最低线L的考生也按总分排序，但排在第三类考生之后。
# 随后N行，每行给出一位考生的信息，包括：准考证号、德分、才分，其中准考证号为8位整数，德才分为区间[0, 100]内的整数。数字间以空格分隔。
# 输出格式：
# 输出第1行首先给出达到最低分数线的考生人数M，随后M行，每行按照输入格式输出一位考生的信息，考生按输入中说明的规则从高到低排序。当某类考生中有多人总分相同时，按其德分降序排列；若德分也并列，则按准考证号的升序输出。
# 输入样例：
# 14 60 80
# 10000001 64 90
# 10000002 90 60
# 10000011 85 80
# 10000003 85 80
# 10000004 80 85
# 10000005 82 77
# 10000006 83 76
# 10000007 90 78
# 10000008 75 79
# 10000009 59 90
# 10000010 88 45
# 10000012 80 100
# 10000013 90 99
# 10000014 66 60
# 输出样例：
# 12
# 10000013 90 99
# 10000012 80 100
# 10000003 85 80
# 10000011 85 80
# 10000004 80 85
# 10000007 90 78
# 10000006 83 76
# 10000005 82 77
# 10000002 90 60
# 10000014 66 60
# 10000008 75 79
# 10000001 64 90

class Student
	def initialize(no,mark_one,mark_two)
		@stu_no=no
		@stu_mark_one=mark_one#德分
		@stu_mark_two=mark_two#才分
	end

	def total()
		return @stu_mark_one+@stu_mark_two
	end

	def >(o)
		if total()!=o.total()
			return total()>o.total()
		elsif @stu_mark_one!=o.stu_mark_one			
			return @stu_mark_one>o.stu_mark_one
		else
			return @stu_no<o.stu_no
		end
	end

	def stu_mark_one
		return @stu_mark_one
	end

	def stu_mark_two
		return @stu_mark_two
	end

	def stu_no
		return @stu_no
	end

	def to_s
		return "#{@stu_no} #{@stu_mark_one} #{@stu_mark_two}"
	end
end

def count(list)
	sum=0
	list.each { |e|  
		e.sort! { |a, b| [b.total(),b.stu_mark_one,b.stu_no] <=> [a.total(),a.stu_mark_one,b.stu_no]}
		sum+=e.count
	}
	return sum,list
end

a=Student.new(1,2,6)
b=Student.new(2,3,5)

str=gets.chomp()
number=str.split(' ')[0].to_i
base=str.split(' ')[1].to_i
high=str.split(' ')[2].to_i
list=Array.new(4) {|e|
	e=Array.new()
}
i=0
while i<number
	str=gets.chomp
	no=str.split(' ')[0].to_i
	mark_one=str.split(' ')[1].to_i
	mark_two=str.split(' ')[2].to_i
	stu=Student.new(no,mark_one,mark_two)
	if mark_one<base||mark_two<base		
		#无视
	elsif mark_one>=high&&mark_two>=high		
		list[0]<<stu
	elsif mark_one>=high&&mark_two<high
		list[1]<<stu
	elsif mark_one>=mark_two
		list[2]<<stu
	else
		list[3]<<stu
	end
	i+=1
end
puts count(list)