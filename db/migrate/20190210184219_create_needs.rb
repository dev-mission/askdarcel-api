class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|
      t.string :name, null: false
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :needs, :needs, column: 'parent_id'
    create_table :needs_resources, id: false do |t|
      t.integer :need_id, null: false
      t.integer :resource_id, null: false, index: true
    end
    add_index :needs_resources, [:need_id, :resource_id], unique: true
    add_foreign_key :needs_resources, :needs
    add_foreign_key :needs_resources, :resources
  end
end
