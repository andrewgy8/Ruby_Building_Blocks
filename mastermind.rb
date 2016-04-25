class Game

	def initialize(human_player, computer_player)
		@human_player = human_player
		@computer_player = computer_player	
		@turns = 0	
		
	end
	def game_loop
		while @turns <= 10

		end
		
	end
	def input_from_guesser
		@delegate.send(meth, *args, &block)
	end
	def output_from_computer(guess)
		
	end
	def check_for_win?
		
	end
	def return_if_index_is_correct
		
	end
	def return_if_color_is_correct
		
	end
	
	
end

class HumanPlayer
	def initialize(name)
		@name = name
	end
	def print_name
		puts "This is the human players name: #{name}"
	end
end

class ComputerPlayer
	attr_reader :code
	def initialize(code)
		@code = code
	end
	
	def code_generator
		#Input a random code generator here!
		puts "I am the computer, and I have generated a code that you need to figure out in 10 tries."
		puts "Good luck!"
	end
	
	
end