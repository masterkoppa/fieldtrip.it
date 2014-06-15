class AddEmployeeIdToEmployeePreferences < ActiveRecord::Migration
  def change
    add_column :employee_preferences, :employee_id, :integer
  end
end
