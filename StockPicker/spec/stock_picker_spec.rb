require_relative '../stock_picker'

describe 'StockPicker' do 
	before(:each) do
		@stock = StockPicker.new([7,2,6,9,15,8,6,49,10])
	end

	describe '#chooses_the_highest_number' do
		it 'Chooses the highest stock from the input array' do
			expect(@stock.choose_the_highest_price).to eql([49]) 
		end
	end

	describe '#choose_the_lowest_price' do
		it 'Chooses the lowest number in the given array' do
			expect(@stock.choose_the_lowest_price).to eql([2])
		end
	end

	describe '#combine_high_low' do
		before(:each) do
			@low = @stock.choose_the_lowest_price
			@high = @stock.choose_the_highest_price
		end

		it 'combines both the high and low array' do
			expect(@stock.combine_high_low(@high, @low)).to eql([49, 2])
		end

		describe '#inspect_the_high_low' do
			it 'determines if the high is valid' do
				
			end	
		end
	end

	
end