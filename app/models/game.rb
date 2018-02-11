class Game < ApplicationRecord
  belongs_to :tour
  belongs_to :venue

  accepts_nested_attributes_for :tour, :venue
end
