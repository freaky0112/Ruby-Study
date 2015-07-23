info=Hash.new
info["name"]="123456"
info["pwd"]="pwd123456"
info["sex"]="男"
info["age"]=32

info.each do |key,value|
	puts key.to_s+":"+value.to_s
end 