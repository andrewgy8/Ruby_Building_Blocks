class Board
	
	def initialize(player, computer, word)
		@word = word
		@player = player
		@computer = computer
		@turns = 5
		@word_fill = Array.new(@word.length - 1) { "__ " }
		@guessed_letters = Array.new { nil }
	end

	def game_loop
		while @turns > 0
			show_word_progress
			letter = letter_guess
			letter_scan(letter)
			check_for_win
			puts "***" * 10
		end
	end

	def letter_guess
		puts "What letter would you like to guess #{@player.name}"
		letter_guess = gets.chomp.downcase
	end
	
	def letter_scan (letter)
		if @word.downcase.include? (letter)
			insert_letter (letter)
		else
			@turns -= 1
			negative_response
			show_guessed_letters(letter)
		end
	end	

	def check_for_win
		if @word_fill.join == @word
			puts "You win #{@player.name}!"
				
		end
	end

	def negative_response
		puts "Im sorry, but your guess is not in the chosen word."
		puts "Please choose again."	
	end

	def insert_letter(letter)
		index_for_letter = @word.each_index.select {|x| @word[x] == letter}
		puts index_for_letter.inspect
		@word_fill[index_for_letter] = letter + ' '
	end
	
	def show_guessed_letters(letter)
		@guessed_letters << letter
		puts "These are the letters you have guessed so far:" + @guessed_letters.inspect
		puts "You have #{@turns} mistakes left."
	end

	def show_word_progress
		puts @word_fill.join
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

comps_word.chomp!
puts comps_word.inspect
game = Board.new(human, comp, comps_word)
game.game_loop

