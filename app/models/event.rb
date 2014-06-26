class Event < ActiveRecord::Base
  after_create :create_group
  has_one :address, :as => :addressable
  has_one :group
  has_many :employee_preferences
  has_many :employee_events
  has_many :employees, through: :employee_events
  belongs_to :field_trip
  accepts_nested_attributes_for :address

  def create_group
    self.group = Group.create()
  end

  def full?
    group.employees.size >= capacity
  end

  def save_sub_event_object(sub_event_object)
    type = sub_event_object.class.name
    contents = sub_event_object.to_hash
    set_sub_event!(type, contents)
  end

  def set_sub_event(type, sub_event)
    self.sub_event = {:type => type, :contents => sub_event}.to_json.to_s
  end

  def set_sub_event!(type, sub_event)
    set_sub_event(type, sub_event)
    self.save!
  end

  def get_sub_event
    temp = JSON.parse(self.sub_event)
    type = temp["type"]
    contents = temp["contents"].symbolize_keys!

    new_sub_event = type.constantize.new contents

    new_sub_event
  end
end
