# 1028. 人口普查(20)
# 某城镇进行人口普查，得到了全体居民的生日。现请你写个程序，找出镇上最年长和最年轻的人。
# 这里确保每个输入的日期都是合法的，但不一定是合理的——假设已知镇上没有超过200岁的老人，而今天是2014年9月6日，所以超过200岁的生日和未出生的生日都是不合理的，应该被过滤掉。
# 输入格式：
# 输入在第一行给出正整数N，取值在(0, 105]；随后N行，每行给出1个人的姓名（由不超过5个英文字母组成的字符串）、以及按“yyyy/mm/dd”（即年/月/日）格式给出的生日。题目保证最年长和最年轻的人没有并列。
# 输出格式：
# 在一行中顺序输出有效生日的个数、最年长人和最年轻人的姓名，其间以空格分隔。
# 输入样例：
# 5
# John 2001/05/12
# Tom 1814/09/06
# Ann 2121/01/30
# James 1814/09/05
# Steve 1967/11/20
# 输出样例：
# 3 Tom John

class Person
	def initialize(name,date)
		@name=name
		@date=date
	end

	def name
		return @name
	end

	def date
		return @date
	end	

	def to_s
		return "#{name} #{date}"
	end
	
end

def verify(time)
	now=Time.new(2014,9,6)
	oldest=Time.new(1814,9,6)	
	if time<oldest||now-time<0
		return false
	else
		return true
	end
end
def getTime(date)	
	year=date[0].to_i
	month=date[1].to_i
	day=date[2].to_i
	time=Time.new(year,month,day)
	return time
end

no=gets.chomp.to_i
list=Array.new()
while no>0
	info=gets.chomp.split(' ')
	name=info[0]
	date=info[1].split('/')
	time=getTime(date)
	if verify(time)
		person=Person.new(name,time)
		list<<person
	end
	no-=1
end
list.sort_by! { |e| e.date }
old=list[0].name
young=list.reverse[0].name
puts "#{list.count} #{old} #{young}"