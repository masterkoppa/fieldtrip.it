class EmployeePreference < ActiveRecord::Base
  belongs_to :employee
  belongs_to :event
end
