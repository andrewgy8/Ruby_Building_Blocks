numbers = [5,6,1,8,3,9,4,3]

def bubbleSort(numbers)
	#counter for while loop
	sort = numbers.length
	while sort > 0
		#takes index and num and retruns accoringly the proper action
		numbers.each_with_index do |num, index|
			next_num = numbers[index+1]
			if next_num.nil?
				break
			elsif num > next_num
				#will move larger number to index+1 location and then delete the original number
				numbers.insert(index+1, numbers.delete_at(index))
			else
				#if both numbers are equal, it will pass
				next
			end
			#puts numbers.inspect
		end
		sort -= 1
	end
	puts numbers.inspect
end

bubbleSort(numbers)

def bubbleSort_by(numbers)
	#counter for while loop
	sort = numbers.length
	while sort > 0
		#takes index and num and retruns accoringly the proper action
		numbers.each_with_index do |num, index|
			next_num = numbers[index+1]
			if next_num.nil?
				break
			elsif yield(next_num, num) > 0
				#will move larger number to index+1 location and then delete the original number
				numbers.insert(next_num, numbers.delete_at(index))
			else
				#if both numbers are equal, it will pass
				next
			end
			#puts numbers.inspect
		end
		sort -= 1
	end
	puts numbers.inspect
end

bubbleSort_by(numbers) {|left,right| right - left} 
