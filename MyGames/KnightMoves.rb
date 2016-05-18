class KnightMoves
	attr_reader :value
	attr_accessor :rchild, :lchild, :parent
	
	def initialize(value, parent = nil, lchild = nil, rchild = nil)
		@value = value
		@rchild = rchild
		@lchild = lchild
		@parent = parent
	end

	def add_possible_move(val)
		if val <= self.value && self.lchild.nil?
			self.lchild = KnightMoves.new(val, self)
		elsif val<= self.value && self.lchild != nil 
			self.lchild.add_node(val)
		elsif val > self.value && self.rchild.nil?
			self.rchild = KnightMoves.new(val, self)
		elsif val > self.value && self.rchild != nil
			self.rchild.add_node(val)
		end
	end

	def knight_moves(finish)
		#returns number of moves necessary to get to final position
	end
	

end

class Knight
	attr_accessor :position
	def initialize(position)
		@position = position
	end
end

#--------------------------
#----------Board-----------
#--------------------------
a = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9]
board = a.combination(2).to_a
puts board.inspect
#--------------------------
#----Build Tree Methods----
#--------------------------

def build_tree(arry)
	bi_tree = KnightMoves.new(arry.first)
	arry.each_with_index do |x, i|
		if i > 0 
			puts x.inspect
			x.each do |position|
				bi_tree.add_node(position)
			end
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
#----------Script-----------
#--------------------------
knight = Knight.new([0,0])
board_tree = build_tree(board)
look_tree(board_tree)






















