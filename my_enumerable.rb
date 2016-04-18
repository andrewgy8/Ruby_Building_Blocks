module MyEnumerable
	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self unless block_given?
		index = 0
		for i in self
			yield(i)
			yield(index)
			index += 1
		end

	end

end