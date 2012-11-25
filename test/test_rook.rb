require "test/unit"

require "app/board"

class TestRook < Test::Unit::TestCase
  def setup
    @board = Chess::Board.new
  end

  def test_moves
    # Rook shouldn't be able to move from starting position
    assert_equal([], @board.squares["h1"].moves(@board, "h1"))
    @board.move("h2", "h4")
    # After moving pawn, rook should be able to move forward
    assert_equal(["h2", "h3"], @board.squares["h1"].moves(@board, "h1"))
    @board.move("h1", "h3")
    # After moving rook, it should be able to move along row
    assert_equal(["h1", "h2", "g3", "f3", "e3", "d3", "c3", "b3", "a3"], @board.squares["h3"].moves(@board, "h3"))
  end

  def test_captures
    @board.move("h2", "h4")
    @board.move("h1", "h3")
    @board.move("h3", "e3")
    assert_equal(["e7"], @board.squares["e3"].captures(@board, "e3"))
  end
end
