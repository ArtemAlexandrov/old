module Smartcore
  class Client

    def initialize(*args, &block)
      super
      request_token
    end

    def sign_in(login, password)
      Smartcore::ClientSignInRequest.new(login: login, password: password).execute
    end

    def token
      if Rails.cache
        Rails.cache.fetch(:api_token, expires_in: 23.hours) { sign_in(self.login, self.password) }
      else
        @token
      end
    end

    def sign_out(token)
      Rails.cache.delete(:api_token) if Rails.cache
      Smartcore::ClientSignOutRequest.new(api_token: token).execute
    end

    def request_token
      @token = sign_in(self.login, self.password)
      Rails.cache.write(:api_token, @token, expires_in: 23.hours) if Rails.cache
      @token
    end
  end
end
