require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
  end

  context '#user_profiles' # TODO

  context '#user_profile_registration' do
    before do
      @user_params = {
          first_name: 'test user first name',
          last_name: 'test user last name',
          patronymic: 'test user pathronymic',
          email: Faker::Internet.email,
          is_male: true,
          birthday: '1988-01-01',
          accept_terms: true,
          city_id: @client.cities_list.sample,
          password: 'qwerty12345'
      }
    end

    it 'should return success response' do
      expect(@client.user_profile_registration(@user_params).success?).to eq(true)
    end

    it 'should return user auth token' do
      expect(@client.user_profile_registration(@user_params).token.class).to eq(String)
    end

    it 'should return email confirmation token' do
      expect(@client.user_profile_registration(@user_params).email_confirmation_token.class).to eq(String)
    end

    it 'should return user profile' do
      expect(@client.user_profile_registration(@user_params).profile.class).to eq(Smartcore::Models::User)
    end

  end

  context '#user_profile' do
    before do
      @user_params = {
          first_name: 'test user first name',
          last_name: 'test user last name',
          patronymic: 'test user pathronymic',
          email: Faker::Internet.email,
          is_male: true,
          birthday: '1988-01-01',
          accept_terms: true,
          city_id: @client.cities_list.sample,
          password: 'qwerty12345'
      }
      response = @client.user_profile_registration(@user_params)
      @profile    = response.profile
      @user_token = response.token
    end

    it 'should return user profile data' do
      expect(@client.user_profile(@user_token).class).to eq(Smartcore::Models::User)
    end

    it 'should return correct user profile_data' do
      expect(@client.user_profile(@user_token).email).to eq(@profile.email)
    end
  end

  context '#user_profile_update' do
    before do
      @user_params = {
          first_name: 'test user first name',
          last_name: 'test user last name',
          patronymic: 'test user pathronymic',
          email: Faker::Internet.email,
          is_male: true,
          birthday: '1988-01-01',
          accept_terms: true,
          city_id: @client.cities_list.sample,
          password: 'qwerty12345'
      }
      response = @client.user_profile_registration(@user_params)
      @profile    = response.profile
      @user_token = response.token
    end

    it 'should return updated user profile' do
      new_name = 'new user name'
      @user_params[:first_name] = new_name
      expect(@client.user_profile_update(@user_token, @user_params).first_name).to eq(new_name)
    end
  end

  context '#user_profile_update_avatar' do
    #   TODO
  end
end
