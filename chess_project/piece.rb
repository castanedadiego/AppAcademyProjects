class Piece

    def initialize(color, board, pos)
        @color= color
        @board= board
        @pos= pos
    end

    attr_reader :color, :board, :pos

    def empty?
        self == self.null_piece
    end


    private

    def move_into_check?(end_pos)
    end








end
