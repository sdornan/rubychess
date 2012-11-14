# coding: utf-8

module Chess
  class Knight < Piece

    def moves(board, position)
      file = position[0]
      rank = position[1].to_i

      moves = []

      [rank-1, rank+1].each do |r|
        [(file.ord-2).chr, (file.ord+2).chr].each do |f|
          current = "#{f}#{r}"
          if board.squares[current].nil? or board.squares[current].color != @color
            moves << current
          end
        end
      end

      [rank-2, rank+2].each do |r|
        [(file.ord-1).chr, (file.ord+1).chr].each do |f|
          current = "#{f}#{r}"
          if board.squares[current].nil? or board.squares[current].color != @color
            moves << current
          end
        end
      end

      moves.select {|square| square =~ /^[a-h][1-8]$/}
    end

    def to_s
      if @color == :white
        "♘"
      elsif @color == :black
        "♞"
      end
    end

  end
end
