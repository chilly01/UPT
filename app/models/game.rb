class Game < ApplicationRecord
  belongs_to :tour
  belongs_to :venue

  accepts_nested_attributes_for :tour, :venue


 def date_of_next_game
   d = Date.parse(self.day)
   d += 7  if d < Date.today
   d - Date.today
 end

end
