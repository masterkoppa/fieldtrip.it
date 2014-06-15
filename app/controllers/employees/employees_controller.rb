class Employees::EmployeesController < ApplicationController
  before_action :authenticate_employee!

  def manage
    @employees = current_employee.company.employees 
    @invited_employees = @employees.invitation_not_accepted
  end

  def invite_employee
    name = params[:name]
    email = params[:email]
    company_id = current_employee.company.id 
    Employee.invite!(email: email, name: name, company_id: company_id)
    respond_to do |format|
      format.json { render json: Company.find(company_id).employees.last }
    end
  end

end