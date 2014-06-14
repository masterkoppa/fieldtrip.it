class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code

      t.belongs_to :companies
      t.belongs_to :events
      t.belongs_to :field_trips
      t.timestamps
    end
  end
end
