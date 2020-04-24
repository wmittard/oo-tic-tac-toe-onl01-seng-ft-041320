class TicTacToe 
  WIN_COMBINATIONS = [ 
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [6,4,2]
     ]
 
 def initialize()
    @board = Array.new(9," ")
  end 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input) 
    user_input.to_i - 1 
  end 
  def move(index, current_player)
    @board[index] = current_player
  end 
 def position_taken?(index)
     @board[index] == " " ? false : true
   end

    def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
   end
    def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def turn
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       move(index,current_player)
       display_board
     else
       turn
     end
   end
   def won?
     odp = WIN_COMBINATIONS.find do |comb|
       @board[comb[0]]=="X" && @board[comb[1]]=="X" && @board[comb[2]]=="X" || @board[comb[0]]=="O" && @board[comb[1]]=="O" && @board[comb[2]]=="O"
         end
   odp ? odp : false
   end
   def full?
     @board.all?{|player| player == "X" || player == "O"}? true : false 
   end 
   def draw?
     won? ? false : full? ? true : false
   end
   def over?
   won? || draw? || full? 
 end
 def winner? 
 end 
   
end 