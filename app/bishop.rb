# coding: utf-8

module Chess
  class Bishop < Piece

    def moves(board, position)
      board.diagonal_moves(position).uniq
    end

    def to_s
      if @color == :white
        "♗"
      elsif @color == :black
        "♝"
      end
    end

  end
end
