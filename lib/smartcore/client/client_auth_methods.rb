module Smartcore
  class Client

    def initialize(options)
      super(options)
      request_token
    end

    def sign_in(login, password)
      self.token = Smartcore::ClientSignInRequest.new(login: login, password: password).execute
    end

    def sign_out(token)
      Smartcore::ClientSignOutRequest.new(token: token).execute
    end

    def request_token
      sign_in(self.login, self.password)
    end

  end
end
