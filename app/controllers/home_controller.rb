class HomeController < ApplicationController
  before_action :authenticate_employee!

  def index
    @field_trips = Array.new()
  end
end
