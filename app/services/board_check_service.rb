class BoardCheckService
  def initialize(board, max_rows:, max_columns:)
    @board = board
    board_params = { max_rows:, max_columns: }
    @win_combinations = WinCombinationsService.new(**board_params).call
  end

  def win?(current_symbol)
    return false if board.blank?

    win_combinations.any? do |indexes|
      indexes.all? { |index| board[index] == current_symbol }
    end
  end

  private

  attr_reader :board, :win_combinations
end
