# coding: utf-8

require_relative "board"

board = Chess::Board.new

turn = :white

loop do
  result = false

  while not result
    puts board

    print turn.to_s + ": Make a move (from to): "
    from, to = gets.split(" ")

    result = board.move(from, to)
  end

    if turn == :white
      turn = :black
    else
      turn = :white
    end
end
