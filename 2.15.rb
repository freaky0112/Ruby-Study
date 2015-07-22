marks=[90,30,100,70,65,89,52,60]
i=0
marks.each do |mark|
	i+=1
	puts "第"+i.to_s+"个学生的成绩是："+mark.to_s
end