class HumanPlayer

    attr_reader :mark_value

    def initialize(mark)
        @mark_value= mark
    end

    def get_position
        puts "Player #{@mark_value}: enter position as 2 numbers w space in between (row col)"
        input= gets.chomp
        p input

        if !input.include?(" ") || input.split(" ").length != 2 || !input.split(" ").all? {|char| char.to_i.is_a? Integer }
            raise "Invalid input"
        end
        return input.split(" ").map{|char| char.to_i}
    end




end
