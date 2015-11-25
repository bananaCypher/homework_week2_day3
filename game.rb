class Game
   def initialize
    @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
    @pieces = [:o, :x]
    @turn = 0
   end 

   def display_board
       row_strings = @board.map do |row|
           row_to_string(row)
       end
       row_strings.join("\n_ _ _\n")
   end

   def check_board
       nil_count = 0
       #each column
       @board.each do |column|
            return false if column.select{|space| space==nil}.count > 0
       end
       puts "The board is full and a draw has been declared, the game has been reset."
       reset
   end

   def place_piece(row, column)
       if row > 2 || column > 2
           puts "Can't place a piece outside of the board"
           return
       end
       if @board[row][column]
           puts "Already a piece there"
           return
       end 
       @board[row][column] = @pieces[@turn % 2] 
       @turn += 1
       check_board
   end

   def reset
       @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
       @turn = 0
       @pieces.rotate!
   end

   def has_won?(symbol)
       return true if horizontal_line?(symbol, @board) || vertical_line?(symbol)
       return false
   end

   def horizontal_line?(symbol, board)
       board.any? {|row| row_has_winning_line(row, symbol)}
   end

   def row_has_winning_line(row, symbol)
       row.all? {|square| square == symbol}
   end

   def vertical_line?(symbol)
       horizontal_line?(symbol, @board.transpose)
   end

   private
       def row_to_string(row)
          row_symbols = row.map do |piece|
             piece || ' '
          end
          row_symbols.join('|')
       end
end
