# coding: utf-8

require_relative "piece"
require_relative "pawn"
require_relative "knight"
require_relative "king"
require_relative "queen"
require_relative "rook"
require_relative "bishop"

module Chess
  class Board

    def initialize
      @squares = Hash.new
      8.downto(1) do |r|
        "a".upto("h") do |f|
          @squares["#{f}#{r}"] = nil
        end
      end

      ("a".."h").each do |f|
        @squares["#{f}2"] = Chess::Pawn.new(:white)
        @squares["#{f}7"] = Chess::Pawn.new(:black)
      end

      ["a", "h"].each do |f|
        @squares["#{f}1"] = Chess::Rook.new(:white)
        @squares["#{f}8"] = Chess::Rook.new(:black)
      end

      ["b", "g"].each do |f|
        @squares["#{f}1"] = Chess::Knight.new(:white)
        @squares["#{f}8"] = Chess::Knight.new(:black)
      end

      ["c", "f"].each do |f|
        @squares["#{f}1"] = Chess::Bishop.new(:white)
        @squares["#{f}8"] = Chess::Bishop.new(:black)
      end

      @squares["d1"] = Chess::Queen.new(:white)
      @squares["d8"] = Chess::Queen.new(:black)
      @squares["e1"] = Chess::King.new(:white)
      @squares["e8"] = Chess::King.new(:black)
    end

    def move(from, to)
      if @squares[from].nil?
        puts 'There is no piece to move in that square.'
        return false
      end

      if not @squares[from].moves(self, from).include?(to)
        puts 'That is not a valid move.'
        return false
      end

      @squares[to] = @squares[from]
      @squares[from] = nil

      if @squares[to].is_a?(Pawn)
        @squares[to].moved = true
      end

      return true
    end

    def file_moves(square)
      file = square[0]
      rank = square[1].to_i

      color = @squares[square].color

      moves = []
      1.upto(rank - 1) do |r|
        current = file + "#{r}"
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push(current)
        if @squares[current] and @squares[current].color != color
          break
        end
      end

      (rank + 1).upto(8) do |r|
        current = file + "#{r}"
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push(current)
        if @squares[current] and @squares[current].color != color
          break
        end
      end

      return moves
    end

    def rank_moves(square)
      file = square[0]
      rank = square[1]

      color = @squares[square].color

      moves = []
      ("a"..(file.ord-1).chr).to_a.reverse.each do |f|
        current = "#{f}" + rank
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push(current)
        if @squares[current] and @squares[current].color != color
          break
        end
      end

      ((file.ord+1).chr.."h").each do |f|
        current = "#{f}" + rank
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push("#{f}" + rank)
        if @squares[current] and @squares[current].color != color
          break
        end
      end

      return moves
    end

    def diagonal_moves(square)
      file = square[0]
      rank = square[1].to_i

      color = @squares[square].color

      moves = []

      (rank-1..1).zip(("a"..(file.ord-1).chr).to_a.reverse).each { |r, f|
        if not r or not f
          next
        end
        current = "#{f}#{r}"
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push(current)
        if @squares[current] and @squares[current].color != color
          break
        end
      }

      (rank-1..1).zip((file.ord+1).chr.."h").each { |r, f|
        if not r or not f
          next
        end
        current = "#{f}#{r}"
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push(current)
        if @squares[current] and @squares[current].color != color
          break
        end
      }

      (rank+1..8).zip(("a"..(file.ord-1).chr).to_a.reverse).each { |r, f|
        if not r or not f
          next
        end
        current = "#{f}#{r}"
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push(current)
        if @squares[current] and @squares[current].color != color
          break
        end
      }

      (rank+1..8).zip((file.ord+1).chr.."h").each { |r, f|
        if not r or not f
          next
        end
        current = "#{f}#{r}"
        if @squares[current] and @squares[current].color == color
          break
        end
        moves.push(current)
        if @squares[current] and @squares[current].color != color
          break
        end
      }

      moves.select {|square| square =~ /^[a-h][1-8]$/}
    end

    def to_s
      8.downto(1) do |r|
        print "#{r} "
        "a".upto("h") do |f|
          print @squares["#{f}#{r}"] || " "
        end
        puts
      end
      puts "  abcdefgh"
    end

    attr_accessor :squares

  end
end
