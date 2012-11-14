require "test/unit"

require "app/board"

class TestQueen < Test::Unit::TestCase
  def setup
    @board = Chess::Board.new
  end

  def test_moves
    # Queen shouldn't be able to move from starting position
    assert_equal([], @board.squares["d1"].moves(@board, "d1"))
    @board.move("e2", "e4")
    # Queen should be able to move along the d1 to e5 diagonal
    assert_equal(["e2", "f3", "g4", "h5"], @board.squares["d1"].moves(@board, "d1"))
  end
end
