class BoardCheckService
  def initialize(board, max_rows:, max_columns:)
    @board = board
    board_params = { max_rows:, max_columns: }
    @win_combinations = WinCombinationsService.new(**board_params).call
  end

  def win?(current_symbol)
    win_combination(current_symbol).present?
  end

  def win_combination(current_symbol)
    return if board.blank?

    win_combinations.detect do |indexes|
      indexes.all? { |index| board[index] == current_symbol }
    end
  end

  private

  attr_reader :board, :win_combinations
end
