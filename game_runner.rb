require 'pry-byebug'
require_relative('game')
require_relative('win_checker')

# Create game
win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1)

# Place piece
game.place_piece(0,0)

# Display board
#puts game.display_board

# Reset board
puts game.reset

# Don't allow pieces out of range
game.place_piece(3,3)

# Rotate the starting piece when resetting
game.place_piece(0,0)
#puts game.display_board

# Automatically reset when the baord is full and tell us it's a draw
game.place_piece(0,0)
game.place_piece(1,0)
game.place_piece(2,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(2,1)
game.place_piece(0,2)
game.place_piece(1,2)
game.place_piece(2,2)

piece = :o
game.place_piece(0,0)
game.place_piece(1,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)
#puts game.display_board

piece = :x
game.place_piece(0,0)
game.place_piece(1,1)
game.place_piece(1,0)
game.place_piece(1,2)
game.place_piece(2,0)
#puts game.display_board

piece = :o
game.place_piece(0,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)
game.place_piece(2,2)
#puts game.display_board


binding.pry; ''
