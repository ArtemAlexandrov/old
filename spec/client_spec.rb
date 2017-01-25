require 'spec_helper'
describe Smartcore::Client do

  before do
    @api_login    = 'kent'
    @api_password = 'Passw0rd12'
    @client = Smartcore::Client.new(login: @api_login, password: @api_password)
  end

  it 'should login to api' do
    expect(@client.request_token.class).to eq(String)
  end

  context '#sign_in' do
    it 'should return a string token' do
      token = @client.sign_in(@api_login, @api_password)
      expect(token.class).to eq(String)
    end

    it 'should raise error with wrong login / password' do
      expect { @client.sign_in('wrong_login', 'wrong_password') }.to raise_error(Smartcore::ApiClientNotAuthorized)
    end
  end

  context '#sign_out' do

    it 'should return true if token valid' do
      token = @client.sign_in(@api_login, @api_password)
      expect(@client.sign_out(token)).to eq(true)
    end

  end


end