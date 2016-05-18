require_relative '../tictactoe2'

describe Game do
	before(:each) do 
		@andrew = Player.new('X', 'Andrew')
		@eva = Player.new('O', 'Eva')
		@game = Game.new(@andrew, @eva)
	end

	describe "#initialize" do
		it 'prints the name' do
			expect(@game.initialize).to be_an_instance_of Game
		end
	end
end