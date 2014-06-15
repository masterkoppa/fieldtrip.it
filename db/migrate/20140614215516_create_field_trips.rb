class CreateFieldTrips < ActiveRecord::Migration
  def change
    create_table :field_trips do |t|
      t.string :name
      t.string :description
      t.time :start_time
      t.time :end_time

      t.belongs_to :company

      t.timestamps
    end
  end
end
