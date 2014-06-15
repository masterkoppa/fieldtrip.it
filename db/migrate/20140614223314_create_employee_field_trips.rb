class CreateEmployeeFieldTrips < ActiveRecord::Migration
  def change
    create_table :employee_field_trips do |t|
      t.belongs_to :employee
      t.belongs_to :field_trip
    end

    create_table :employee_events do |t|
      t.boolean :attending

      t.belongs_to :employee
      t.belongs_to :event
    end
  end
end
