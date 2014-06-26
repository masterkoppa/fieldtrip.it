class CreateGroupsTable < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :event
      t.belongs_to :field_trip
    end

    create_table :employees_groups do |t|
      t.belongs_to :employee 
      t.belongs_to :group
    end
  end
end
