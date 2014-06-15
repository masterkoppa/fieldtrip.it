class Employees::RegistrationsController < Devise::RegistrationsController

  def new
    @company = Company.new()
    @address = Address.new()
    super
  end

  def create
    @address = Address.new(address_params)
    @company = Company.new(company_params)
    if @company.valid? && @address.valid?
      super
      if resource.valid?
          @company.address = @address
          @company.employees << resource
          @company.save
      end
    end
  end

  private
  def company_params
    params[:company].permit(:name, :email, :phone)
  end

  def address_params
    params[:company][:address].permit(:line1, :line2, :city, :state, :zip)
  end

end