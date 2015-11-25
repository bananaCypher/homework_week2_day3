require 'pry-byebug'
require_relative('game')
# Create game
game = Game.new()

# Place piece
game.place_piece(0,0)

# Display board
puts game.display_board

# Reset board
puts game.reset

# Don't allow pieces out of range
game.place_piece(3,3)

# Rotate the starting piece when resetting
game.place_piece(0,0)
puts game.display_board

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
puts "checking if game is won #{game.has_won?(piece)}, expect to be false"
game.place_piece(0,0)
game.place_piece(1,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)
puts game.display_board
puts "checking if game is won #{game.has_won?(piece)}, expect to be true"
game.reset

piece = :x
puts "checking if game is won #{game.has_won?(piece)}, expect to be false"
game.place_piece(0,0)
game.place_piece(1,1)
game.place_piece(1,0)
game.place_piece(1,2)
game.place_piece(2,0)
puts game.display_board
puts "checking if game is won #{game.has_won?(piece)}, expect to be true"


binding.pry; ''
