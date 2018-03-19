class Venue < ApplicationRecord
  has_many :games
  has_many :role_types, :as => :object
end
