class Game
    def initialize
        @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
        @pieces = [:o, :x]
        @turn = 0
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
        if has_won?(symbol)
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

    def has_won?(symbol)
        return true if horizontal_line?(symbol, @board) || vertical_line?(symbol) || diagonal_line?(symbol)
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

    def diagonal_line?(symbol)
        middle_piece = @board[1][1]
        return false if middle_piece != symbol
        top_left_and_bottom_right = (@board[0][0] == symbol) && (@board[2][2] == symbol)
        top_right_and_bottom_left = (@board[0][2] == symbol) && (@board[2][0] == symbol)
        top_left_and_bottom_right || top_right_and_bottom_left
    end

    def board_full?
        @turn >= 9
    end
end
