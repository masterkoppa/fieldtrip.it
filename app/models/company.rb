class Company < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_many :employees
  has_many :employees
  accepts_nested_attributes_for :address
end
