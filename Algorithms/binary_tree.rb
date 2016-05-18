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
	
	def depth_first_search(target)
		queue = []
		result = []
		queue << self
		while !queue.empty?
			n = queue.last
			value_to_check = n.value
			#puts value_to_check

			if value_to_check == target
				puts "Value #{target} was found in node #{n}"
				return n
			else
				if !n.rchild.nil? && !result.include?(n.rchild)
					queue << n.rchild
				elsif !n.lchild.nil? && !result.include?(n.lchild)
					queue << n.lchild
				else
					poppy_cock = queue.pop
					result << poppy_cock
					if queue.last == self
						puts "Sorry value #{target} was not found in this binary tree."
						break
					end
				end
			end 
		end
	end

	def dfs_rec(target)
		node = nil

		if self.value == target
			puts "The value #{target} exists in the binary tree at node: #{self}."

		else
			if node.nil?
				node = self.lchild.dfs_rec(target) if !self.lchild.nil?
				return node.lchild if !node.nil?
				node = self.rchild.dfs_rec(target) if !self.rchild.nil?
				return node.rchild if !node.nil?
			end
		end
		puts "Value #{target} was not found in this binary tree" if self.parent.nil? && node.nil?
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

def display_builder(level, value, lchild, rchild)
	puts %q<		
					value 
					/ \
				lchild	rchild
			>

end
def display_tree(tree, level=0)
	if !tree.rchild.nil? || !tree.lchild.nil?
		if !tree.lchild.nil?
			puts "
					\n\t\t\t\t#{tree.value} 
						\n\t\t\t\t/ \\
	\n\t\t\t\t#{tree.lchild.value}  #{tree.rchild.value}

				" 
		elsif !tree.rchild.nil?
			print "Level: #{level} 	\n#{tree.value} <<<< #{tree.rchild.value}" 
		end
		display_tree(tree.lchild, level+1) if !tree.lchild.nil?
		display_tree(tree.rchild, level+1) if !tree.rchild.nil?
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
#look_tree(bi_tree)
puts "<<<" * 50
display_tree(bi_tree)
puts "----------BFS TEST---------"
bi_tree.breadth_first_search(23)
bi_tree.breadth_first_search(10)
puts "----------DFS TEST---------"
bi_tree.depth_first_search(23)
bi_tree.depth_first_search(10)
puts "----------DFS REC TEST---------"
bi_tree.dfs_rec(23)
bi_tree.dfs_rec(10)



# 				value
# 				/	\
# 			rchild	lchild
#
#
#
#
#
#

