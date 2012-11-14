require "test/unit"

require "app/board"

class TestKnight < Test::Unit::TestCase
  def setup
    @board = Chess::Board.new
  end

  def test_moves
    # Knight should be able to move to two positions from start
    assert_equal(["f3", "h3"], @board.squares["g1"].moves(@board, "g1"))
    @board.move("g1", "h3")
    # After moving knight to h3, should be able to move to three possible positions
    assert_equal(["f4", "g1", "g5"], @board.squares["h3"].moves(@board, "h3"))
  end
end
