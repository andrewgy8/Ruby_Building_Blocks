def stock_picker(stocks)
	
	high = []
	low = []
	#puts first number in stock set to the high array
	high.push(stocks[0])
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
	puts high_low.inspect
	difference = high_low[0] - high_low[1]
	puts "The total money you could possibly make is " + difference.to_s
end

stock_picker([18,3,6,9,15,8,6,45,10])
