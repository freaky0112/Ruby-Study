# 1031. 查验身份证(15)
# 一个合法的身份证号码由17位地区、日期编号和顺序编号加1位校验码组成。校验码的计算规则如下：
# 首先对前17位数字加权求和,权重分配为：{7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2}；然后将计算的和对11取模得到值Z；最后按照以下关系对应Z值与校验码M的值：
# Z：0 1 2 3 4 5 6 7 8 9 10
# M：1 0 X 9 8 7 6 5 4 3 2
# 现在给定一些身份证号码,请你验证校验码的有效性,并输出有问题的号码。
# 输入格式：
# 输入第一行给出正整数N（<= 100）是输入的身份证号码的个数。随后N行,每行给出1个18位身份证号码。
# 输出格式：
# 按照输入的顺序每行输出1个有问题的身份证号码。这里并不检验前17位是否合理,只检查前17位是否全为数字且最后1位校验码计算准确。如果所有号码都正常,则输出“All passed”。
# 输入样例1：
# 4
# 320124198808240056
# 12010X198901011234
# 110108196711301866
# 37070419881216001X
# 输出样例1：
# 12010X198901011234
# 110108196711301866
# 37070419881216001X
# 输入样例2：
# 2
# 320124198808240056
# 110108196711301862
# 输出样例2：
# All passed




def isNumber(chr)
	regex=/\d/
	return chr=~regex
end

def verify(id)
	weight=[7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2]
	m=[1,0,'X',9,8,7,6,5,4,3,2]
	i=0
	sum=0
	while i<17
		if isNumber(id[i])
			# puts "#{weight[i]},#{id[i]}"
			sum+=weight[i]*id[i].to_i
		else
			return true
		end
		i+=1
	end	
	# puts "#{sum%11},#{id[17]}"
	if m[sum%11].to_s==id[17].to_s
		return false
	else
		return true
	end
end

no=gets.chomp.to_i
list=Array.new()
i=0
while i<no
	id=gets.chomp
	if verify(id)
		list<<id
	end
	i+=1	
end

if list.count==0
	puts "ALL passed"
else
	puts list
end
