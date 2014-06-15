class RenameEmployeeEvents < ActiveRecord::Migration
  def change
    rename_table :employee_events, :employees_events
  end
end
