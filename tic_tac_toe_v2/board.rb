class Board

    def initialize(n)
        @grid= Array.new(n) {Array.new(n, "_")}
    end

    def valid?(position)
        if (0...@grid.length)=== position[0] && (0...@grid.length)=== position[1]
            return true
        else
            return false
        end
    end

    def empty?(position)
        row= position[0]
        col= position[1]
        if @grid[row][col]== "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            row= position[0]
            col= position[1]
            @grid[row][col]= mark
        else
            raise "position not valid (empty or out of bounds)"
        end
    end

    def print
        @grid.each {|row| p row}
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|pos| pos == mark}
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        (0...@grid.length).each do |j|
            bool_array= []
            i=0
            while i< @grid.length
                if @grid[i][j] == mark
                    bool_array.push(true)
                else
                    bool_array.push(false)
                end
                    i+=1
            end
            if bool_array.all? {|val| val == true}
                return true
            end
            p bool_array
        end
        return false
    end

    def win_diagonal?(mark)

        main_diagonal= []
        anti_diagonal= []

        (0...@grid.length).each do |i|
            main_diagonal.push([i,i])
            anti_diagonal.push([@grid.length-1-i, 0+i])
        end

        presumption = true

        main_diagonal.each do |pos|
            row= pos[0]
            col= pos[1]
            if @grid[row][col] != mark
                presumption= false
            end
        end

        if presumption== true
            return true
        else
            presumption= false
        end

        anti_diagonal.each do |pos|
            row= pos[0]
            col= pos[1]
            if @grid[row][col] != mark
                presumption= false
            end
        end
        return presumption
    end



    def win?(mark)
        win_col?(mark) || win_diagonal?(mark) || win_row?(mark)
    end

    def empty_positions?
        count=0
        @grid.each do |row|
            row.each do |pos|
                if pos== "_"
                    count+=1
                end
            end
        end
        count>0
    end
end
