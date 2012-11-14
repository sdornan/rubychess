# coding: utf-8

module Chess
  class Pawn < Piece

    def initialize(color)
      super
      @moved = false
    end

    def moves(board, position)
      file = position[0]
      rank = position[1].to_i

      moves = []
      if @color == :white
        forward = file + (rank + 1).to_s
        if board.squares[forward].nil?
          moves.push(forward)
          if not @moved
            moves.push(file + (rank + 2).to_s)
          end
        end
        forward_left = (file.ord - 1).chr + (rank + 1).to_s
        if board.squares[forward_left] && board.squares[forward_left].color == :black
          moves.push(forward_left)
        end
        forward_right = (file.ord + 1).chr + (rank + 1).to_s
        if board.squares[forward_right] && board.squares[forward_right].color == :black
          moves.push(forward_right)
        end

      elsif @color == :black
        forward = file + (rank - 1).to_s
        if board.squares[forward].nil?
          moves.push(forward)
          if not @moved
            moves.push(file + (rank - 2).to_s)
          end
        end
        forward_left = (file.ord + 1).chr + (rank - 1).to_s
        if board.squares[forward_left] && board.squares[forward_left].color == :white
          moves.push(forward_left)
        end
        forward_right = (file.ord - 1).chr + (rank - 1).to_s
        if board.squares[forward_right] && board.squares[forward_right].color == :white
          moves.push(forward_right)
        end
      end

      moves.select {|square| square =~ /^[a-h][1-8]$/}
    end

    def to_s
      if @color == :white
        "♙"
      elsif @color == :black
        "♟"
      end
    end

  attr_accessor :moved

  end
end
