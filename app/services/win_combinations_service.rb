class WinCombinationsService
  def initialize(max_rows: Game::MAX_ROWS, max_columns: Game::MAX_COLUMNS)
    @max_rows = max_rows
    @max_columns = max_columns
  end

  def call
    rows_combinations = (0...max_rows * max_columns).each_slice(max_columns).to_a
    columns_combinations = rows_combinations.transpose

    combinations = rows_combinations + columns_combinations
    combinations << diagonal(rows_combinations)
    combinations << diagonal(rows_combinations.reverse)

    combinations
  end

  private

  attr_reader :max_rows, :max_columns

  def diagonal(array)
    (0...max_rows).map { |i| array[i][i] }.sort
  end
end
