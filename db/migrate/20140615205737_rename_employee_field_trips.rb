class RenameEmployeeFieldTrips < ActiveRecord::Migration
  def change
    rename_table :employee_field_trips, :employees_field_trips
  end
end
