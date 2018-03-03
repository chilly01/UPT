class Game < ApplicationRecord
  belongs_to :tour
  belongs_to :venue

  accepts_nested_attributes_for :tour, :venue


 def offset_of_next_game
   d = Date.parse(self.day)
   d += 7  if d < Date.today
   d - Date.today
 end

 def time_sort
   val = self.start_time.split(":")
   sum = val[0].to_i * 2
   temp = val[1].split(//)
   sum += 24 if (sum < 24 && temp[2] == "P")
   sum += 1 if temp[0] == "3"
   sum
 end

end
