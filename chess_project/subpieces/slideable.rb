module Slideable

    public

    def vert_hors_dirs
        VERT_HOR_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves= []

        move_dirs.each do |dx, dy|
            moves.concat(grow_unblocked_moves_in_dir(dx, dy) )
        end

        moves
    end

    private

    def move_dirs
        #should be overwritten by each class
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        returned_moves=[]
        x, y = self.pos
        potential_move= [x+dx, y+dy]
        while self.board.valid?(potential_move) && self.board[potential_move].empty? #handles cases before out of bounds or blocked
            returned_moves << potential_move
            potential_move= [potential_move[0]+dx, potential_move[1]+dy]
        end

        if self.board[potential_move].empty? == false && self.board.valid?(potential_move) #only handles cases where path was blocked by piece

            if self.board[potential_move].color != self.color #different color piece, can capture, add to potential move
                returned_moves << potential_move
            end
        end

        return returned_moves
    end

    DIAGONAL_DIRS= [[1,1],[-1,-1],[1,-1],[-1,1]]
    VERT_HOR_DIRS= [[1,0],[-1,0],[0,1],[0,-1]]

end
