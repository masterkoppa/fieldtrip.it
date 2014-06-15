class HomeController < ApplicationController
  before_action :authenticate_employee!

  def index
    @field_trips = Company.find_by_id(current_employee.company_id).field_trips
  end
end
