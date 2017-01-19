module Smartcore
  class Client

    def sign_in(login, password)
      Smartcore::ClientSignInRequest.new(login: login, password: password).execute
    end

    def sign_out(token)
      Smartcore::ClientSignOutRequest.new(token: token).execute
    end




    private

    def request_token
      client_auth(self.login, self.password)
    end

  end
end
