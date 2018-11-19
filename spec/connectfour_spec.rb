require './lib/connectfour'

RSpec.describe Game do 
	describe "#win" do 
		it "return X if x wins the game" do 
			game = Game.new
			game.board[-1] = ["X","X","X","X","X","X","X"]
			expect(game.win).to eql("X")
		end
	end

	describe "#turn" do
		it "accept user input and update board"
		game = Game.new
		expect(game.turn).to eql()
	end
end