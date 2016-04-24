class Game
	
	attr_reader :player1, :player2, :starting_board
	attr_writer :starting_board
	def initialize()
		@@starting_board= Array.new(10)
		@players = [Player.new(self, 'X'), Player.new(self, 'O')]
		@current_player_id = 0
		puts show_board
		play_game
	end
	def play_game
		puts 'This is the start of tic tac toe'
		puts 'Player 1 will go first'
		loop do
			puts 'The board looks like this:'
			puts "@starting_board is suppoesed to be hear"
			puts 'Your turn player number #{@current_player_id}'
			choice
			return show_board
		end
		
	end
	def choice
		puts 'What choice would you like to make?'
		position_choice = gets.chomp.to_i
		amend_board(position_choice)
		 
	end
	def amend_board(n)
		@starting_board[choice] = :marker

		switch_player
	end
	def other_player_id
		1 - @current_player_id
	end
	def switch_player
		@current_player_id = other_player_id
	end
	def show_board
		puts 'At starting board'
		puts @@starting_board
	end
	def check_for_win?
		
		
	end
end

class Player
	attr_reader :marker
	def initialize(game, marker)
		@game = game
		@marker = marker
	end
end

game = Game.new()

