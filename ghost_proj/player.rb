class Player

    def initialize(name)
        @name = name
    end


    def guess(fragment)
        puts "The current fragment is: #{fragment}"
        puts "Add the next letter:"
        input =gets.chomp.downcase
        return input
    end

    def alert_invalid_guess(letter)
        puts "#{letter} is not a valid move"
        puts "You must be able to form a word with the new letter"
    end

end
