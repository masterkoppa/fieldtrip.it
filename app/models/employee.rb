class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :role_is_a_valid_role
  belongs_to :company
  has_many :events
  has_many :field_trips
  has_many :employee_preferences

  def admin? 
    admin
  end

  def accepted_invite?
    encrypted_password.present?
  end

  def current_trip
    field_trips.last
  end

  def not_attending!(field_trip)
    employee_field_trips.find {|trip| trip.field_trip == field_trip}.attending = false
  end

  def prefer(event_id)
    employee_preferences << EmployeePreference.create(employee_id: id, event_id: event_id, preference: true)
  end

  # validations
  def role_is_a_valid_role
    unless role.in? EMPLOYEE_ROLES
      errors.add(:role, "Role must be a valid role.")
    end 
  end

end
