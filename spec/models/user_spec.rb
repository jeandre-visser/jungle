require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid when all user attributes are valid" do
      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: 'tester', password_confirmation: 'tester')
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end


    it "is not valid without a first name" do
      @user = User.new(first_name: nil, last_name: 'Visser', email: 'visser@test.com', password: 'tester', password_confirmation: 'tester')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
