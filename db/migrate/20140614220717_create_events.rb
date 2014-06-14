class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :capacity

      t.belongs_to :field_trips

      t.string :type
      t.integer :type_id
      t.timestamps
    end
  end
end
