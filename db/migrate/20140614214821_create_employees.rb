class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone

      t.belongs_to :companies

      t.timestamps
    end
  end
end
