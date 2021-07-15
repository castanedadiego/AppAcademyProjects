require_relative 'tic_tac_toe'
require 'byebug'


class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board= board
    @next_mover_mark= next_mover_mark
    @prev_move_pos ||= prev_move_pos
  end

  def switch_mark(current_mark)
    return (current_mark == :x) ? :o : :x
  end


  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    one_move_deep= []
    (0..2).each do |x|
      (0..2).each do |y|
        pos = [x,y]
        if @board.empty?([x,y])
          new_board= @board.dup
          new_board[pos] = @next_mover_mark
          one_move_deep << TicTacToeNode.new(new_board, switch_mark(@next_mover_mark) , pos)
        end
      end
    end
    one_move_deep
  end

  def losing_node?(evaluated_mark)
    #base case
    if self.board.over?
      if self.board.winner == switch_mark(evaluated_mark)
        return true
      else
        return false
      end
    end

    #recursive step
    if evaluated_mark == self.next_mover_mark
      return true if self.children.all? {|child| child.losing_node?(evaluated_mark)}
    elsif evaluated_mark == switch_mark(self.next_mover_mark)
      return true if self.children.any?{|child| child.losing_node?(evaluated_mark)}
    end

    false
  end

  def winning_node?(evaluated_mark)
    #base case
    if self.board.over?
      if self.board.winner == evaluated_mark
        return true
      else
        return false
      end
    end

    #recursive step
    if evaluated_mark == self.next_mover_mark
      return true if self.children.any? {|child| child.winning_node?(evaluated_mark)}
    elsif evaluated_mark == switch_mark(self.next_mover_mark)
      return true if self.children.all?{|child| child.winning_node?(evaluated_mark)}
    end

    false

  end





end
