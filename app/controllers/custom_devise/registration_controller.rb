class MyDevise::RegistrationsController < Devise::RegistrationsController

  def create
    super
    
    if resource.save
      @company = Company.new()
      @company.employee = resource
      @company.save
    end
  end


end