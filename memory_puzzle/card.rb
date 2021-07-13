class Card

    VALUES= (:A..:Z).to_a

    attr_reader :value, :face

    def initialize(value= false)
        @value= value
        @value||= VALUES.sample
        @face= :down
    end

    def reveal
        @face = :up
    end

    def hide
        @face= :down
    end

    def face_up?
        @face == :up
    end

    def ==(other_card)
        self.value == other_card.value
    end

end #end class
