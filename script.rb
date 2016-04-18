require_relative 'MyEnumerable'
include MyEnumerable

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