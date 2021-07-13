
require_relative "card"

class Board

    def initialize(n)
        @size= n*n
        @grid= Array.new(n) {Array.new(n, "_") }
        @cards= get_shuffled_cards(@size)

    end

    def get_cards(n)
        cards=[]
        n.times.each do
            new_card= Card.new
            while cards.include?(new_card.value) == false
                cards << new_card
                cards << new_card.dup
                new_card = Card.new
            end
        end
        cards
    end

    def get_shuffled_cards(n)
        get_cards(n).shuffle
    end

    def populate_board
        cards= get_shuffled_cards(@size)
        @grid.each do |row|
            row.each do |el|
                el = cards.pop
            end
        end
    end





    def won?
    end

    def [](pos)
        row= pos[0]
        col =pos[1]
        return [row, col]
    end

end
