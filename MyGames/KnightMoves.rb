#--------------------------
#----Knight Movement-------
#--------------------------

class KnightMoves
	
	def knight_moves(finish)
		#returns number of moves necessary to get to final position
	end
	

end

#--------------------------
#-----Knight Position------
#--------------------------
def a_possible_knight_move(x,y)
	start = [x,y]
	finish = [9,9]

	possible_moves = []
	while start != finish
		if start[0] < 10 || start[1] < 10
			x = start[0] + 3
			y = start[1] + 2
			possible_moves << [x,y]
			puts possible_moves.inspect
			a_possible_knight_move(x, y)
		elsif start[0] >= 7 || start[1] >= 7
			if start[0] >= 7 || start[1] >=7
				x = start[0] - 3
				y = start[1] - 2
				possible_moves << [x, y]
				puts possible_moves.inspect
				a_possible_knight_move(x, y)

		elsif 
			puts "Computer says I cnat move anymore"
			puts possible_moves.inspect
			break
		end
	end
end
class Knight
	attr_accessor :position
	def initialize(position)
		@position = position
		create
	end

end

#--------------------------
#----------Board-----------
#--------------------------
Board = Struct.new("Board", :x, :y)




#--------------------------
#----------Script----------
#--------------------------

#knight = Knight.new([0,0])
#board_tree = build_tree(board)
#look_tree(board_tree)

a_possible_knight_move(0,0)




