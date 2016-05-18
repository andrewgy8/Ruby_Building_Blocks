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

	#--------------------------
	#------Search Methods------
	#--------------------------

	def breadth_first_search(target)
		queue = []
		queue << self
		#puts queue.inspect
		while !queue.empty?
			n = queue.shift
			value_to_check = n.value

			if value_to_check == target
				puts "Value #{target} found in node #{n}"
				return n
			else 
				#puts "Value #{target} not found in node #{n.value}"
				#puts "Moving on..."
				queue << n.lchild if !n.lchild.nil?
				queue << n.rchild if !n.rchild.nil?
			end
		end
		puts "Value #{target} not found in the binary tree. \nPlease enter another value to check for."

	end
	def depth_first_search
	
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
		puts "Left branch: #{tree.value} => #{tree.lchild.value}" if !tree.lchild.nil?
		puts "Right branch: #{tree.value} => #{tree.rchild.value}" if !tree.rchild.nil?
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
bi_tree = build_tree(arry)
look_tree(bi_tree)
bi_tree.breadth_first_search(23)
bi_tree.breadth_first_search(10)


