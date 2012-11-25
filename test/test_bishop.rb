require "test/unit"

require "app/board"

class TestBishop < Test::Unit::TestCase
  def setup
    @board = Chess::Board.new
  end

  def test_moves
    # Bishop shouldn't be able to move from starting position
    assert_equal([], @board.squares["f1"].moves(@board, "f1"))
    @board.move("g2", "g3")
    @board.move("e2", "e3")
    # After pawns have moved, bishop should be able to move along two diagonals
    assert_equal(["e2", "d3", "c4", "b5", "a6", "g2", "h3"], @board.squares["f1"].moves(@board, "f1"))
  end

  def test_captures
    @board.move("e2", "e3")
    @board.move("d7", "d6")
    @board.move("f1", "b5")
    assert_equal(["e8"], @board.squares["b5"].captures(@board, "b5"))
  end

end
