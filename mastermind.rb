#code = [R = red, B = Blue, Y = Yellow, O = Orange, P = Purple, W = White]
class Game

	def initialize(human_player, computer_player)
		@human_player = human_player
		@computer_player = computer_player	
		@turns = 0	
		@indicies = 0
		@colors = 0
	end

	def game_loop
		while @turns <= 10
			puts "---" * 10
			guess = input_from_guesser
			if check_for_win?(guess)
				break
			end
			compare_guess_to_code(guess)
			output_from_computer
			delete_the_clues
			@turns += 1
			
		end
	end

	def input_from_guesser
		#puts "Hello #{@human_player.name}"
		puts "What combination of colors would you like to guess?"
		puts "Here is the color/abbreviation key:[R = red, B = Blue, Y = Yellow, O = Orange, P = Purple, W = White]"
		guess = gets.chomp.upcase!.split('')
		#returns an array of the guess combo
		guess
	end

	def output_from_computer
		puts "Your guess consists of #{@colors} correct colors and of those correct colors, #{@indicies} are in the correct location."

	end

	def check_for_win?(guess)
		if @computer_player.code.values == guess
			puts "You guessed it!"
			return true
		end
	end

	def delete_the_clues
		@indicies = 0
		@colors = 0
	end

	def compare_guess_to_code(guess)
		guess.each do |color|
			if @computer_player.code.has_value?(color) && return_if_index_is_correct?(color, guess) == true
				@colors += 1
				@indicies += 1
			elsif @computer_player.code.has_value?(color)
				@colors += 1
			end
		end
	end

	def return_if_index_is_correct?(color, guess)
		#compare the index number of the guess array to the key of the hash to see if they match up
		key_for_code = @computer_player.code.key(color)
		if key_for_code == guess.index(color)
			return true
		end
	end
	
end

class HumanPlayer
	attr_reader :name
	def initialize(name)
		@name = name
		print_name
	end

	def print_name
		puts "This is the human players name: #{@name}"
	end

end

class ComputerPlayer
	attr_reader :code

	def initialize(code)
		@code = {0 => 'B', 1 => 'Y', 2 => 'O', 3 => 'W'}
	end
	
	def code_generator
		#Input a random code generator here!
		#possible_letters 
		#puts [*(BYORPW)].sample(4).join
		#manual input for now!!
		#puts @code.inspect
		puts "I am the computer, and I have generated a code that you need to figure out in 10 tries."
		puts "Good luck!"
	end

end

guesser = HumanPlayer.new('Andrew')
setter = ComputerPlayer.new('blue')
my_game = Game.new(guesser, setter)

setter.code_generator
my_game.game_loop



