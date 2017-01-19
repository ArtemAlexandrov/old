module Smartcore
  class Client

    LOGIN = 'kent'
    PASSWORD = 'Passw0rd12'

    def sign_in(login, password)
      Smartcore::ClientSignInRequest.new(login: login, password: password).execute
    end

    def sign_out(token)
      Smartcore::ClientSignOutRequest.new(token: token).execute
    end

    def request_token
      sign_in(LOGIN, PASSWORD)
    end

  end
end
