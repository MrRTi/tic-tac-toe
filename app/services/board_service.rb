class BoardService
  def initialize(moves)
    @moves = moves
    @max_rows = Game::MAX_ROWS
    @max_columns = Game::MAX_COLUMNS
  end

  def call
    board = Array.new(max_rows * max_columns, nil)
    moves.each do |move|
      index = (move.row * max_columns) + move.column
      board[index] = move.symbol
    end

    board
  end

  private

  attr_reader :moves, :max_rows, :max_columns
end
