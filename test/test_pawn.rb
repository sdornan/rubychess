require "test/unit"

require "app/board"

class TestPawn < Test::Unit::TestCase
  def setup
    @board = Chess::Board.new
  end

  def test_moves
    # If a pawn hasn't moved yet, it can move forward two spaces
    assert_equal(@board.squares["a2"].moves(@board, "a2"), ["a3", "a4"])
    @board.move("a2", "a3")
    # Once it's moved, then it can only move forward one space
    assert_equal(@board.squares["a3"].moves(@board, "a3"), ["a4"])
  end
end
