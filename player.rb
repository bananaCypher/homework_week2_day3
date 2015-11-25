class Player
    attr_reader :name, :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end 

    def get_move
        move = gets.strip.split(', ')
        x = move[0].to_i - 1
        y = move[1].to_i - 1
        return {x: x, y: y}
    end
end
