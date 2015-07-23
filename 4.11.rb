class Person
	def initialize(name)
		@name=name
	end

	def to_s
		return @name
	end

	def sayHello(name)
		@newname=name.to_s
		puts "#{"Hello,"}#{@newname}"
	end
end

p=Person.new("joker zhan")
f=Person.new("peter li")

p.sayHello(f)
f.sayHello(p)