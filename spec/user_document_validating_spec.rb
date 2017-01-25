require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
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
    @client.user_profile_confirm_email(response.email_confirmation_token)
    @profile    = response.profile
    @user_token = response.token
    @base64doc = Smartcore::Helper.convert_file_to_base64(File.dirname(__FILE__) + '/image.jpg')
  end

  context '#upload_document_scan' do
    it 'should return a user profile' do
      expect(@client.upload_document_scan(@user_token,@base64doc).email).to eq(@profile.email)
    end
  end

  context '#confirm_document_scan' do
    it 'should return true when document confirmed' do
      @client.upload_document_scan(@user_token,@base64doc)
      document_scan = @client.list_document_scans.first
      expect(@client.confirm_document_scan(document_scan.id, document_scan.profile.id, 'test text')).to eq(true)
    end

    it 'should change user status from not verified to verified' do
      @client.upload_document_scan(@user_token,@base64doc)
      document_scan = @client.list_document_scans.select {|document_scan| document_scan.profile.id == @profile.id}.first
      expect(@client.user_profile(@user_token).verification_state).to eq(:uploaded_scan)
      @client.confirm_document_scan(document_scan.id, document_scan.profile.id, 'test text')
      expect(@client.user_profile(@user_token).verification_state).to eq(:verified)
    end

  end

  context '#decline_document_scan' do
    it 'should return true when document rejected' do
      @client.upload_document_scan(@user_token,@base64doc)
      document_scan = @client.list_document_scans.first
      expect(@client.decline_document_scan(document_scan.id, 'admin', 'test text')).to eq(true)
    end
    it 'should change user status from not verified to verified' do
      @client.upload_document_scan(@user_token,@base64doc)
      document_scan = @client.list_document_scans.select {|document_scan| document_scan.profile.id == @profile.id}.first
      expect(@client.user_profile(@user_token).verification_state).to eq(:uploaded_scan)
      @client.decline_document_scan(document_scan.id, document_scan.profile.id, 'test text')
      expect(@client.user_profile(@user_token).verification_state).to eq(:rejected)
    end
  end

  context '#list_document_scans' do
    it 'should return array' do
      @client.upload_document_scan(@user_token,@base64doc)
      expect(@client.list_document_scans.class).to eq(Array)
    end
    it 'should return array with document scans' do
      @client.upload_document_scan(@user_token,@base64doc)
      expect(@client.list_document_scans.first.class).to eq(Smartcore::Models::DocumentScan)
    end
  end


end
