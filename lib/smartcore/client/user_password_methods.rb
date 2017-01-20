module Smartcore
  class Client

    # @return [String] token
    def user_password_set_request(email, new_password)
      Smartcore::UserProfilePasswordSetRequest.new(api_token: self.token,
                                                   email: email,
                                                   new_password: new_password).execute
    end

    def user_password_set_confirm(token)
      Smartcore::UserProfilePasswordSetConfirmRequest.new(api_token: self.token,
                                                          confirmation_token: token).execute
    end

    def user_password_reset_request(email)
      Smartcore::UserProfilePasswordSetRequest.new(api_token: self.token,
                                                   email: email).execute
    end

    def user_password_reset_confirm(token, new_password)
      Smartcore::UserProfilePasswordResetRequest.new(api_token: self.token,
                                                     confirmation_token: token,
                                                     password: new_password).execute
    end

  end
end
