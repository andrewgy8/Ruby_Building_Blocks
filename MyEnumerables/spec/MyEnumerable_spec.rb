require_relative "../MyEnumerable"
include MyEnumerable

describe "My Enumerables" do 
	before(:each) do
		@ary = [2,4,6,8,9]
	end

	describe "#my_count" do
    	it "returns a number" do
      		expect(@ary.my_count{|x| x > 0}).to eq(5)
    	end
	end
end