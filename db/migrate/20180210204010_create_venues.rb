class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :location
      t.text :notes

      t.timestamps
    end
  end
end
