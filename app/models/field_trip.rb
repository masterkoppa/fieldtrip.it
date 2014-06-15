class FieldTrip < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_one :company
  has_many :events
  has_and_belongs_to_many :employees
  accepts_nested_attributes_for :address

  def attending?(employee)
    employee.in?self[:employees]
  end
end
