class BoardService
  def initialize(moves, max_rows:, max_columns:)
    @moves = moves
    @max_rows = max_rows
    @max_columns = max_columns
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
