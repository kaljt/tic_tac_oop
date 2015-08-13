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
  attr_accessor :my_board

  def initialize(sq_per_row, num_of_rows, length, chr)
    @squares_per_row = sq_per_row
    @number_of_rows = num_of_rows
    @len = length
    @char = chr
    #@square_model= sq_model
  end

  def build_board
    #binding.pry
    @my_board = Array.new(squares_per_row * number_of_rows)
    my_board.each_index do |index|
    my_board[index] = Square.new(self.len,self.char)
    end
    my_board.each do |square|
    square.build_square
    end
    #binding.pry
  end

  def draw_board

    loop_counter = 0
    #num_squares_per_row = 4
    #number_of_rows = 
    #binding.pry
    break_point = self.len * squares_per_row
    while loop_counter < self.number_of_rows
    square_index = 0
    while square_index < my_board[0].sq.size
      my_board.each_index do |index|
      print my_board[index].sq[square_index]
      if index == (squares_per_row - 1)
        puts "\n"
        square_index += 1
        break
      end
      end
    end
binding.pry
loop_counter += 1
  end
    
  end

end

class Tic_Tac_Toe_Board < Board 
  attr_accessor :ttt_square, :ttt_board

  def initialize
    #@ttt_square = Square.new(6,"*")
    @ttt_board = Board.new(3,3, 6, "*")  
    ttt_board.build_board
    #binding.pry
  end

  def ttt_draw_board
    ttt_board.draw_board
  end

  def ttt_mark_square
    ttt_board.my_board[0].sq[2] = "   X  "
  end

end

#my_square = Square.new(6,"*")
#my_square.build_square
#puts my_square.display_square
#my_board = [Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.')]
#puts square.display_square

class Player
  attr_reader :player_name, :player_marker

  def initialize(p_name,p_mark = nil)
    @player_name = p_name
    @player_marker = p_mark
    
  end
end

#my_square = Square.new(6,"*")
#my_square.build_square
#puts my_square.display_square
#my_board = [Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.')]
#puts square.display_square

class Game
  attr_accessor :player_one, :player_two, :game_board

  def start_game
    
    @game_board = Tic_Tac_Toe_Board.new
    game_board.ttt_draw_board
    @player_one = Player.new("Bob","X")
    @player_two = Player.new("Opponent", "O")
    game_board.ttt_mark_square
    game_board.ttt_draw_board
    #binding.pry
  end

  def game_turn
    
  end

end


my_game = Game.new
my_game.start_game
