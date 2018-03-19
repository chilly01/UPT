class Venue < ApplicationRecord
  geocoded_by :location
  after_validation :geocode
  has_many :games
  has_many :role_types, :as => :object
end
