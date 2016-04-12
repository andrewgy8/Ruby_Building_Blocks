dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
	#match hash
	matches_hash = Hash.new(0)
	#split input
	split_word = word.split('')

	#creates hashes match with 0 value
	dictionary.each do |dict_word|
		matches_hash[dict_word] += 0
	end	
	
	#matches the input word to a key in the dictionary and assigns that putput array to a variable match
	match = matches_hash.select {|k,v| k.match(word)}
	
	#merges both the match and dictionary with a value of 1 
	matches_hash.merge!(match) {|k,v1,v2| v1 + (v2.to_i + 1)}
	puts matches_hash

	matches_hash.delete_if {|k,v| v < 1}
	puts matches_hash
end

substrings('below', dictionary)


