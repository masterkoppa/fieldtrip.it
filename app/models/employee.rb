class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :format_phone_number
  
  validate :role_is_a_valid_role
  
  belongs_to :company
  
  has_many :employee_preferences
  has_many :employee_events
  has_many :events, through: :employee_events
  has_many :employee_field_trips
  has_many :field_trips, through: :employee_field_trips

  has_and_belongs_to_many :groups

  def admin? 
    admin
  end

  def respond_to(field_trip)
    employee_field_trips.find_by(field_trip_id: field_trip.id).respond
  end

  def accepted_invite?
    encrypted_password.present?
  end

  def current_trip
    field_trips.last
  end

  def not_attending!(field_trip)
    employees_field_trips.find {|trip| trip.field_trip == field_trip}.attending = false
  end

  def prefer(event)
    employee_preferences << EmployeePreference.create(employee_id: id, event_id: event.id, preference: true)
  end

  ### Callbacks ###
  def format_phone_number
    phone.gsub!(/[^0-9x]/,"") if phone.present?
  end

  ### Validations ###
  def role_is_a_valid_role
    unless role.in? EMPLOYEE_ROLES
      errors.add(:role, "Role must be a valid role.")
    end 
  end

end
