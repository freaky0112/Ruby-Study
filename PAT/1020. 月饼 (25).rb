# 1020. 月饼 (25)
# 月饼是中国人在中秋佳节时吃的一种传统食品，不同地区有许多不同风味的月饼。现给定所有种类月饼的库存量、总售价、以及市场的最大需求量，请你计算可以获得的最大收益是多少。
# 注意：销售时允许取出一部分库存。样例给出的情形是这样的：假如我们有3种月饼，其库存量分别为18、15、10万吨，总售价分别为75、72、45亿元。如果市场的最大需求量只有20万吨，那么我们最大收益策略应该是卖出全部15万吨第2种月饼、以及5万吨第3种月饼，获得 72 + 45/2 = 94.5（亿元）。
# 输入格式：
# 每个输入包含1个测试用例。每个测试用例先给出一个不超过1000的正整数N表示月饼的种类数、以及不超过500（以万吨为单位）的正整数D表示市场最大需求量。随后一行给出N个正数表示每种月饼的库存量（以万吨为单位）；最后一行给出N个正数表示每种月饼的总售价（以亿元为单位）。数字间以空格分隔。
# 输出格式：
# 对每组测试用例，在一行中输出最大收益，以亿元为单位并精确到小数点后2位。
# 输入样例：
# 3 20
# 18 15 10
# 75 72 45
# 输出样例：
# 94.50


class Goods
	def initialize(type,stocks,price)
		@type=type
		@stocks=stocks
		@price=price
	end	

	def price
		return @price
	end

	def stocks
		return @stocks
	end

	def to_s
		return "#{@type} #{@stocks} #{@price}"
	end
end

str=gets.chomp.split(' ')
types=str[0].to_i
max=str[1].to_f
str1=gets.chomp.split(' ')
str2=gets.chomp.split(' ')
list=Array.new()
i=0
while i<types
	type=i
	stocks=str1[i].to_f
	price=str2[i].to_f/stocks
	goods=Goods.new(type,stocks,price)
	list<<goods
	i+=1
end
list.sort_by! { |e| e.price }.reverse!
sum=0
list.each { |e|		
	if max==0
		break
	elsif e.stocks<max
		sum+=e.stocks*e.price
		max=max-e.stocks
	elsif max<=e.stocks			
		sum+=e.price*max
		max=max-max
	end
}
puts "%.2f" % sum