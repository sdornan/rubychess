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

  def test_captures
    @board.move("f2", "f3")
    @board.move("e1", "f2")
    @board.move("f2", "g3")
    @board.move("g3", "h4")
    @board.move("h4", "h5")
    @board.move("h5", "h6")
    assert_equal(["g7", "h7"], @board.squares["h6"].captures(@board, "h6"))
  end

  def test_check
    assert(!@board.squares["e8"].in_check(@board, "e8"))
    @board.move("e2", "e3")
    @board.move("d7", "d6")
    @board.move("f1", "b5")
    assert(@board.squares["e8"].in_check(@board, "e8"))
  end
end
