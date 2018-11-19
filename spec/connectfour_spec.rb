require './lib/connectfour'

RSpec.describe Game do 
	describe "#win_recursion" do 
		it "return true if bottom line win" do 
			game = Game.new
			game.board[2] = ["X","X","X","X","X","X","X"]
			expect(game.win_recursion([0,5],false)).to eql(true)
		end
			it "return true if diagonal win" do 
			game = Game.new
			game.board =[[nil,nil,nil,nil,nil,nil,nil],
									[nil,nil,nil,nil,nil,nil,nil],
									[nil,nil,nil,nil,"X",nil,nil],
									[nil,nil,nil,"X",nil,nil,nil],
									[nil,nil,"X",nil,nil,nil,nil],
									[nil,"X",nil,nil,nil,nil,nil]]
			expect(game.win_recursion([0,5],false)).to eql(true)
		end

			it "return true if diagonal win" do 
			game = Game.new
			game.board =[[nil,nil,nil,nil,nil,nil,nil],
									[nil,"X",nil,nil,nil,nil,nil],
									[nil,nil,"X",nil,nil,nil,nil],
									[nil,nil,nil,"X",nil,nil,nil],
									[nil,nil,nil,nil,"X",nil,nil],
									[nil,nil,nil,nil,nil,nil,nil]]
			expect(game.win_recursion([0,5],false)).to eql(true)
		end
	end

	describe "#full" do 
		it "return true if board is full" do 
			game = Game.new
			game.board = [["X","X","X","X","X","X","X"],
										["X","X","X","X","X","X","X"],
										["X","X","X","X","X","X","X"],
										["X","X","X","X","X","X","X"],
										["X","X","X","X","X","X","X"],
										["X","X","X","X","X","X","X"]]
			expect(game.full).to eql(true)
		end
	end

	# describe "#player_placement" do
	# 	it "accept user input and update board"
	# 	game = Game.new
	# 	expect(game.player_placement(3)).to eql()
	# end

end