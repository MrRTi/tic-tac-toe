class Game < ApplicationRecord
  include AASM

  MAX_ROWS = 3
  MAX_COLUMNS = 3

  has_many :moves, dependent: :destroy

  aasm column: :state do
    state :in_progress, initial: true
    state :finished
    state :draw

    event :finish do
      transitions from: :in_progress, to: :finished
    end

    event :draw do
      transitions from: :in_progress, to: :draw
    end
  end

  def max_rows
    MAX_ROWS
  end

  def max_columns
    MAX_COLUMNS
  end

  def board_size
    max_rows * max_columns
  end
end
