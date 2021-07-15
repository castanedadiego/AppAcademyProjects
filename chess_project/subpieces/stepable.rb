module Stepable

    def moves
        moves =[]
        x, y = self.pos

        self.move_diffs.each do |move|
            dx, dy= move
            potential_move = [x+dx, y+dy]

            if self.board[potential_move].empty? || self.board[potential_move].color != self.color
                moves << potential_move
            end
        end

        moves
    end



    def move_diffs
        #should be overwritten by class
        raise NotImplementedError
    end

end
