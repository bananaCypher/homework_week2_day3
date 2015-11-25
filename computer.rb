class Computer
    attr_reader :name, :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end 

    def get_move
        # Dem computer smarts
        x = Random.new.rand(0..2)
        y = Random.new.rand(0..2)
        print "#{x}, #{y}\n"
        return {x: x, y: y}
    end
end
