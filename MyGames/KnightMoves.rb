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
def is_it_a_valid_move?(move)
	if (move[0] > -1 && move[0] < 8) && (move[1] > -1 && move[1] < 8)
		return true
	else
		return false
	end
end

def possible_moves(position)
	possible_changes = [[2,1],[-2,1],[2,-1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
	moves = []
	possible_changes.each {|move| moves << [position[0]+move[0], position[1]+move[0]] }
	moves.select do |move| 
		unless is_it_a_valid_move?(move) 
			moves.delete(move)
		end
	end
	moves
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

possible_moves([0,0])




