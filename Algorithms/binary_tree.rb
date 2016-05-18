class Node
	attr_reader :value
	attr_accessor :rchild, :lchild, :parent

	def initialize(value, parent = nil, lchild = nil, rchild = nil)
		@value = value
		@rchild = rchild
		@lchild = lchild
		@parent = parent
	end

	def add_node(val)
		if val <= self.value && self.lchild.nil?
			self.lchild = Node.new(val, self)
		elsif val<= self.value && self.lchild != nil 
			self.lchild.add_node(val)
		elsif val > self.value && self.rchild.nil?
			self.rchild = Node.new(val, self)
		elsif val > self.value && self.rchild != nil
			self.rchild.add_node(val)
		end
	end
end

#--------------------------
#----Build Tree Methods----
#--------------------------

def build_tree(arry)
	bi_tree = Node.new(arry.first)

	arry.each_with_index do |x, i|
		if i > 0 
			bi_tree.add_node(x)
		end
	end
	bi_tree
end

def look_tree(tree, level=0)
	if !tree.rchild.nil? || !tree.lchild.nil?
		puts "Level: #{level}"
		puts tree.value
		puts "Left branch: #{tree.value} => #{tree.lchild.value}" if !tree.lchild.nil?
		puts "Right branch: #{tree.value} => #{tree.rchild.vlaue}" if !tree.rchild.nil?
		look_tree(tree.lchild, level+1) if !tree.lchild.nil?
		look_tree(tree.rchild, level+1) if !tree.rchild.nil?
	end
	
end
#--------------------------
#----Sorting algortihm-----
#--------------------------

def merge_sort(list)
	
	left = []
	right = []
	result = []

	return list if list.length == 1
	
	half_length = list.length / 2
	
	0.upto(half_length-1) {|i| left << list[i] }
	half_length.upto(list.length - 1) { |i| right << list[i] }

	left = merge_sort(left)
	right = merge_sort(right)
	
	result = merge(left, right)
	result
end

def merge(left, right)
	result = []
	
	until left.empty? or right.empty?
	
		if left.first <= right.first
			result << left.first
			left = left[1..-1]
		else 
			result << right.first
			right = right[1..-1]
		end
	end

	return result + left + right
	
end

#--------------------------
#----------Script----------
#--------------------------
arry = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 324, 6345]

#sorted_array = merge_sort(arry)
#puts sorted_array
build_tree(arry)



