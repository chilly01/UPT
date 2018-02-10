class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
