class EmployeesFieldTrip < ActiveRecord::Base
  belongs_to :employee 
  belongs_to :field_trip
end