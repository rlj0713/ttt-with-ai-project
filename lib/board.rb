
class Board
    attr_accessor :cells

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        @cells[input.to_i - 1]
    end
    
    def full?
        @cells.include?(" ") ? false : true
    end

    def turn_count
        9 - @cells.count(" ")
    end

    def taken?(spot)
        position(spot) != " "
    end

    def valid_move?(input)
        input = input.to_i
        taken?(input) == false && input < 10 && input > 0
    end

    def update(space, mark)
        @cells[space.to_i - 1] = mark.token
    end

end