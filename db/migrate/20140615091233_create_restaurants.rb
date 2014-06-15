class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :reservation_type
      t.string :url

      t.belongs_to :event
      t.timestamps
    end
  end
end
