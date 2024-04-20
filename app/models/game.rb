class Game < ApplicationRecord
  include AASM

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
end
