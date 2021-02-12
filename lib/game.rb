
class Game
    # extend Players::Human
    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end
    
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def current_player
        # binding.pry
        num_turns = self.board.turn_count
        if num_turns % 2 == 0
            @player_1
        else
            @player_2
        end
    end

    def won?
        # binding.pry
        WIN_COMBINATIONS.each do |combo|
            w_index_1 = combo[0]
            w_index_2 = combo[1]
            w_index_3 = combo[2]
            
            position_1 = @board.cells[w_index_1]
            position_2 = @board.cells[w_index_2]
            position_3 = @board.cells[w_index_3]
        
            if position_1 == position_2 &&
                position_2 == position_3 &&
                position_1 != " "
                return combo
            elsif @board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
                false
            end
        end
        return false
    end

    def full?
        # binding.pry
        array = []
            @board.cells.each do |add|
            if add != " "
                array << add
            end
        end
        if array.length < 9
            return false
        else
            return true
        end
    end
      
    def draw?
        if !won? && full?
            return true
        else
            return false
        end
    end

    def over?
        won? || draw?
    end

    def winner
        index = won?
        if index == false
            return nil
        else
            if @board.cells[index[0]] == "X"
                return "X"
            else
                return "O"
            end
        end
    end

    def turn
        # binding.pry
        puts "Please choose a number 1-9:"
        user_input = self.current_player.move(@board.cells)
        if self.board.valid_move?(user_input)
            self.board.update(user_input, self.current_player)
        else
            turn
        end
        board.display
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
    
end
