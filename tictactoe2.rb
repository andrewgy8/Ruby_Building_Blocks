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
		
		row = '---+---+---'
		3.times {puts row}
		puts @board
	end

	def check_for_a_win?
		puts 'This is the index number'
		a_check_array = @board.each_index.select {|i| @board[i]== 'X'}
		puts a_check_array.inspect

		combo_check = a_check_array.combination(3).to_a
		puts combo_check.inspect
		combo_check_block = combo_check.collect {|combo| @WIN_COMBO.include?(combo)}
		#puts combo_check_block.inspect
		if combo_check_block.any? == true
			puts 'You win!'
		end

		#if @WIN_COMBO.any? {|combo| combo == a_check_array} 
		#	puts 'You win!'
		#end
	end
	def choice
		show_board
		player = current_player
		puts "What would you like to pick?"
		pick = gets.chomp.to_i
		assign_choice_to_board(pick, player)
	end
	
	def assign_choice_to_board(pick, player)
		@board[pick] = player.marker
		check_for_a_win?
	end

	def current_player
		@turns % 2 == 0 ? @player1 : @player2
	end

	def game_loop
		while @turns < 10
			choice
			@turns += 1
		end
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
		puts "You are about to play tictactoe with anohter human."
		puts "And your marker is #{@marker}"
		
	end
	
end



my_game = Game.new(Player.new('X', 'Andrew'), Player.new('O', 'Eva'))