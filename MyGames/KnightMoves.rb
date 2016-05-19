=begin
Your task is to build a function knight_moves that shows the simplest possible way to get from one square 
to another by outputting all squares the knight will stop on along the way.
=end

#--------------------------
#----------Board-----------
#--------------------------

Board = Struct.new(:position, :y)		
# => Basic struct with original position and path

#--------------------------
#----Knight Movement-------
#--------------------------


def knight_moves(start, finish)
	return "Sorry that is not a valid starting position." unless is_it_a_valid_move?(start)		
	return "Sorry that is not a valid finish position." unless is_it_a_valid_move?(finish)
	return "You are ending at the same place you started.  Thats an easy problem." if start == finish

	queue = [Board.new(start, [start])] 		
	# => The knights first path is its starting position

	visited = [start]							
	# => The knight has only visited its starting position

	while !queue.empty?
		
		n = queue.shift																								
		# => Take first position data and assign to variable
		possible_moves = possible_moves(n.position).select {|move| !visited.include?(move)}							
		# => The possible moves the knight can take are checked to see if the knight has already visited there. If it has, it is excluded.

		if possible_moves.include?(finish)
			n.y << finish
			# => Push finish spot to path if the possible moves method response contains the finish location
			if n.y.size - 1 == 1
				puts "Your knight found its final position in #{n.y.size - 1} move and here is the path: #{n.y}."
			else 
				puts "You made it in #{n.y.size - 1} moves.  Here is your path: #{n.y}."
			end
			n.y.each {|position| puts position.inspect}
			# => Display all of the path the knight has taken
		end

		possible_moves.each do |move|
			# => If no finish location is found iny of the possible moves, generate new staring position from all the previous possioble moves.
			queue << Board.new(move, (n.y + [move]))
			visited << move
			# => Push visited moves so as to not have an infinite loop.
		end
	end
	# => returns number of moves necessary to get to final position
end

#--------------------------
#-----Knight Position------
#--------------------------

def is_it_a_valid_move?(move)
	# => The valid move must be within a standard chess board size 7x7 grid, and not conatain any numbers.
	return (move[0] > -1 && move[0] < 8) && (move[1] > -1 && move[1] < 8) ? true : false
end

def possible_moves(position)
	# => The knight piece can move forward/backward two, and sideways one, Vice versa.  
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





