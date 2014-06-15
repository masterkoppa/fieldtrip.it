class CreateEmployeePreferences < ActiveRecord::Migration
  def change
    create_table :employee_preferences do |t|
      t.boolean :preference

      t.belongs_to :event

      t.timestamps
    end
  end
end
