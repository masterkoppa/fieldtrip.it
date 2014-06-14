class CreateEmployeeFieldTrips < ActiveRecord::Migration
  def change
    create_table :employee_field_trips do |t|
      t.belongs_to :employees
      t.belongs_to :field_trips
    end

    create_table :employee_events do |t|
      t.boolean :attending

      t.belongs_to :employees
      t.belongs_to :events
    end
  end
end
