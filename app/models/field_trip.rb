class FieldTrip < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_one :company
  has_many :groups
  has_many :events
  has_many :employee_field_trips
  has_many :employees, through: :employee_field_trips
  accepts_nested_attributes_for :address

  def attending_employees
    employee_field_trips.where('attending != ? OR attending IS NULL', false).map(&:employee)
  end

  def groups 
    events.map(&:group)
  end

  def set_groups!
    employees_left = attending_employees 

    attending_employees.each do |employee|
      preferred_event = employee.employee_preferences.first.event
      unless preferred_event.full?
        preferred_event.group.employees << employee 
        employees_left.delete(employee)
      end
    end

    if employees_left.any?
      events_left = events.select { |event| !event.full? }
      events_left.sort! { |e1, e2| e1.capacity <=> e2.capacity }
      events_left.each do |event|
        until event.full?
          event.group.employees << employees_left.pop
          events_left.sort! { |e1, e2| e1.capacity <=> e2.capacity }
        end
      end
    end

  end

end
