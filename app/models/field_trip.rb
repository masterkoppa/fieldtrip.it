class FieldTrip < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_many :employees
  has_one :company
  has_many :events
  accepts_nested_attributes_for :address

  def attending?(employee)
    employee.in?self[:employees]
  end
end
