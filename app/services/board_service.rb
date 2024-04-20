class BoardService
  def initialize(moves, max_rows:, max_columns:)
    @moves = moves
    @max_rows = max_rows
    @max_columns = max_columns
  end

  def call
    board = Array.new(max_rows * max_columns, nil)
    moves.each do |move|
      index = ((move.row - 1) * max_columns) + move.column - 1
      board[index] = move.symbol
    end

    board
  end

  private

  attr_reader :moves, :max_rows, :max_columns
end
