module Test	
	def self.show
		puts "这是个猜数字的游戏"
	end	

	def go
		a=rand(100)
		while true
			puts "请输入0-100之间的数字，猜测系统内置数字的大小"
			b=gets
			if a.to_i>b.to_i
				puts "你输入的数字小了"
			elsif a.to_i<b.to_i
				puts "你输入的数字大了"
			elsif a.to_i==b.to_i
				puts "恭喜你猜对了"
				break
			end	
		end
	end

	def try
		puts "just a try"
	end
end
#Test.show

