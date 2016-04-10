def stock_picker(stocks)
	high = []
	low = []
	high.push(stocks[0])

	stocks.each do |stock|
		if stock > high[0]
			high.pop
			high << stock
		end
	end
	low.push(stocks[0])
	stocks.each do |stock|
		if stock < low[0]
			low.pop
			low.push(stock)
		end
	end
	
	high_low = high + low
	puts high_low.inspect
	sum = high_low[0] - high_low[1]
	puts "The total money you could possibly make is " + sum.to_s
end

stock_picker([18,3,6,9,15,8,6,45,10])
