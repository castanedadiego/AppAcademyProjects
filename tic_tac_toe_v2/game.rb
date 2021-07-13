require_relative "board"
require_relative "human_player"

class Game

    def initialize(size, *mark_values)
        @players =[]
        mark_values.each do |mark|
            @players << HumanPlayer.new(mark)
        end
        @board = Board.new(size)
        @current_player= @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player= @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                @board.print
                puts "victory, player #{@current_player.mark_value} wins"
                return true
            else
                self.switch_turn
            end
        end
        puts "draw"
        return true
    end

end
