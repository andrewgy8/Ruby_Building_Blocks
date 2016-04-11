def stock_picker(stocks)
	
	high = []
	low = []
	#puts first number in stock set to the high array
	high << stocks[0]
	#iterates through stock array to test whether they are higher in value than the current high array value
	#if it is the high array is emptied, and the new value take its place
	stocks.each do |stock|
		if stock > high[0]
			high.pop
			high << stock
		end
	end
	#same concept as the high array but low number instead
	low.push(stocks[0])
	stocks.each do |stock|
		if stock < low[0]
			low.pop
			low.push(stock)
		end
	end
			
	#finding the defference in the high and low array
	high_low = high + low
	
	#determines if the user has the ability of buying the low stock before the high one 
	if stocks.index(high_low.max) < stocks.index(high_low.min)
		stocks.delete(high_low[0])
		stock_picker(stocks)
		return high_low
	end

	puts high_low.inspect
	difference = high_low.max - high_low.min
	puts "The total money you could possibly make is " + difference.to_s	
	
end

stock_picker([7,2,6,9,15,8,6,49,10])
