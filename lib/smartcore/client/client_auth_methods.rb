module Smartcore
  class Client

    def sign_in(login, password)

    end

    def sign_out(token)

    end




    private

    def request_token
      client_auth(self.login, self.password)
    end

  end
end
