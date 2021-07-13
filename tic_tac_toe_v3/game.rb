require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game

    def initialize(size, option_hash)
        @players =[]
        option_hash.each do |k, v|
            if v== false
                @players << HumanPlayer.new(k)
            elsif v == true
                @players<< ComputerPlayer.new(k)
            end
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
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                @board.print
                puts "victory, player #{@current_player.mark_value} wins"
                return true
            else
                self.switch_turn
            end
        end
        puts "draw"
        @board.print
        return true
    end

end
