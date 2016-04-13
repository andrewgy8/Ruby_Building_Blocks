dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
	#match hash
	matches_hash = Hash.new(0)
	#deletes all characters except those in the regexp
	word = word.gsub(/[^0-9a-zA-Z]/, ' ')
	#split input
	split_word = word.downcase.split(' ')

	#creates hashes match with 0 value
	dictionary.each do |dict_word|
		matches_hash[dict_word] += 0
	end	
	
	#matches the input word to a key in the dictionary and assigns that output array to a variable match
	split_word.each do |words|
		$positive_match = matches_hash.select {|k,v| k.match(words)}
		
		#adds one to the has value if there is a match found
		$positive_match.update($positive_match){|k,v1| v1+1}
		
		#merges both the match and dictionary with a value of 1
		matches_hash.merge!($positive_match).inspect 
	end
	matches_hash.delete_if {|k,v| v == 0}
	puts matches_hash
end

substrings('Below', dictionary)



