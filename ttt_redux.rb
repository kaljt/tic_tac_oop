#ttt_oop.rb
 require 'pry'

class Square 
  attr_reader :len, :char, :spaces, :top_bottom, :center
  attr_accessor :sq, :occupied, :value

  def initialize(len,char,value)
    @value = value
    @len = len
    @char = char
    #binding.pry
    @sq_model = build_square

  end

  def get_center
    @center = (len / 2)
    center
  end

  def mark(marker)
    @value = marker
    sq[get_center] = char + "  " + marker+ " " + char
  end
  
  def is_occupied?
    @value != " "
    #sq[get_center]
  end

  def is_empty?
    @value == " "
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
 end
end

class Board 
  attr_reader :squares_per_row, :number_of_rows, :len
  attr_accessor :my_board, :data

  def initialize(sq_per_row, num_of_rows, length, chr)
    @data = {}
    @squares_per_row = sq_per_row
    @number_of_rows = num_of_rows
    @len = length
    @char = chr
    #binding.pry
    (1..(squares_per_row * number_of_rows)).each {|position| @data[position] = Square.new(@len,@char," ")}
    #binding.pry
    #@square_model= sq_model
  end

  def draw

    puts "Drawing....board..."
    #puts @data.inspect

        loop_counter = 0
    row = 1
    #num_squares_per_row = 4
    #number_of_rows = 
    #binding.pry
    while loop_counter < self.number_of_rows
    square_index = 0
    while square_index < @data[1].sq.size
      while row <= self.number_of_rows
      if row == 1
        range_start = 1
        range_stop = ((squares_per_row * row))
        break
      else
        range_start = ((row * squares_per_row) - squares_per_row + 1)
        range_stop = (range_start + (squares_per_row - 1)) 
        break
      end
    end
      @data.each_slice(squares_per_row)  do |index|
      print @data[range_start].sq[square_index]
      if range_start == range_stop
        puts "\n"
        square_index += 1
        break
        else
        range_start += 1

      end
      end
    end
  loop_counter += 1
  row += 1
  end

  end

  def all_squares_marked?
    empty_squares.size == 0
  end

  def empty_squares
    #returns array
    @data.select {|_, square| square.value == " "}.values
  end

  def empty_positions
    #binding.pry
    @data.select {|_, square| square.is_empty? }.keys
  end

  
  def draw_board

    loop_counter = 0
    row = 1
    while loop_counter < self.number_of_rows
    square_index = 0
    while square_index < ttt_board.data[1].sq.size
      while row <= self.number_of_rows
      if row == 1
        range_start = 0
        range_stop = ((squares_per_row * row) - 1)
        break
      else
        range_start = ((row * squares_per_row) - squares_per_row)
        range_stop = (range_start + (squares_per_row - 1)) 
        break
      end
    end
      ttt_board.each_slice(squares_per_row)  do |index|
      print ttt_board.data[range_start].sq[square_index]
      if range_start == range_stop
        puts "\n"
        square_index += 1
        break
        else
        range_start += 1

      end
      end
    end
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
    #ttt_board.build_board
  end

  def ttt_draw_board
    ttt_board.draw
  end

end

class Game

  
  attr_accessor :player_one, :player_two, :game_board
  attr_reader :marker
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @board = Tic_Tac_Toe_Board.new
    @player_one = Player.new("JoJo","X")
    @player_two = Player.new("Cylon","O")
    @current_player = @player_one
  end

  def current_player_marks_square
    if @current_player == @player_one
      begin
        puts "Choose a position (1-9):"
        position = gets.chomp.to_i
      end until @board.ttt_board.empty_positions.include?(position)
      else
        position = @board.ttt_board.empty_positions.sample
      end
      #binding.pry
      @board.ttt_board.data[position].mark(@current_player.player_marker)
  end

  def alternate_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def tie_game
    @board.ttt_board.all_squares_marked?  && !player_wins
  end

  def player_wins
    sq_center = @board.ttt_board.data[1].get_center
    WINNING_LINES.each do |element|
      element.each_slice(3) do |value|
         if @board.ttt_board.data[value[0]].sq[sq_center].include?(@current_player.player_marker) && 
            @board.ttt_board.data[value[1]].sq[sq_center].include?(@current_player.player_marker) &&
            @board.ttt_board.data[value[2]].sq[sq_center].include?(@current_player.player_marker)
            return true
          end
        end
      end
      false
  end

  def game_over
    if tie_game
      puts "It's a tie!"
      return true
    elsif player_wins
      puts "#{@current_player.player_name} won the game"
      return true
    else
      false
    end

  end

  def play
    @board.ttt_board.draw
     loop do 
      current_player_marks_square
      @board.ttt_board.draw
      if game_over
        break
      end
      alternate_player
      @board.ttt_board.draw
      if game_over
        break
      end
    end
   
  
  end

end

class Player
  
  attr_reader :player_name, :player_marker

  def initialize(p_name,p_mark)
    @player_name = p_name
    @player_marker = p_mark
  end
end

player_choice = "Y"
while player_choice == "Y"
Game.new.play
puts "Care to play again?"
player_choice = gets.chomp.upcase
end


