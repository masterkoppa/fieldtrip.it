class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.datetime :start
      t.datetime :end

      t.belongs_to :employee
      t.timestamps
    end
  end
end
