class FieldTrip < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_one :company
  has_many :events
  has_many :employees_field_trips
  has_many :employees, through: :employees_field_trips
  accepts_nested_attributes_for :address

  def attending?(employee)
    employee.in?self[:employees]
  end
end
