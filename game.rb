class Game
    def initialize(win_checker, player_1, player_2)
        @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
        @turn = 0
        @win_checker = win_checker
        @players = {player_1.symbol => player_1, player_2.symbol => player_2}
        @pieces = [player_1.symbol, player_2.symbol]
        @scores = {player_1.symbol => 0, player_2.symbol => 0}
    end 

    def display_board
        row_strings = @board.map { |row| row_to_string(row) }
        row_strings.join("\n_ _ _\n")
    end

    def reset
        @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
        @turn = 0
        @pieces.rotate!
        puts "\n"
    end 

    def next_turn
        puts "\n"
        print "It is #{@players[current_player].name}(#{current_player})'s turn, where would you like to go e.g 1, 1(x, y)? " 
        users_move = get_move
        valid = valid_move?(users_move[:x], users_move[:y])
        while valid == false do
            print "Invalid move, try again: "
            users_move = get_move
            valid = valid_move?(users_move[:x], users_move[:y])
        end
        game_over = place_piece(users_move[:y], users_move[:x])
        next_turn if !game_over
    end

    def start_game
        puts "New game: The scores are currently #{@players[@scores.keys[0]].name}:#{@scores.values[0]} - #{@players[@scores.keys[1]].name}:#{@scores.values[1]}"
        puts display_board
        next_turn
        print "Would you like to play again y/n? "
        start_game if gets.strip.downcase == 'y'
    end

    private
    def row_to_string(row)
        row.map { |square| square || ' ' }.join('|')
    end

    def board_full?
        @turn >= 9
    end

    def get_move
        move = @players[current_player].get_move
        return move
    end

    def current_player
        @pieces[@turn % 2]
    end

    def place_piece(row, column)
        player = current_player
        @board[row][column] = player 
        puts display_board
        puts "\n"
        @turn += 1
        if @win_checker.has_won?(player, @board)
            puts "#{@players[player].name} has won the game! resetting the board."
            @scores[player] += 1
            reset
            return true
        end
        if board_full?
            puts "The board is full and a draw has been declared, resetting the board."
            reset
            return true
        end
    end

    def valid_move?(column, row)
        if row > 2 || column > 2 
            puts "Given co-ordinates are off the board"
            return false
        elsif row < 0 || column < 0
            puts "Given co-ordinates in the wrong format, ensure they are in the format 1, 1"
            return false
        elsif @board[row][column]
            puts "Already a piece there"
            return false
        end 
        return true
    end
end
