class Tour < ApplicationRecord
  has_many :games
  has_and_belongs_to_many :user
end
