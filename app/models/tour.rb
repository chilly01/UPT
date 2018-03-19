class Tour < ApplicationRecord
  has_many :games
  has_and_belongs_to_many :user
  has_many :role_types, :as => :object
end
