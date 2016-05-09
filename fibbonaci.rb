def fib(n)
	i = 1
	x = 1
	fib_array = []
	n.times do 
		fib_array << i
		fib_array << x
		i += x
		x += i
	end
	fib_array.slice!(n..-1)
	return fib_array.inspect
end

def fib_rec(x, i)
	fib_array = []
	while x < 1000
		fib_array << x
		y = x + i
		x = i
		i = y
		fib_rec(x , i)
	end
	return fib_array.inspect
end

puts fib(7) 
puts fib_rec(1, 1)