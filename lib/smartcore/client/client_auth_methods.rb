module Smartcore
  class Client

    def initialize(options)
      super(options)
      request_token
    end

    def sign_in(login, password)
      self.token = (Rails.cache && Rails.cache.read(:api_token)) || Smartcore::ClientSignInRequest.new(login: login, password: password).execute
    end

    def sign_out(token)
      Rails.cache.delete(:api_token) if Rails.cache
      Smartcore::ClientSignOutRequest.new(api_token: token).execute
    end

    def request_token
      token = sign_in(self.login, self.password)
      Rails.cache.write(:api_token, token) if Rails.cache
      token
    end
  end
end
