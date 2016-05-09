def append(arr, n)
	while n >= 0
		arr.push(n)
		n -= 1
	end
	puts arr.inspect
end

append([], 3)