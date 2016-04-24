require 'set'

class Game
	attr_writer :board
	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		@board = Array.new(10, nil)
		@WIN_COMBO = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,8],[3,5,7]]
		@turns = 0
		game_loop
	end
	
	def show_board
		puts "Here is a mock up of the clear board."
		column, row = '|', '---+---+---'
		2.times {puts row}
		puts @board
	end

	def check_for_a_win?(player)
		#puts 'This is the index number'
		x_check_array = @board.each_index.select {|i| @board[i] == 'X'}
		o_check_array = @board.each_index.select {|i| @board[i] == 'O'}
		#puts a_check_array.inspect

		x_combo_check = x_check_array.combination(3).to_a
		o_combo_check = o_check_array.combination(3).to_a
		#puts x_combo_check.inspect
		x_combo_check_block = x_combo_check.collect {|combo| @WIN_COMBO.include?(combo)}
		o_combo_check_block = o_combo_check.collect {|combo| @WIN_COMBO.include?(combo)}
		#puts combo_check_block.inspect
		if o_combo_check_block.any? == true
			puts "You win #{player.name}"
		elsif x_combo_check_block.any? == true
			puts "You win #{player.name}"
		else 
			false
		end
	end
	def add_win_loss

		
	end
	def choice(player)
		#show_board
		puts "What would you like to pick #{player.name}?"
		pick = gets.chomp.to_i
		
	end
	
	def assign_choice_to_board(pick, player)
		@board[pick] = player.marker
		
	end

	def current_player
		@turns % 2 == 0 ? @player1 : @player2
	end

	def game_loop
		while @turns < 9
			player = current_player
			pick = choice(player)
			assign_choice_to_board(pick, player)
			if check_for_a_win?(player) != false
				puts 'End of game!'
				break
			end

			@turns += 1
		end
	end

end

class Player
	attr_reader :marker, :name
	def initialize(marker, name)
		@marker = marker
		@name = name
		@wins = 0

		print_name
	end
	
	def print_name
		puts "Hello #{@name}"
		puts "You are about to play tictactoe with anohter human."
		puts "And your marker is #{@marker}"
	end
	
end



my_game = Game.new(Player.new('X', 'Andrew'), Player.new('O', 'Eva'))