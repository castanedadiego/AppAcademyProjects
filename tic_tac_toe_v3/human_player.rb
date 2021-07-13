class HumanPlayer

    attr_reader :mark_value

    def initialize(mark)
        @mark_value= mark
    end

    def get_position(legal_positions)
        puts "Player #{@mark_value}: enter position as 2 numbers w space in between (row col)"
        input= gets.chomp.split(" ").map {|char| char.to_i}
        p input

        while !legal_positions.include?(input)
            puts "Invalid input"
            puts "Player #{@mark_value}: enter position as 2 numbers w space in between (row col)"
            input= gets.chomp.split(" ").map {|char| char.to_i}
            p input
        end
        return input
    end
end
