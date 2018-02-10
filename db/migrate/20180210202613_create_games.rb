class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :notes
      t.integer :tour_id
      t.integer :venue_id
      t.string :start_time
      t.string :day

      t.timestamps
    end
  end
end
