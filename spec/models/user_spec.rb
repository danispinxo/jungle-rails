require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have one item created after being created' do
      
      @user = User.create(name: 'New User', email: 'fake@sample.com', password: 'password', password_confirmation: 'password')

      expect(User.all.count).to eq(1)
    end

    it 'should throw an error if the password and confirmation do not match' do
      
      @user = User.create(name: 'New User', email: 'fake@sample.com', password: 'password', password_confirmation: 'incorrect')

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      expect(@user).to_not be_valid
    end

    it 'should throw an error if the password is blank' do
      @user = User.create(name: 'New User', email: 'fake@sample.com')

      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user).to_not be_valid
    end

    it 'should throw an error if the name is blank' do
      @user = User.create(email: 'fake@sample.com', password: 'password', password_confirmation: 'password')

      expect(@user.errors.full_messages).to include("Name can't be blank")
      expect(@user).to_not be_valid
    end

    it 'should throw an error if the email is blank' do
      @user = User.create(name: 'New User', password: 'password', password_confirmation: 'password')

      expect(@user.errors.full_messages).to include("Email can't be blank")
      expect(@user).to_not be_valid
    end

    it 'should throw an error if the email is not unique' do
      @user = User.create(name: 'New User', email: 'fake@sample.com', password: 'password', password_confirmation: 'password')
      @repeat_user = User.create(name: 'Repeat User', email: 'fake@sample.com', password: 'password', password_confirmation: 'password')

      expect(@repeat_user.errors.full_messages).to include("Email has already been taken")
      expect(@repeat_user).to_not be_valid
    end

    it 'should throw an error if the password is too short' do
      @user = User.create(name: 'New User', email: 'afake@sample.com', password: 'ab', password_confirmation: 'ab')

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      expect(@user).to_not be_valid
    end 
  end

  describe '.authenticate_with_credentials' do

    it 'should authenticate a user with the correct information' do
      @new_user = User.create(name: 'Sign Me In', email: 'signin@example.com', password: 'password', password_confirmation: 'password')

      @login = User.authenticate_with_credentials('signin@example.com', 'password')
      expect(@login.name).to eq('Sign Me In')
    end

    it 'should not authenticate a user with incorrect password' do
      @new_user = User.create(name: 'Sign Me In', email: 'signin@example.com', password: 'password', password_confirmation: 'password')

      @login = User.authenticate_with_credentials('signin@example.com', 'incorrectpassword')

      expect(@login).to be_nil
    end

    it 'should not authenticate a user that does not have an account' do
      @login = User.authenticate_with_credentials('unregistered.user@sample.com', 'password')
      expect(@login).to be_nil
    end

    it 'should authenticate a user with spaces before or after email when logging in' do
      @new_user = User.create(name: 'Sign Me In', email: 'signin@example.com', password: 'password', password_confirmation: 'password')

      @login = User.authenticate_with_credentials('  signin@example.com  ', 'password')
      expect(@login.name).to eq('Sign Me In')
    end

    it 'should authenticate a user with different CASE in email when logging in' do
      @new_user = User.create(name: 'Sign Me In', email: 'signin@example.com', password: 'password', password_confirmation: 'password')

      @login = User.authenticate_with_credentials('siGnin@example.COM', 'password')
      expect(@login.name).to eq('Sign Me In')
    end

  end

end
