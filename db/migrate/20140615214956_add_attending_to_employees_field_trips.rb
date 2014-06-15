class AddAttendingToEmployeesFieldTrips < ActiveRecord::Migration
  def change
    add_column :employees_field_trips, :attending, :boolean
  end
end
