class ComputerPlayer

    attr_reader :mark_value
    def initialize(mark)
        @mark_value= mark
    end

    def get_position(legal_positions)
        choice= legal_positions.sample
        puts "Computer #{@mark_value} chose position #{choice}"
        return choice
    end

end
