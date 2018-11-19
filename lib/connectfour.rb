class Game
	attr_accessor :board
	def initialize()
		@player_win = nil
		@board = [[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil]]
		# @board = [[nil,nil,nil,nil,nil,nil,nil],
		# 					[nil,nil,nil,nil,nil,nil,nil],
		# 					[nil,nil,nil,nil,"X",nil,nil],
		# 					[nil,nil,nil,"X",nil,nil,nil],
		# 					[nil,nil,"X",nil,nil,nil,nil],
		# 					[nil,"X",nil,nil,nil,nil,nil]]
							
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
		player[rand(2)]
	end

	def win
		current = [0,5]
		if win_recursion(current,false)
			puts "#{@player_win} is the winner!" 
			return true
		else 
			false
		end

	end

	def win_recursion(current, winner)
		column = current[0]
		row = current[1]
		x = 0
		y = 0
		count = 0
		#sets what to search for ie: x or o
		if @board[row][column] == "X"
			search = "X"
		elsif @board[row][column] == "Y"
			search = "Y"
		else 
			search = "nothing"
		end
		#decides which direction to check
		if (column + 1) > 0 && (column + 1) < 7 && @board[row][column + 1] == search 
			count += 1
			x = 1
			winner = win_direction(search,x,y,row,column,count)
		end
		if row - 1 >= 0 && @board[row - 1][column] == search && winner == false
			count += 1
			x = 0
			y = -1
			winner = win_direction(search,x,y,row,column,count)
		end
		if @board[row - 1][column + 1] == search && winner == false
			count += 1
			x = 1
			y = -1
			winner = win_direction(search,x,y,row,column,count)
		end
		if @board[row - 1][column - 1] == search && winner == false
			x = -1
			y = -1
			count += 1
			winner =  win_direction(search,x,y,row,column,count)
		end

		#checks for win or continues to next space
		# puts "#{current} #{search} #{@board[row][column]}"
		if winner == false
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
			@player_win = search
			return winner
		else
			
		end

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

	def turn(player)
		puts "#{player}'s turn"
		puts "enter which column you'd like to drop a piece 0 - 6: "
		player_column = gets.chomp.to_i
		until player_placement(player_column, player) && player_column >= 0 && player_column < 7
			puts "enter a valid column"
			player_column = gets.chomp.to_i
		end
	end

	def player_placement(player_column, player)
		row = 5
		column = player_column
		puts "#{player_column} #{player}"
		while row >= 0
			if @board[row][column] == nil
				@board[row][column] = player.to_s
				return true
			else
				row -= 1
			end
		end
		return false
	end

	def full
		@board.all? do |row|
			row.all? do |el|
				el != nil
			end
		end

	end

		

	def start
		player = random_start
		until win || full
			display_board
			turn(player)
			player == "X" ? player = "O" : player = "X"
		end
		display_board
	end


end

game = Game.new
game.start