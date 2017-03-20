module Smartcore
  class Client

    def initialize(options)
      super(options)
      request_token
    end

    def sign_in(login, password)
      self.token = Smartcore::ClientSignInRequest.new(login: login, password: password).execute
      if Rails.cache
        if self.token.present?
          Rails.cache.write(:api_token, self.token)
        else
          Rails.cache.delete(:api_token)
        end
      end
      self.token
    end

    def sign_out(token)
      Smartcore::ClientSignOutRequest.new(api_token: token).execute
    end

    def request_token
      sign_in(self.login, self.password)
    end

  end
end
