# coding: utf-8

module Chess
  class Piece

    def initialize(color)
      @color = color
    end

    def captures(board, position)
      captures = []
      self.moves(board, position).each do |sq|
        if board.squares[sq] and board.squares[sq].color != @color
          captures.push(sq)
        end
      end
      captures.sort
    end

    attr_reader :color

  end
end
