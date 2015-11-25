require_relative('win_checker')

win_checker = WinChecker.new
empty_board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
symbol = :o
puts "check that empty board does not win: #{win_checker.has_won?(symbol, empty_board)} expect to be false."

board_with_horizontal = [ [:o,:o,:o], [nil,nil,nil], [nil,nil,nil] ]
symbol = :o
puts "check that horizontal row board wins: #{win_checker.has_won?(symbol, board_with_horizontal)} expect to be true."

#New method for win checking
#Keep scoresheet
#Implement computer player
