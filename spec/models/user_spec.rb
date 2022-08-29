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
    
    it "is not valid without a last name" do
      @user = User.new(first_name: 'Jeandre', last_name: nil, email: 'visser@test.com', password: 'tester', password_confirmation: 'tester')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "is not valid without an email" do
      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: nil, password: 'tester', password_confirmation: 'tester')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "is not valid without a password" do
      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "is not valid without password_confirmation" do
      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: 'tester', password_confirmation: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it "is not valid without matching passwords" do
      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: 'tester', password_confirmation: 'testers')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "is not valid when email already exists (not case sensitive)" do

      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: 'tester', password_confirmation: 'tester')

      @new_user = User.create(first_name: 'John', last_name: 'Miller', email: 'VISSER@TEST.com', password: 'tester', password_confirmation: 'tester')

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email has already been taken"
    end

    it "is not valid when password is less than 4 characters" do
      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: '123', password_confirmation: '123')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 4 characters)"
    end

    it "is valid when password is 4 characters" do
      @user = User.new(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: '1234', password_confirmation: '1234')
      expect(@user.password).to have_attributes(length: be >= 4)
      expect(@user.errors.full_messages).to be_empty
    end

  end

  describe '.authenticate_with_credentials' do
    it "authenticates when user credentials are valid" do
      @user = User.create(first_name: 'Jeandre', last_name: 'Visser', email: 'visser@test.com', password: 'tester', password_confirmation: 'tester')
      
      authentication = User.authenticate_with_credentials(@user.email, @user.password)

      expect(authentication).to eql @user
    end
  end
end
