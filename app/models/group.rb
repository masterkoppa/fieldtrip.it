class Group < ActiveRecord::Base
  belongs_to :event
  belongs_to :field_trip
  has_and_belongs_to_many :employees
end
