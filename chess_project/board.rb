require_relative "piece"

class Board

    def initialize
        @rows= Array.new(8) {Array.new(8, nil)}
        @null_piece = nil


        #white pieces
        self[[0,0]]= Rook.new(:white, self, [0,0] )
        self[[0,1]]= Piece.new(:white, self, [0,1] )
        self[[0,2]]= Piece.new(:white, self, [0,2] )
        self[[0,3]]= Piece.new(:white, self, [0,3] )
        self[[0,4]]= Piece.new(:white, self, [0,4] )
        self[[0,5]]= Piece.new(:white, self, [0,5] )
        self[[0,6]]= Piece.new(:white, self, [0,6] )
        self[[0,7]]= Rook.new(:white, self, [0,7] )

        #white pawns

        self[[1,0]]= Piece.new(:white, self, [1,0] )
        self[[1,1]]= Piece.new(:white, self, [1,1] )
        self[[1,2]]= Piece.new(:white, self, [1,2] )
        self[[1,3]]= Piece.new(:white, self, [1,3] )
        self[[1,4]]= Piece.new(:white, self, [1,4] )
        self[[1,5]]= Piece.new(:white, self, [1,5] )
        self[[1,6]]= Piece.new(:white, self, [1,6] )
        self[[1,7]]= Piece.new(:white, self, [1,7] )

        #black pieces
        self[[7,0]]= Piece.new(:black, self, [7,0] )
        self[[7,1]]= Piece.new(:black, self, [7,1] )
        self[[7,2]]= Piece.new(:black, self, [7,2] )
        self[[7,3]]= Piece.new(:black, self, [7,3] )
        self[[7,4]]= Piece.new(:black, self, [7,4] )
        self[[7,5]]= Piece.new(:black, self, [7,5] )
        self[[7,6]]= Piece.new(:black, self, [7,6] )
        self[[7,7]]= Piece.new(:black, self, [7,7] )

        #black pawns
        self[[6,0]]= Piece.new(:black, self, [6,0] )
        self[[6,1]]= Piece.new(:black, self, [6,1] )
        self[[6,2]]= Piece.new(:black, self, [6,2] )
        self[[6,3]]= Piece.new(:black, self, [6,3] )
        self[[6,4]]= Piece.new(:black, self, [6,4] )
        self[[6,5]]= Piece.new(:black, self, [6,5] )
        self[[6,6]]= Piece.new(:black, self, [6,6] )
        self[[6,7]]= Piece.new(:black, self, [6,7] )

    end

    public

    attr_accessor :rows

    def [](pos)
        row, col = pos
        return @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)

        if self[start_pos] == @null_piece
            raise "there is no piece there"
        end

        moving_piece= self[start_pos]
        self[start_pos]= @null_piece
        self[end_pos]= moving_piece


    end

    def valid_pos?(pos)
        x,y = pos
        return true unless x>7 || x<0 || y>7 || y<0
    end



    private

end
