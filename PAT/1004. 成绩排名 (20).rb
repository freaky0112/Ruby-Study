# 1004. 成绩排名 (20)
# 读入n名学生的姓名、学号、成绩，分别输出成绩最高和成绩最低学生的姓名和学号。
# 输入格式：每个测试输入包含1个测试用例，格式为
#   第1行：正整数n
#   第2行：第1个学生的姓名 学号 成绩
#   第3行：第2个学生的姓名 学号 成绩
#   ... ... ...
#   第n+1行：第n个学生的姓名 学号 成绩
# 其中姓名和学号均为不超过10个字符的字符串，成绩为0到100之间的一个整数，这里保证在一组测试用例中没有两个学生的成绩是相同的。

class Student
	def initialize(name,no,mark)
		@stu_name=name
		@stu_no=no
		@stu_mark=mark
	end
	def mark()
		return @stu_mark.to_i
	end
	def display_details()	
		puts "#{@stu_name} #{@stu_no}"
	end

end


def getMax(marks)
	mark=marks[0]
	marks.each { |e|
		if e>mark
			mark=e
		end
	  }
	  return mark
end

def getMin(marks)
	mark=marks[0]
	marks.each { |e|
	if e<mark
	  	mark=e
	  end  }
	  return mark
end

no=gets.chomp
stds=Array.new()
marks=Array.new()
count=no.to_i
i=0
while i<count
	str=gets.chomp
	name=str.split(' ')[0]
	no=str.split(' ')[1]
	mark=str.split(' ')[2]
	stu=Student.new(name,no,mark)
	stds<<stu
	if marks.include?(mark)
		stds.clear
		break
	end
	marks<<mark.to_i
	i=i+1
end
stds.each { |e|
	if e.mark()==getMax(marks)
		e.display_details
	end
  }
stds.each { |e|
if e.mark()==getMin(marks)
	e.display_details
end
}

