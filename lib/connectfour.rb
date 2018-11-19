class Game
	attr_accessor :board
	def initialize()
		# @board = [[nil,nil,nil,nil,nil,nil,nil],
		# 					[nil,nil,nil,nil,nil,nil,nil],
		# 					[nil,nil,nil,nil,nil,nil,nil],
		# 					[nil,nil,nil,nil,nil,nil,nil],
		# 					[nil,nil,nil,nil,nil,nil,nil],
		# 					[nil,nil,nil,nil,nil,nil,nil]]
		@board = [[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,"X",nil,nil],
							[nil,nil,nil,"X",nil,nil,nil],
							[nil,nil,"X",nil,nil,nil,nil],
							[nil,"X",nil,nil,nil,nil,nil]]
							
	end

	def display_board
		board = @board.dup 
		board.each do |row|
			string = ""
			row.each do |space| 
				space == nil ? x = "-" : x = space
				string += "#{x} "
			end
			puts string
		end
	end

	def random_start
		player = ["X", "O"]
		player(rand(2))
	end

	def win
		current = [0,5]
		win_recursion(current,false)
	end

	def win_direction(search, x,y,row,column, count)
		column += x 
		row += y
		if count == 4
			return true
		elsif @board[row][column] == search && row >= 0 && column < 7 && column >= 0
			count += 1
			win_direction(search, x,y, row,column, count)
		else 
			return false
		end
	end


	def win_recursion(current, winner)
		puts "#{current} #{@board[current[1]][current[0]]}"
		column = current[0]
		row = current[1]
		x = 0
		y = 0
		count = 0
		#sets what to search for ie: x or o
		if @board[row][column] == "X"
			search = "X"
			count = 1
		elsif @board[row][column] == "Y"
			search = "Y"
			count = 1
		else 
			search = "nothing"
		end
		#decides which direction to check
		if (column + 1) > 0 && (column + 1) < 7 && @board[row][column + 1] == search 
			count += 1
			x = 1
			winner = win_direction(search,x,y,row,column,count)
		end
		if row - 1 >= 0 && @board[row - 1][column] == search
			count += 1
			x = 0
			y = -1
			winner = win_direction(search,x,y,row,column,count)
		end
		if @board[row - 1][column + 1] == search
			count += 1
			x = 1
			y = -1
			winner = true if win_direction(search,x,y,row,column,count)
		end
		if @board[row - 1][column + 1] == search
			x = -1
			y = -1
			count += 1
			winner = true if win_direction(search,x,y,row,column,count)
		end

		#checks for win or continues to next space
		# puts "#{current} #{search} #{@board[row][column]}"
		if winner != true
			if current[0] == 6 && current[1] == 0
				return false
			elsif current[0] < 6
				current[0] += 1
				win_recursion(current,winner)
			elsif current[0] == 6
				current[1] -= 1
				current[0] = 0
				win_recursion(current,winner)
			end
		elsif winner == true
			puts "Winner!"
			return winner
		else
			
		end

	end

		

	def start
		player = random_start
		while win == false
			display_board
			turn(player)
			player == "X" ? player = "O" : player = "X"
		end
		display_board
		puts "#{win} WON!!!!!"
	end


end

game = Game.new

# game.board[-1] = ["X","O","X","X","O","X","X"]
# game.board[0] = ["X","X","X","X","X","X","X"]
game.display_board
puts game.win 
game.display_board