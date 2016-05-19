
#--------------------------
#----------Board-----------
#--------------------------

Board = Struct.new(:position, :y)

#--------------------------
#----Knight Movement-------
#--------------------------


def knight_moves(start, finish)
	return "Sorry that is not a valid starting position." unless is_it_a_valid_move?(start)
	return "Sorry that is not a valid finish position." unless is_it_a_valid_move?(finish)
	return "You are ending at the same place you started.  Thats an easy problem." if start == finish

	queue = [Board.new(start, [start])]

	
	visited = [start]

	while !queue.empty?
		
		n = queue.shift
		possible_moves = possible_moves(n.position).select {|move| !visited.include?(move)}

		if possible_moves.include?(finish)
			n.y << finish
			if n.y.size - 1 == 1
				puts "Your knight found its final position in #{n.y.size - 1} move and here is the path: #{n.y}."
			else 
				puts "You made it in #{n.y.size - 1} moves.  Here is your path: #{n.y}."
			end
			n.y.each {|position| puts position.inspect}
		end

		possible_moves.each do |move|
			queue << Board.new(move, (n.y + [move]))
			visited << move
		end
	end
		#returns number of moves necessary to get to final position
end

#--------------------------
#-----Knight Position------
#--------------------------

def is_it_a_valid_move?(move)
	return (move[0] > -1 && move[0] < 8) && (move[1] > -1 && move[1] < 8) ? true : false
end

def possible_moves(position)
	possible_changes = [[2,1],[-2,1],[2,-1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
	moves = []
	possible_changes.each {|move| moves << [position[0]+move[0], position[1]+move[1]] }
	moves.select! {|pos| is_it_a_valid_move?(pos)}
	moves
end

#--------------------------
#----------Script----------
#--------------------------

#puts possible_moves([0,0])
puts knight_moves([0,0], [7,7])





