require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
  end

  context '#user_profile_by_id' do
    it 'return responce Smartcore::UserProfileWithDocumentsResponse' do
      profile_id = @client.user_profiles.profiles.first.id
      expect(@client.user_profile_by_id(profile_id).class).to eq(Smartcore::UserProfileWithDocumentsResponse)
      expect(@client.user_profile_by_id(profile_id).profile.id).to eq(profile_id)
    end

    it 'return error if user not exist' do
      expect { @client.user_profile_by_id('qwerty') }.to raise_error(Smartcore::NotFoundError)
    end
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
          password: 'qwerty12345',
          street: 'Маяковская',
          postcode: '123'
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
    it 'should return updated user profile' do
      new_street = 'Невский'
      @user_params[:street] = new_street
      expect(@client.user_profile_update(@user_token, @user_params).street).to eq(new_street)
    end
    it 'should return updated user profile' do
      new_postcode = 'Невский'
      @user_params[:postcode] = new_postcode
      expect(@client.user_profile_update(@user_token, @user_params).postcode).to eq(new_postcode)
    end

    it 'should can update user subscribes' do
      expect(@client.user_profile_update(@user_token, {subscribed: true}).subscribed).to be_truthy
      expect(@client.user_profile_update(@user_token, {subscribed: false}).subscribed).to be_falsey
      expect(@client.user_profile_update(@user_token, {subscribed: false}).first_name).to eq(@profile.first_name)
    end
  end

  context '#user_profile_update_avatar' do
    #   TODO
  end

  context '#staff_verification' do
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
    end

    it 'success' do
      expect(@client.staff_verification(@profile.id, 'verified')).to be_truthy
    end
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

  context '#users_activities' do
    it 'return Array[UserActivity]' do
      expect(@client.users_activities.class).to eq(Array)
      expect(@client.users_activities.first.class).to eq(Smartcore::Models::UserActivity)
    end
    it 'return Array[UserActivity] of profile by profile_id' do
      profile_id = @client.users_activities(1,1).first.profile_id
      expect(@client.users_activities(profile_id: profile_id).map(&:profile_id).uniq.count).to eq(1)
    end
    it 'return Array[UserActivity] of chosen type' do
      type = @client.users_activities(1,1).first.type
      expect(@client.users_activities(type: type).map(&:type).uniq.count).to eq(1)
    end

    it 'should return total count equal per page parameter' do
      per_page = 3
      expect(@client.users_activities(1,per_page).count).to eq(per_page)
    end

    it 'should return same user on same request' do
      activities_data = @client.users_activities(1).map(&:data)
      expect(@client.users_activities(1).map(&:data)).to eq(activities_data)
    end

    it 'should return next pack of users on next page' do
      activities_data = @client.users_activities(1).map(&:data)
      expect(@client.users_activities(2).map(&:data)).to_not eq(activities_data)
    end
  end
end
