require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
    @password = 'qwerty12345'
    @email = Faker::Internet.email
    @user_params = {
        first_name: 'test user first name',
        last_name: 'test user last name',
        patronymic: 'test user pathronymic',
        email: @email,
        is_male: true,
        birthday: '1988-01-01',
        accept_terms: true,
        city_id: @client.cities_list.sample,
        password: @password
    }

    response = @client.user_profile_registration(@user_params)
    @profile    = response.profile
    @user_token = response.token
  end

  context '#user_password_set_request' do
    it 'should return profile' do
      expect(@client.user_password_set_request(@email, 'qwerty12345').profile.class).to eq(Smartcore::Models::User)
    end

    it 'should return profile user with same email' do
      expect(@client.user_password_set_request(@email, 'qwerty12345').profile.email).to eq(@email)
    end

    it 'should return confirmation_token' do
      expect(@client.user_password_set_request(@email, 'qwerty12345').confirmation_token.class).to eq(String)
    end
  end

  context '#user_password_set_confirm' do
    before do
      @new_password = 'new_password'
      @confirmation_token = @client.user_password_set_request(@email, @new_password).confirmation_token
    end

    it 'should return true if confirmation token valid' do
      expect(@client.user_password_set_confirm(@confirmation_token)).to eq(true)
    end

    it 'should set password as confirmed and user can auth with new password' do
      @client.user_password_set_confirm(@confirmation_token)
      expect(@client.user_session_sign_in(@email, @new_password).profile.class).to eq(Smartcore::Models::User)
      expect(@client.user_session_sign_in(@email, @new_password).profile.email).to eq(@email)
    end
  end

  context '#user_password_reset_request' do
    it 'should return profile' do
      expect(@client.user_password_reset_request(@email).profile.class).to eq(Smartcore::Models::User)
    end

    it 'should return profile user with same email' do
      expect(@client.user_password_reset_request(@email).profile.email).to eq(@email)
    end

    it 'should return confirmation_token' do
      expect(@client.user_password_reset_request(@email).confirmation_token.class).to eq(String)
    end
  end

  context '#user_password_reset_confirm' do
    before do
      @new_password = 'new_password'
      @confirmation_token = @client.user_password_reset_request(@email).confirmation_token
    end

    it 'should return true if new password updated' do
      expect(@client.user_password_reset_confirm(@confirmation_token, @new_password)).to eq(true)
    end

    it 'should set password as confirmed and user can auth with new password' do
      @client.user_password_reset_confirm(@confirmation_token, @new_password)
      expect(@client.user_session_sign_in(@email, @new_password).profile.class).to eq(Smartcore::Models::User)
      expect(@client.user_session_sign_in(@email, @new_password).profile.email).to eq(@email)
    end
  end

end
