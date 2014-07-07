require 'rails_helper'

RSpec.describe Employee, type: :model do 



  describe "validations" do 
    before do 
      @employee = Employee.new(name: "John Smith")
      @employee.password = "password1"
    end

    describe "email validations" do 
      before { @employee.role = EMPLOYEE_ROLES.sample }
      context "with no email given" do 
        it "does not pass validation" do 
          expect(@employee).to be_invalid
          expect(@employee.errors[:email]).to include "can't be blank"
        end
      end
    end

    describe "role validations" do 
      before { @employee.email = "john@example.com" }
      context "with no role" do 
        it "is invalid" do 
          expect(@employee).to be_invalid
          expect(@employee.errors[:role]).to include "Role must be a valid role."
        end
      end

      context "with a valid role" do 
        before { @employee.role = EMPLOYEE_ROLES.sample }
        it "is valid" do 
          expect(@employee).to be_valid
        end
      end

      context "with an invalid role" do 
        it "is invalid" do 
          expect(@employee).to be_invalid
          expect(@employee.errors[:role]).to include "Role must be a valid role."
        end
      end
    end
  end

  describe "callbacks" do 
    before do 
      @employee = Employee.new(name: "John Smith", email: "john@example.com")
      @employee.password = "password1"
    end
    describe ".before_validation" do 
      describe "#format_phone_number" do 
        it "removes dashes" do 
          @employee.phone = "1-234-567-8901"
          @employee.send(:format_phone_number)
          expect(@employee.phone).to eq("12345678901")
        end
        it "removes catches 'x' and 'ext'" do 
          @employee.phone = "1-234-567-8901 x1234"
          @employee.send(:format_phone_number)
          expect(@employee.phone).to eq("12345678901x1234")
    
          @employee.phone = "1-234-567-8901 ext1234"
          @employee.send(:format_phone_number)
          expect(@employee.phone).to eq("12345678901x1234")
        end
        it "removes parentheses and '+' symbols" do 
          @employee.phone = "+1 (234) 567-8901"
          @employee.send(:format_phone_number)
          expect(@employee.phone).to eq("12345678901")
        end
        it "removes periods" do 
          @employee.phone = "1.234.567.8901" 
          @employee.send(:format_phone_number)
          expect(@employee.phone).to eq("12345678901")
        end
        it "does not modify an already valid phone number" do 
          @employee.phone = "12345678901"
          @employee.send(:format_phone_number)
          expect(@employee.phone).to eq("12345678901")
        end
      end
    end
  end 

end

 
 
 
 

