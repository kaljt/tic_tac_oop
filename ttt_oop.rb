#ttt_oop.rb

#SQUARE_COUNT = 2
#LENGTH = 6
#SPACES = ' ' * (LENGTH - 2)
#counter_outer = 0
#counter_inner = 0
#while counter_outer < (LENGTH * SQUARE_COUNT)
#  
#  print '.'
#  counter_inner += 1
#  puts '.'
#  if counter_inner == (LENGTH * SQUARE_COUNT)
#  
#  puts "\n"
#  print "."
#  print SPACE * (LENGTH - 2)
#  end_of_line += 1
#  if end_of_line == (LENGTH * SQUARE_COUNT) || end_of_line == ((LENGTH*SQUARE_COUNT)/2))
#  puts "."
#  else
#  print "."
#  end_of_line = 0
#  end
#  print SPACE * (LENGTH - 2)
#  counter_inner = 0
#  
#  end
#  break
#
#end
 require 'pry'

class Square 
attr_reader :len, :char, :spaces, :top_bottom
attr_accessor :sq 

  def initialize(len,char)
    @len = len
    @char = char
    @sq_model = self.build_square
  end
  
  def build_square
    @sq = Array.new(len)
    @spaces = (" " * (len - 2))
    @top_bottom = (char * len)
    counter = 0
    while true
      if (counter == 0 || counter == (len-1))
      sq[counter] = top_bottom
      counter += 1
      else
      sq[counter] = (char + spaces + char)
      counter += 1
      end
      break if counter == len
    #binding.pry
   end
   def display_square
     sq 
   end
 end
end

class Board < Square 
  attr_reader :squares_per_row, :number_of_rows
  attr_accessor :square_model

  def initialize(sq_per_row, num_of_rows,sq_model)
    @squares_per_row = sq_per_row
    @number_of_rows = num_of_rows
    @square_model= sq_model
  end

  def build_board
    my_board = [(squares_per_row * number_of_rows)]
    my_board.each do |square|
    square.build_square
    end
  end

  def draw_board

    loop_counter = 0
    #num_squares_per_row = 4
    #num_rows = 4
    while loop_counter < num_rows
    square_index = 0
    while square_index < my_board[0].sq.size
      my_board.each_index do |index|
      print my_board[index].sq[square_index]
      if index == (num_squares_per_row - 1)
        puts "\n"
        square_index += 1
        break
      end
      end
    end
#puts "\n"
loop_counter += 1
  end
    
  end

end

class Tic_Tac_Toe_Board < Board 
  attr_accessor :ttt_square, :ttt_board

  def initialize
    @ttt_square = Square.new(6,"*")
    @ttt_board = Board.new(3,3,ttt_square)  
    ttt_board.build_board
  end

end

#my_square = Square.new(6,"*")
#my_square.build_square
#puts my_square.display_square
#my_board = [Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.')]
#puts square.display_square

ttt_board = Tic_Tac_Toe_Board.new
