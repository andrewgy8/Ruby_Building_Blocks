require 'yaml'

class Board
	
	def initialize(player, computer, word)
		@word = word
		@player = player
		@computer = computer
		@turns = 5
		@word_progress = Array.new(@word.length) { "__ " }
		@word_fill_compare = Array.new(@word.length) { nil }
		@guessed_letters = Array.new { nil }
	end

	def game_loop
		load_decision
		while @turns > 0
			save_decision
			show_word_progress
			show_guessed_letters
			letter = letter_guess
			letter_scan(letter)
			check_for_win
			puts "***" * 10
		end

		#if the player loses, the word is displyed
		if @turns == 0
			word_display
		end
	end

	def save_decision
		puts "Would you like to save the game?"
		puts "Press enter to continue or type 'yes' to save."
		decision = gets.chomp.downcase
		if decision == 'yes'
			save_game
		end
	end

	def save_game

		data = {}
			data[:word] = @word
			data[:word_progress] = @word_progress
			data[:guessed_letters] = @guessed_letters
			data[:turns] = @turns
			data[:word_fill_compare] = @word_fill_compare

		File.open('save1.yaml', 'w') do |file|
			file.write YAML.dump(data)
			file.close
		end 

		puts "Saved game..."
	end

	def load_decision
		puts "Would you like to load a previous game?"
		puts "Please type 'yes' or press enter to continue."
		decision = gets.chomp.downcase
		if decision == 'yes'
			load_game
		end
	end

	def load_game
		
		data = YAML.load_file("save1.yaml")
		data.game_loop
		puts data	
	end

	def letter_guess
		puts "What letter would you like to guess #{@player.name}"
		letter_guess = gets.chomp.downcase
	end

	def word_display
		puts "Sorry #{@player.name}, but you have lost."
		puts "The word was #{@word}."
	end

	def letter_scan (letter)
		#determine if the letter exists in the word
		if @word.downcase.include? (letter)
			puts "Correct! #{letter} is in the word."
			insert_letter (letter)
		else
			@turns -= 1
			negative_response
			guessed_letters(letter)
		end
	end	

	def check_for_win
		abort("You win #{@player.name}! You guessed #{@word}") unless @word_fill_compare.join != @word
	end

	def negative_response
		puts "Im sorry, but your guess is not in the chosen word."
	end

	def insert_letter(letter)
		#pushs guessed letter into two different arrays
		#the one to be displayed with the underscores, and the other to check with a win.
		#since the @word_fill has a space after the letter for formatting reasons.
		#For words with the same letter multiple times, it scans through and returns the index number of the letter multiple times.  

		word_array = @word.split('')
		index_for_letter = word_array.each_index.select {|x| @word[x] == letter}
		index_for_letter.each {|x| @word_progress[x] = letter + ' '}
		index_for_letter.each {|x| @word_fill_compare[x] = letter}
	end
	
	def guessed_letters(letter)
		#inserts guessed letter into array
		@guessed_letters << letter
	end

	def show_guessed_letters
		#Prints guessed letters and number of turns left
		puts "These are the letters you have guessed so far:" + @guessed_letters.inspect
		puts "You have #{@turns} mistakes left."
	end

	def show_word_progress
		#Prints the Array of word progress
		puts @word_progress.join
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
		#cuts /n off of the chosen word
		hangman_word.chomp!.downcase!
		word_length_checker(hangman_word)
	end

	def word_length_checker(hangman_word)
		#Determines if the chosen word is 5 characters long, if not, it reruns the path.
		if hangman_word.to_s.length < 5
			hangman_word = word_choice_path
		else
			return hangman_word
		end
	end

	def pick_word(line_number)
		#Goes to the random line number and extracts the word
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
		#Count number of lines in the given text file
		count = %x{wc -l #{@dictionary}}.split.first.to_i
	end

	def pick_line_number(total_lines)
		#Picks a random line number
		 rand(1...total_lines)
	end
end

human = HumanPlayer.new('EVA')
comp = Computer.new('hangman_dic.txt')
comps_word = comp.word_choice_path

#puts comps_word.inspect
game = Board.new(human, comp, comps_word)
game.game_loop

