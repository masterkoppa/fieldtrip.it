class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :role_is_a_valid_role
  belongs_to :company
  has_many :events
  has_many :field_trips

  def admin? 
    admin
  end

  def accepted_invite?
    encrypted_password.present?
  end

  def role_is_a_valid_role
    unless role.in? EMPLOYEE_ROLES
      errors.add(:role, "Role must be a valid role.")
    end 
  end

end
