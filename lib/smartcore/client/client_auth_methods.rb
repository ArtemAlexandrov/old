module Smartcore
  class Client

    def initialize(options)
      super(options)
      request_token
    end

    def sign_in(login, password)
      Rails.cache.delete(:api_token) if Rails.cache
      self.token = Smartcore::ClientSignInRequest.new(login: login, password: password).execute
    end

    def sign_out(token)
      Smartcore::ClientSignOutRequest.new(api_token: token).execute
    end

    def request_token
      if Rails.cache
        unless Rails.cache.exist?(:api_token)
          Rails.cache.write(:api_token, sign_in(self.login, self.password))
        end
        Rails.cache.read(:api_token, self.token)
      else
        sign_in(self.login, self.password)
      end
    end
  end
end
