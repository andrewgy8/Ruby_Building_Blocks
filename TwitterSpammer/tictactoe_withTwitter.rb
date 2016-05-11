#There are a few things that need to be fixed:
#1)duplicate numbers inputted are not counted, nor is an error given
#2) refactoring the if/else statments
#3) Add AI player.

require_relative 'twitter_bot'


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
		check_array = @board.each_index.select {|i| @board[i] == player.marker}
		combo_check = check_array.combination(3).to_a
		combo_check_block = combo_check.collect {|combo| @WIN_COMBO.include?(combo)}

		if combo_check_block.any?
			puts "You win #{player.name}"
			tweet_out = TwitterBot.new
			tweet_out.tweet("#{player.name} has won in tictacttoe")
		else 
			false
		end
	end
	
	def choice(player)

		begin
			puts "What would you like to pick #{player.name}?"
			players_pick = gets.chomp.to_i
			if players_pick < 10
				players_pick
			else
				raise 'Number is not valid for this board'
			end
		rescue StandardError =>e
			puts "\tCaught: #{e}"
			puts "Please input a number between 0 and 9"
			retry
		end
		
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

class Reporter < TwitterBot
	attr_accessor :winner
	def initialize(winner)
		@winner = winner
	end
end


andrew = Player.new('X', 'Andrew')
eva = Player.new('O', 'Eva')
my_game = Game.new(andrew, eva)

my_game.game_engine
