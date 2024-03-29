class WinChecker
    def has_won?(symbol, board)
        return true if horizontal_line?(symbol, board) || vertical_line?(symbol, board) || diagonal_line?(symbol, board)
        return false
    end

    private
    def horizontal_line?(symbol, board)
        board.any? {|row| row_has_winning_line(row, symbol)}
    end

    def row_has_winning_line(row, symbol)
        row.all? {|square| square == symbol}
    end

    def vertical_line?(symbol, board)
        horizontal_line?(symbol, board.transpose)
    end

    def diagonal_line?(symbol, board)
        middle_piece = board[1][1]
        return false if middle_piece != symbol
        top_left_and_bottom_right = (board[0][0] == symbol) && (board[2][2] == symbol)
        top_right_and_bottom_left = (board[0][2] == symbol) && (board[2][0] == symbol)
        top_left_and_bottom_right || top_right_and_bottom_left
    end
end
