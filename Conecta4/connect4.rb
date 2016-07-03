require 'pp'
####### Class for making the connect4 grid
class Grid
	attr_accessor :grid
	def initialize
		@grid = Array.new(6) {Array.new(7,0)}
	end
	#Starts from the bottom left to search if someone has won
	def hasWon(player)
		for i in (5).downto(0)
			for j in 0..6
				if checkCross(player, i,j) or checkDiagonal(player,i,j)
					 return true
				end
			end
		end
		return false
	end
	# checks if there are 4 on a column or a row. 
	def checkCross(player,x,y)
		#It doesn't check the upper three because it would get out of the matrix
		if x >= 3 && @grid[x][y] == player && @grid[x-1][y] == player && @grid[x-2][y] == player && @grid[x-3][y] == player 
				#puts "won on vertical"
				return true
			end
		#same here, it automatically discards the most left values because the previous searches had already searched.
		#Also, it gets out of the matrix if this is not done.
		if y <= 4 && @grid[x][y] == player && @grid[x][y+1] == player && @grid[x][y+2] == player && @grid[x][y+3] == player 
				#puts "won on horizontal"
				return true
			end
		return false
	end
	# checks in diagonal 4 values
	def checkDiagonal(player,x,y)
		#same of CheckCross, it only checks for valid diagonals
		if x >= 3 && y < 4
			if @grid[x][y] == player && @grid[x-1][y+1] == player && @grid[x-2][y+2] == player && @grid[x-3][y+3] == player
				 return true
			else
				return false
			end

		elsif x >= 3 && y >=4
			if @grid[x][y] == player && @grid[x-1][y-1] == player && @grid[x-2][y-2] == player && @grid[x-3][y-3] == player
				 return true
			else
				 return false
			end
		else 
			return false
		end

	end

	# puts the token to the lowest point that doesnt has a 0, if the column reached the top, then it becomes unavailable to throw
	#Returns a boolean that tells if it was a valid move or not. It doesn't check for out of bounds throws.
	def throw(player,j)
		i =5
		until @grid[i][j] == 0 || i ==0 do
			i-= 1
		end
		if @grid[0][j] ==0
		@grid[i][j] =player
		return true
		end
		return false
	end
	# checks the top row and if its full, then the whole grid is full
	def isfull
		for i in 0..5 
			if @grid[0][i] == 0
			return	false
			end
		end
		true
	end

end
#console implementation, with X and O's for values.

#pp = pretty print for the matrix. :D


g = Grid.new
win =false
player ='O'
puts "Para tirar, solo inserta la columna en la que quieras tirar [0-6]" 
until win do
	pp g.grid
	puts "\n es tu turno #{player} \n"
	pos = gets.chomp.to_i
	turn =	g.throw(player,pos)
	if g.hasWon(player)
		puts "#{player} has won!"
		win = true
	end
	if g.isfull
		puts "DRAW"
		win = true
	end
	if turn 
		if player =='O'
			player ='X'
		else
			player ='O'
		end
	end
end
pp g.grid


#
#Shoes.app :title => "Connect 4", :width => 850,  :height => 700 do

#nd