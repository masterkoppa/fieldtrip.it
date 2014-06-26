class AddRespondedToEmployeeFieldTrips < ActiveRecord::Migration
  def change
    add_column :employee_field_trips, :responded, :boolean
  end
end
