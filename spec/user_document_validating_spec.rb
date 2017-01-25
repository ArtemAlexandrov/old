require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
  end

  context '#upload_document_scan' do
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
      @base64doc = Smartcore::Helper.convert_file_to_base64(File.dirname(__FILE__) + '/image.jpg')
    end

    it 'should return a user profile' do
      expect(@client.upload_document_scan(@user_token,@base64doc).email).to eq(@profile.email)
    end
  end

  context '#list_document_scans' do
    # TODO
    it 'should return array' do
      expect(@client.list_document_scans.class).to eq(Array)
    end
  end

  context '#confirm_document_scan' do

  end

  context '#decline_document_scan' do

  end

end
