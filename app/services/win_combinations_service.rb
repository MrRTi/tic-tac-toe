class WinCombinationsService
  def initialize
    @max_rows = Game::MAX_ROWS
    @max_columns = Game::MAX_COLUMNS
  end

  def call
    Rails.cache.fetch("win_comb-#{max_rows}x#{max_columns}", expires_in: 24.hours) do
      combinations
    end
  end

  private

  attr_reader :max_rows, :max_columns

  def diagonal(array)
    (0...max_rows).map { |i| array[i][i] }.sort
  end

  def combinations
    rows_combinations = (0...max_rows * max_columns).each_slice(max_columns).to_a
    columns_combinations = rows_combinations.transpose

    combinations = rows_combinations + columns_combinations
    combinations << diagonal(rows_combinations)
    combinations << diagonal(rows_combinations.reverse)

    combinations
  end
end
