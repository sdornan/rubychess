require "test/unit"

require "app/board"

class TestKing < Test::Unit::TestCase
  def setup
    @board = Chess::Board.new
  end

  def test_moves
    # King shouldn't be able to move from starting position
    assert_equal([], @board.squares["e1"].moves(@board, "e1"))
    @board.move("e2", "e3")
    @board.move("f1", "c4")
    # After moving pawn and bishop, king should be able to move two spaces
    assert_equal(["f1", "e2"], @board.squares["e1"].moves(@board, "e1"))
  end
end
