require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
  end

  context '#user_profiles' do

    it 'should return array of user_profiles' do
      expect(@client.user_profiles.profiles.class).to eq(Array)
    end

    it 'should return user_profiles' do
      expect(@client.user_profiles.profiles.first.class).to eq(Smartcore::Models::User)
    end

    it 'should return total of user_profiles' do
      expect(@client.user_profiles.total.class).to eq(Fixnum)
    end

    it 'should return user_profiles count equal per page parameter' do
      per_page = 3
      expect(@client.user_profiles(1,per_page).profiles.count).to eq(per_page)
    end

    it 'should return same user on same request' do
      profile_emails = @client.user_profiles(1).profiles.map(&:email)
      expect(@client.user_profiles(1).profiles.map(&:email)).to eq(profile_emails)
    end

    it 'should return next pack of users on next page' do
      profile_emails = @client.user_profiles(1).profiles.map(&:email)
      expect(@client.user_profiles(2).profiles.map(&:email)).to_not eq(profile_emails)
    end

    it 'should return users by query' do
      query = 'verification_state=0'
      expect(@client.user_profiles(1,20,query).profiles.map(&:verification_state)).to all( be == :not_verified)
    end

  end

  context '#user_profile_registration' do
    before do
      @user_params = {
          first_name: 'test user first name',
          last_name: 'test user last name',
          patronymic: 'test user pathronymic',
          email: generate_email,
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
      expect(@client.user_profile_registration(@user_params).user_token.class).to eq(String)
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
          email: generate_email,
          is_male: true,
          birthday: '1988-01-01',
          accept_terms: true,
          city_id: @client.cities_list.sample,
          password: 'qwerty12345'
      }
      response = @client.user_profile_registration(@user_params)
      @profile    = response.profile
      @user_token = response.user_token
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
          email: generate_email,
          is_male: true,
          birthday: '1988-01-01',
          accept_terms: true,
          city_id: @client.cities_list.sample,
          password: 'qwerty12345'
      }
      response = @client.user_profile_registration(@user_params)
      @profile    = response.profile
      @user_token = response.user_token
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

  context '#user_profile_confirm_email' do
    before do
      @user_params = {
          first_name: 'test user first name',
          last_name: 'test user last name',
          patronymic: 'test user pathronymic',
          email: generate_email,
          is_male: true,
          birthday: '1988-01-01',
          accept_terms: true,
          city_id: @client.cities_list.sample,
          password: 'qwerty12345'
      }
      response = @client.user_profile_registration(@user_params)
      @profile    = response.profile
      @email_confirmation_token = response.email_confirmation_token
    end

    it 'should return a user profile' do
      expect(@client.user_profile_confirm_email(@email_confirmation_token).user_token.class).to eq(String)
    end

    it 'should return a valid by token' do
      token = @client.user_profile_confirm_email(@email_confirmation_token).user_token
      expect(@client.user_profile(token).email).to eq(@profile.email)
    end
  end
  context '#user_profile_set_mark' do
    before do
      @user_params = {
          first_name: 'test user first name',
          last_name: 'test user last name',
          patronymic: 'test user pathronymic',
          email: generate_email,
          is_male: true,
          birthday: '1988-01-01',
          accept_terms: true,
          city_id: @client.cities_list.sample,
          password: 'qwerty12345'
      }
      response = @client.user_profile_registration(@user_params)
      @profile    = response.profile
      @user_token = response.user_token
    end

    it 'return true when success' do
      expect(@client.user_profile_set_mark(@user_token, 'mark', 123)).to be_truthy
    end

    it 'add mark to profile' do
      @client.user_profile_set_mark(@user_token, 'mark', 123)
      expect(@client.user_profile(@user_token).marks.count).to eq(1)
      expect(@client.user_profile(@user_token).marks['mark']).to eq('123')
    end
  end
end
