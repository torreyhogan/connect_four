class Game
	attr_accessor :board
	def initialize()
		@board = [[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil],
							[nil,nil,nil,nil,nil,nil,nil]]
							
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
		current = [0,0]
		win_recursion(current,false)
	end

	def win_direction(search, x,y,current, count)
		current[0] += x
		current[1] += y
		if count == 4
			return true
		elsif @board[current[0]][current[1]] == search
			count += 1
			win_direction(search, x,y, current, count)
		else 
			return false
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
			count = 1
		elsif @board[row][column] == "Y"
			search = "Y"
			count = 1
		else 
			search = "nothing"
		end
		#decides which direction to check
		if @board[row][column + 1] == search
			count += 1
			y += 1
			winner = win_direction(search,x,y,current,count)
		end
		if @board[row + 1][column] == search
			count += 1
			x = 1
			y = 0
			winner = win_direction(search,x,y,current,count)
		end
		# if @board[column + 1][row + 1] == search
		# 	count += 1
		# 	x = 1
		# 	y = 1
		# 	winner = true if win_direction(search,x,y,current,count)
		# end
		# if @board[x - 1][y + 1] == search
		# 	x = -1
		# 	y = 1
		# 	count += 1
		# 	winner = true if win_direction(search,x,y,current,count)
		# end

		#checks for win or continues to next space
		puts "#{current} #{search} #{@board[row][column]}"
		if winner != true
			if current[0] >= 6 && current[1] >= 5
				return false
			elsif current[0] < 6
				current[0] += 1
				win_recursion(current,winner)
			elsif current[0] == 6
				current[1] += 1
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

game.board[-1] = ["X","X","X","X","X","X","X"]
game.display_board
puts game.win 
game.display_board