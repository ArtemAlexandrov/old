module Smartcore
  class Client

    def user_profile_confirm_email(token)
      Smartcore::ConfirmEmailRequest.new(api_token: self.token, token: token).execute
    end

  end
end
