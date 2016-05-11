list = [8,3,2,45,6,43,1,90]

def merge_sort(list)
	
	left = []
	right = []
	result = []

	return list if list.length == 1
	
	half_length = list.length / 2
	
	0.upto(half_length-1) {|i| left << list[i] }
	half_length.upto(list.length - 1) { |i| right << list[i] }

	left = merge_sort(left)
	right = merge_sort(right)
	
	result = merge(left, right)
	result
end

def merge(left, right)
	result = []
	
	until left.empty? or right.empty?
	
		if left.first <= right.first
			result << left.first
			left = left[1..-1]
		else 
			result << right.first
			right = right[1..-1]
		end
	end

	return result + left + right
	
end



puts merge_sort(list)

