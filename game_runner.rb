require_relative('game')
require_relative('win_checker')
require_relative('player')
require_relative('computer')

# Create game PvP
puts "Testing player vs player"
player_1 = Player.new('Callum', :o)
player_2 = Player.new('John', :x)
win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1, player_1, player_2)
game.start_game

# Create game PvP with custom Symbols
puts "Testing player vs player with custom symbols"
player_1 = Player.new('Callum', :D)
player_2 = Player.new('John', :T)
win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1, player_1, player_2)
game.start_game

# Create game PvE
puts "Testing player vs computer"
player_1 = Player.new('Callum', :o)
player_2 = Computer.new('Windoze', :x)
win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1, player_1, player_2)
game.start_game

# Create game EvE
puts "Testing computer vs computer"
player_1 = Computer.new('Mac OS', :o)
player_2 = Computer.new('Windoze', :x)
win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1, player_1, player_2)
game.start_game
