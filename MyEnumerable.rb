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
			yield(i, index)
			index += 1
		end
	end
	
	def my_select
		return self unless block_given?
		output = []
		self.my_each  {|i| yield(i) ? output << self[yield(i)] : next}
		#Only passes the ture/false nature of the number.  How to get the actual number?
		puts output
	end

	def my_all?
		return true unless block_given?
		output = false
		self.my_each {|x| output = true ? yield(x) : output = false}
		puts output.inspect
	end

	def my_none?
		return false unless block_given?
		output = true
		self.my_each { |x| yield(x) ? output = false : output = true}
		puts output.inspect
	end

	def my_count
		return self unless block_given?
		index = 0
		self.my_each {|x| yield(x) ? index += 1 : next}
		puts index
	end

	def my_map
		return self unless block_given?
		output = []
		self.my_each {|i| yield(i) ? output << yield(i) : next}
		puts output
	end

	def my_inject(num = 0)
		return self unless block_given?
		output = num
		self.my_each { |i| output = yield(output, i) }
		puts output
	end

end