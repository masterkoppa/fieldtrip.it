class FieldTrip < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_one :company
  has_many :events
  has_many :employee_field_trips
  has_many :employees, through: :employees_field_trips
  accepts_nested_attributes_for :address

end
