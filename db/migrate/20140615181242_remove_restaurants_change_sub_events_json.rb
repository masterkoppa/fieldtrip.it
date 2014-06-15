class RemoveRestaurantsChangeSubEventsJson < ActiveRecord::Migration
  def change
    drop_table :restaurants
    remove_column :events, :type
    remove_column :events, :type_id
    add_column :events, :sub_event, :string
  end
end
