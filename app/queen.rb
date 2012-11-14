# coding: utf-8

module Chess
  class Queen < Piece

    def moves(board, position)
      (board.file_moves(position) + board.rank_moves(position) + board.diagonal_moves(position)).uniq
    end

    def to_s
      if @color == :white
        "♕"
      elsif @color == :black
        "♛"
      end
    end

  end
end
