puts "enter the text:"
input = gets.chomp
split_up = input.split('')
puts 'How many letters would you like to shift by?'
number = gets.chomp.to_i


def cipher(message, shift)
	#the alphabet to index through
	alphabet = 'abcdefghijklmnopqrstuvwxyz'
	
	#our message to be added to 
	cipher_message = ''
	
	#iterates through each character split into an array and determines if it is a character or a letter in the alphabet.  
	message.each do |letter|
		if '?!,._ '.include?(letter)
			cipher_message << letter
		else
			#if the character +shift position in the array is above z, then the remainder will be the starting point for the array location starting at a. 
			cipher_letter = alphabet[(alphabet.index(letter.downcase) + shift) % alphabet.size]
			
			#maintain case
			if letter == letter.downcase
				cipher_message << cipher_letter.downcase
			elsif letter == letter.upcase
				cipher_message << cipher_letter.upcase
			end
		end	
	end
	puts cipher_message
end

cipher(split_up, number)

