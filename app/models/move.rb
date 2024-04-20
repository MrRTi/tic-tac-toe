class Move < ApplicationRecord
  X_SYMBOL = "x".freeze
  O_SYMBOL = "o".freeze

  belongs_to :game

  validates :row, :column, :symbol, presence: true

  validates :row, :column, numericality: { only_integer: true, greater_than_or_equal: 0, less_than: 3 }
  validates :row, uniqueness: { scope: [:game_id, :column] }
  validates :column, uniqueness: { scope: [:game_id, :row] }

  validates :symbol, inclusion: { in: [X_SYMBOL, O_SYMBOL] }
end
