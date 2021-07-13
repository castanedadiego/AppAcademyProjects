require_relative "board"
require_relative "human_player"

class Game

    def initialize(mark_p1, mark_p2)
        @player_1 = HumanPlayer.new(mark_p1)
        @player_2 = HumanPlayer.new(mark_p2)
        @board = Board.new
        @current_player= @player_1
    end


    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        elsif @current_player == @player_2
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                @board.print
                puts "victory"
                return true
            else
                self.switch_turn
            end
        end
        puts "draw"
        return true
    end
end
