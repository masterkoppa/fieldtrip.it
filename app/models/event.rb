class Event < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_many :employees
  accepts_nested_attributes_for :address

  def set_sub_event(sub_event)
    self.sub_event = sub_event.to_json.to_s
  end

  def set_sub_event!(sub_event)
    set_sub_event(sub_event)
    self.save!
  end

  def get_sub_event
    # TODO Add changing to a actual temp model
    JSON.parse(self.sub_event)
  end
end
