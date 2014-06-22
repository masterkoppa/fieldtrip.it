class AddAttendingToEmployeesFieldTrips < ActiveRecord::Migration
  def change
    add_column :employee_field_trips, :attending, :boolean
  end
end
