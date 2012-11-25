# coding: utf-8

module Chess
  class King < Piece

    def moves(board, position)
      file = position[0].ord
      rank = position[1].to_i

      moves = []
      (rank-1..rank+1).each do |r|
        ((file.ord-1).chr..(file.ord+1).chr).each do |f|
          current = "#{f}#{r}"
          if board.squares[current].nil? or board.squares[current].color != @color
            moves << current
          end
        end
      end

      moves.select {|square| square =~ /^[a-h][1-8]$/}
    end

    def in_check(board, position)
      8.downto(1) do |r|
        "a".upto("h") do |f|
          current = "#{f}#{r}"
          if board.squares[current] and board.squares[current].captures(board, current).include?(position)
            true
          end
        end
      end
      false
    end

    def to_s
      if @color == :white
        "♔"
      elsif @color == :black
        "♚"
      end
    end

  end
end
