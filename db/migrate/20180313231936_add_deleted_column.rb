class AddDeletedColumn < ActiveRecord::Migration[5.1]
  def up
    add_column :games, :active, :boolean, :default => 1
  end

  def down
    remove_column :games, :active
  end 
end
