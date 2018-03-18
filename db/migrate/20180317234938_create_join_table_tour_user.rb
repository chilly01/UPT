class CreateJoinTableTourUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tours, :users do |t|
       t.index [:tour_id, :user_id]
    end
  end
end
