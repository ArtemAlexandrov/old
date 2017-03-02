require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
  end

  context '#user_session_sign_in' do
    before do
      @password = 'qwerty12345'
      @email = generate_email
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
      @user_token = response.user_token
    end

    it 'should return auth token' do
      expect(@client.user_session_sign_in(@email, @password).user_token.class).to eq(String)
    end

    it 'should return profile data' do
      expect(@client.user_session_sign_in(@email, @password).profile.class).to eq(Smartcore::Models::User)
    end

  end

  context '#user_session_oauth_sign_in_url' do
    it 'should return a url string to unified api' do
      expect(@client.user_session_oauth_sign_in_url('vkontakte', 'callback_url','failure_url')).to include(Smartcore.domain)
    end
  end

  context '#user_session_sign_out' do
    before do
      @password = 'qwerty12345'
      @email = generate_email
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
      @user_token = response.user_token
    end
    it 'should return ok' do
      expect(@client.user_session_sign_out(@user_token)).to eq(true)
    end

    it 'should destroy token' do
      @client.user_session_sign_out(@user_token)
      expect { @client.user_profile(@user_token) }.to raise_error(Smartcore::BadUserToken)
    end

  end

end
