#ttt_oop.rb
 require 'pry'

class Square 
attr_reader :len, :char, :spaces, :top_bottom, :center
attr_accessor :sq, :occupied

  def initialize(len,char)
    @len = len
    @char = char
    @sq_model = self.build_square
  end

  def get_center
    @center = (len / 2)
    center
  end
  
  def build_square
    @sq = Array.new(len)
    @spaces = (" " * (len - 2))
    @top_bottom = (char * len)
    @occupied = 0
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
  attr_reader :squares_per_row, :number_of_rows, :len
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
    row = 1
    #num_squares_per_row = 4
    #number_of_rows = 
    #binding.pry
    break_point_max = self.len * squares_per_row
    break_point = 0
    while loop_counter < self.number_of_rows
    square_index = 0
    while square_index < my_board[0].sq.size
      while row <= self.number_of_rows
      if row == 1
        range_start = 0
        range_stop = ((squares_per_row * row) - 1)
        break
      else
        range_start = ((row * squares_per_row) - squares_per_row)
        range_stop = (range_start + (squares_per_row - 1)) 
        break
      #elsif row == 2
      #  range_start = 3
      #  range_stop = 5
      #  break
      #else
      #  range_start = 6
      #  range_stop = 8
      #  break
      end
    end
      my_board.each_slice(squares_per_row)  do |index|
      #my_board[range_start..range_stop].each_index do |index|
      print my_board[range_start].sq[square_index]
      #range_start += 1
      if range_start == range_stop
        puts "\n"
        square_index += 1
        break
        else
        range_start += 1

      #if index == (squares_per_row - 1)
      #  puts "\n"
      #  square_index += 1
      #  break
      end
      end
    end
#binding.pry
loop_counter += 1
row += 1
  end
    
  end

end

class Tic_Tac_Toe_Board < Board 
  attr_accessor :ttt_square, :ttt_board

  def initialize
    #@ttt_square = Square.new(6,"*")
    @ttt_board = Board.new(3,3, 6, ".")  
    ttt_board.build_board
  end

  def ttt_draw_board
    ttt_board.draw_board
  end

  def ttt_mark_square(square_to_mark,player)
    #while ttt_board.my_board[square_to_mark].occupied == 1
    #  puts "Square taken, choose again"


    if player.player_name == "Opponent"
      ttt_board.my_board[square_to_mark].sq[(ttt_board.len / 2)] = ".  O ."
      ttt_board.my_board[square_to_mark].occupied = 1
    else
    ttt_board.my_board[square_to_mark].sq[(ttt_board.len / 2)] = ".  X ."
    ttt_board.my_board[square_to_mark].occupied = 1
  end
  end

end

#my_square = Square.new(6,"*")
#my_square.build_square
#puts my_square.display_square
#my_board = [Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.')]
#puts square.display_square
module Turn
  def choose_square

    puts "Select a square from 1 to 9"
    player_choice = (gets.chomp.to_i) - 1
    
  end

  def opponent_choose_square
    opp_options = *(1..9)
    choice = opp_options.sample
    puts "Opponent selecting square..."
    sleep 0.5
    player_choice = choice - 1
  end

end



#my_square = Square.new(6,"*")
#my_square.build_square
#puts my_square.display_square
#my_board = [Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.'),Square.new(6, '.')]
#puts square.display_square

class Game

  include Turn
  attr_accessor :player_one, :player_two, :game_board

  def start_game
    
    @game_board = Tic_Tac_Toe_Board.new
    game_board.ttt_draw_board
    @player_one = Player.new("Bob","X")
    @player_two = Player.new("Opponent", "O")
    binding.pry
    #game_board.ttt_mark_square(2)
    #game_board.ttt_draw_board
    while !game_over
    player_choice = player_one.choose_square
    game_board.ttt_mark_square(player_choice,player_one)
    game_board.ttt_draw_board
    player_choice = player_two.opponent_choose_square
    game_board.ttt_mark_square(player_choice,player_two)
    game_board.ttt_draw_board
  end

    #binding.pry
  end

  def winner
    
  end

  def game_over
    
  end

end

class Player < Game
  include Turn
  attr_reader :player_name, :player_marker

  def initialize(p_name,p_mark = nil)
    @player_name = p_name
    @player_marker = p_mark
    
  end
end


my_game = Game.new
my_game.start_game
