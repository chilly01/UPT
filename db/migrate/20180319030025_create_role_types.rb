class CreateRoleTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :role_types do |t|
      t.text :object_type
      t.integer :object_id
      t.text :role_name
      t.timestamps
    end
  end
end
