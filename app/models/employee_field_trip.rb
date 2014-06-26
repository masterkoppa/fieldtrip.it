class EmployeeFieldTrip < ActiveRecord::Base
  belongs_to :employee 
  belongs_to :field_trip

  def respond
    update_column(:responded, true)
  end
end