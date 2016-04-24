
class Game
	attr_writer :board
	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		
		#The blank "board" imagined as an array
		@board = Array.new(10, nil)
		
		#All the win conditions
		@WIN_COMBO = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
		@turns = 0
		game_engine
	end
	
	def show_board
		column, row = ' | ', '--+---+--'

		#for each spot on "the board", it determines if its occupied by a marker
		#if it is, it prints that marker, if not, it prints the number associated with that spot
		space_marker = lambda{|position| @board[position] ? @board[position] : position}
		row_numbers = [[1,2,3],[4,5,6],[7,8,9]]
		
		#for each number in the row, it joins the column seperator 
		#with either the position number or marker sotred in the object variable @board
		row_for_print = lambda{|row| row.map(&space_marker).join(column)}
		
		#iterates through row numbers with another lambda, row for print
		rows_for_display = row_numbers.map(&row_for_print)
		
		puts rows_for_display.join("\n" + row + "\n")
		
	end

	def check_for_a_win?(player)
		#I beleive this can refacotred and moved into a lambda
		#puts 'This is the index number'
		check_array = @board.each_index.select {|i| @board[i] == player.marker}
		#puts a_check_array.inspect
		combo_check = x_check_array.combination(3).to_a
		#puts x_combo_check.inspect
		combo_check_block = x_combo_check.collect {|combo| @WIN_COMBO.include?(combo)}
		#puts x_combo_check_block.inspect

		if combo_check_block.any? == true
			puts "You win #{player.name}"
		else 
			false
		end
	end
	
	def choice(player)
		#show_board
		#this can be a begin/recue 
		puts "What would you like to pick #{player.name}?"
		players_pick = gets.chomp.to_i
		#if players_pick > 9
		#	puts "Oops! You have picked to large of a number. Please choose again."
		#	return choice(player)
		#end
		
	end
	
	def assign_choice_to_board(pick, player)
		@board[pick] = player.marker	
	end

	def current_player
		@turns % 2 == 0 ? @player1 : @player2
	end

	def game_engine
		while @turns < 10
			show_board
			player = current_player
			pick = choice(player)
			assign_choice_to_board(pick, player)
			if check_for_a_win?(player) != false
				puts 'End of game!'
				break
			end
			@turns += 1
		end
		puts 'This seems to of been a cats game'
	end
	
end

class Player
	attr_reader :marker, :name
	def initialize(marker, name)
		@marker = marker
		@name = name
		print_name
	end
	
	def print_name
		puts "Hello #{@name}"
		puts "You are about to play tictactoe."
		puts "Your marker is #{@marker}"
	end
	
end



my_game = Game.new(Player.new('X', 'Andrew'), Player.new('O', 'Eva'))