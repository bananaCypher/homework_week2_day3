class Game
    def initialize(win_checker)
        @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
        @pieces = [:o, :x]
        @turn = 0
        @win_checker = win_checker
    end 

    def display_board
        row_strings = @board.map { |row| row_to_string(row) }
        row_strings.join("\n_ _ _\n")
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
        symbol = @pieces[@turn % 2]
        @board[row][column] = symbol 
        puts display_board
        puts "\n"
        @turn += 1
        if @win_checker.has_won?(symbol, @board)
            puts "#{symbol} has won the game! resetting the board."
            reset
            return
        end
        if board_full?
            puts "The board is full and a draw has been declared, resetting the board."
            reset
            return
        end
    end

    def reset
        @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
        @turn = 0
        @pieces.rotate!
        puts "\n"
        puts "New game:-"
        puts display_board
    end 

    private
    def row_to_string(row)
        row_symbols = row.map do |piece|
            piece || ' '
        end
        row_symbols.join('|')
    end

    def board_full?
        @turn >= 9
    end
end
