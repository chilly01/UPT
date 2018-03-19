class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.text :content
      t.integer :user_id
      t.integer :role_type_id
      t.timestamps
    end
  end
end
