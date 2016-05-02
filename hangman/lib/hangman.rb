class Board
	
	def initialize(player, computer, word)
		@word = word
		@player = player
		@computer = computer
		@turns = 0
	end

	def game_loop
		show_word_progress
	end

	def letter_guess
		
	end
	
	def letter_scan?
			
	end	

	def show_guessed_letters
		
	end

	def show_word_progress
		length = @word.length - 1
		puts "__ " * length
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

	def initialize(dictionary)
		@dictionary = dictionary
	end
	
	def word_choice_path
		count = line_counter
		line_number = pick_line_number(count)
		hangman_word = pick_word(line_number)
		word_length_checker(hangman_word)
		
	end

	def word_length_checker(hangman_word)
		if hangman_word.to_s.length < 5
			hangman_word = word_choice_path
		else
			return hangman_word
		end
	end

	def pick_word(line_number)
		f = File.open(@dictionary) do |file|
			current_line = 1
			file.each do |line|
				return line if current_line == line_number
				current_line += 1
			end
		f.close
		end
	end

	def line_counter
		count = %x{wc -l #{@dictionary}}.split.first.to_i
		
	end

	def pick_line_number(total_lines)
		 rand(1...total_lines)
	end
end

human = HumanPlayer.new('Andrew')
comp = Computer.new('hangman_dic.txt')
comps_word = comp.word_choice_path
puts comps_word
game = Board.new(human, comp, comps_word)
game.game_loop

