# 1003. Emergency (25)
# As an emergency rescue team leader of a city, you are given a special map of your country. The map shows several scattered cities connected by some roads. Amount of rescue teams in each city and the length of each road between any pair of cities are marked on the map. When there is an emergency call to you from some other city, your job is to lead your men to the place as quickly as possible, and at the mean time, call up as many hands on the way as possible.
# Input
# Each input file contains one test case. For each test case, the first line contains 4 positive integers: N (<= 500) - the number of cities (and the cities are numbered from 0 to N-1), M - the number of roads, C1 and C2 - the cities that you are currently in and that you must save, respectively. The next line contains N integers, where the i-th integer is the number of rescue teams in the i-th city. Then M lines follow, each describes a road with three integers c1, c2 and L, which are the pair of cities connected by a road and the length of that road, respectively. It is guaranteed that there exists at least one path from C1 to C2.
# Output
# For each test case, print in one line two numbers: the number of different shortest paths between C1 and C2, and the maximum amount of rescue teams you can possibly gather.
# All the numbers in a line must be separated by exactly one space, and there is weight extra space allowed at the end of a line.
# Sample Input
# 5 6 0 2
# 1 2 1 5 3
# 0 1 1
# 0 2 2
# 0 3 1
# 1 2 1
# 2 4 1
# 3 4 1
# Sample Output
# 2 4

class Node
	def initialize(no)
		@no=no
		@childs=Hash.new { |childs, node| childs[node] = 0 }
	end
	
	def setChild(node,weight)
		@childs[node]=weight
	end

	def childs
		return @childs
	end

	def no
		return @no		
	end

	def to_s
		return @no.to_s
	end
	
end

class Road
	def initialize(c1,c2)
		@nodes=Array.new()
		@nodes<<c1
		@nodes<<c2
		@weight=weight
	end

	def weight
		return @weight
	end
	
	def addNode(node)
		@nodes<<node
		@weight+=node.weight
	end

	def include(node)
		return @nodes.include?(node)
	end

	def last
		return @nodes[-1]
	end
	
	
end

def dijkstra(cities,c1,c2)
	list=Array.new()
	# close=open[c1.no]
	
	c1.childs.each_key { |node| 
		close=cities.delete(c1)
		road=Road.new(c1,node)
		list<<defRoad(road,c2,close)
	 }

	return list
end

def defRoad(road,c2,close)
	if road.last==node
		retrun road	
	end
	c1=road[-1]
	c1.childs.each_key	{|node|
		close=close.delete(node)
		road.addNode(node)
	}

end



l1=gets.chomp.split(' ')
cities=Array.new()
(0..l1[0].to_i).each { |e| 
	cities<<Node.new(e)
 }


l2=gets.chomp.split(' ')
teams=Array.new()
l2.each { |e| 
	teams<<e.to_i
 }
roads=Array.new()
i=0
while i<l1[1].to_i
	str=gets.chomp.split(' ')	
	node=Node.new(str[0].to_i)
	child=Node.new(str[1].to_i)
	weight=str[2].to_i
	cities[node.no].setChild(child,weight)
	i+=1
end



c1=cities[l1[2].to_i]
c2=cities[l1[3].to_i]
list=dijkstra(cities,c1,c2)
