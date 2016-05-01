class Board
	
	def initialize(player, computer)
		@player = player
		@computer = computer
		@turns = 0
	end
	
	def game_loop
		
	end

	def letter_guess

	end
	
	def letter_scan?
			
	end	

	def show_guessed_letters
		
	end

	def show_word_progress
		
	end

	def show_hangman
		
	end
	
end
class HumanPlayer
	attr_reader :name	
	def initialize(name)
		@name = name
	end
end

class Computer
	attr_reader :word	
	def initialize
		@delegate = delegate_object
	end
	
	def pick_word
		File.open("hangman_dic.txt", "r") 
			#pick random word from txt
	end
	
	
end

words = File.read 'hangman_dic.txt'

