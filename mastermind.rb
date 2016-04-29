#code = [R = red, B = Blue, Y = Yellow, O = Orange, P = Purple, W = White]
class Game

	def initialize(human_player, computer_player)
		@human_player = human_player
		@computer_player = computer_player	
		@turns = 0	
		
	end

	def game_loop
		while @turns <= 1
			guess = input_from_guesser
			if check_for_win?(guess)
				break
			end
			compare_guess_to_code(guess)
			
			#return_if_color_is_correct
			#output_from_computer


			@turns += 1
		end
	end

	def input_from_guesser
		puts "Hello #{@human_player.name}"
		puts "What would combination of colors would you like to guess?"
		puts "Here is the color/abbreviation key:[R = red, B = Blue, Y = Yellow, O = Orange, P = Purple, W = White]"
		guess = gets.chomp.upcase!.split('')
		#returns an array of the guess combo
		guess

	end

	def output_from_computer(input)


		puts "This is where the output from the computer goes, it will tell how many correct indexes you have and colors."
		puts "It will be something like 'you have guessed the correct color and position or you have only guessed the right color.'"
		puts "It will compile the data into the return_if_index_is_correct and return_if_index_is_correct"
	end

	def check_for_win?(guess)
		if @computer_player.code.values == guess
			puts "You guessed it!"
			return true
		end
	end
	def compare_guess_to_code(guess)
		guess.each do |color|
			if @computer_player.code.has_value?(color) && return_if_index_is_correct?(color, guess) == true
				puts "#{color} is there with the correct index"
				
			elsif @computer_player.code.has_value?(color)
				puts "#{color} is there only, not the index"
			else
				puts "#{color} does not exist in the color code"
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

	def return_if_color_is_correct#(color_guess)

		puts "If the color is correct, it will return the number of colors that are correct and then feed it into output"
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
		@code = {0 => 'B', 1 => 'O', 2 => 'Y', 3 => 'W'}
		
	end
	
	def code_generator
		#Input a random code generator here!

		#manual input for now!!
		puts @code.inspect
		puts "I am the computer, and I have generated a code that you need to figure out in 10 tries."
		puts "Good luck!"
	end

end

guesser = HumanPlayer.new('Andrew')
setter = ComputerPlayer.new('blue')
my_game = Game.new(guesser, setter)

setter.code_generator
my_game.game_loop



