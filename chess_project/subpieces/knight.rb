
require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable



    def moves_diffs
        return [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-2]]
    end
