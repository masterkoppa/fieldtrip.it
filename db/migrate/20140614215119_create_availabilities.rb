class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.time :start
      t.time :end

      t.belongs_to :employees
      t.timestamps
    end
  end
end
