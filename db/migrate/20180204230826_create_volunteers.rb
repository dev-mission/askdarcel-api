class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
