require_relative 'MyEnumerable'

a = [3,2,6,54,8,1]

a.my_each{|x| puts x*2}
a.my_each_with_index{|x, i| puts x * i}
a.my_select {|x| puts x > 5}
puts "-" * 20
a.my_all? {|x| x > 0}
puts "-" * 20
a.my_none? {|x| x < 0}
puts "-" * 20
a.my_count {|x| x > 0}
puts "-" * 20
a.my_inject(1) {|sum, x| sum += x}
puts "-" * 20
#Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together 
#by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
def multiply_els(block)
	block.my_inject {|x,y| x * y}
end
multiply_els([2,4,5])