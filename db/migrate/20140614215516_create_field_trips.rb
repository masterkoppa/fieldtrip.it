class CreateFieldTrips < ActiveRecord::Migration
  def change
    create_table :field_trips do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time

      t.belongs_to :company

      t.timestamps
    end
  end
end
