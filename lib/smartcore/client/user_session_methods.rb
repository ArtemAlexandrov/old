module Smartcore
  class Client
    # Login User Methods
    def user_session_sign_in(email, password, user_ip = nil)
      Smartcore::UserProfileSignInRequest.new(api_token: self.token,
                                              email: email,
                                              password: password,
                                              user_ip: user_ip).execute
    end

    def user_session_force_sign_in(user_profile_id, user_ip = nil)
      Smartcore::UserProfileSignInByIdRequest.new(api_token: self.token,
                                                  profile_id: user_profile_id,
                                                  user_ip: user_ip).execute
    end

    def user_session_oauth_sign_in_url(provider, callback_url, failure_url)
      response = Smartcore::UserProfileOAuthSignInRequest.new(api_token: self.token,
                                                              callback_url: callback_url,
                                                              failure_url: failure_url).execute

      "#{response.url}?provider=#{provider}" if response && response.success?
    end

    def user_session_sign_out(user_token)
      Smartcore::UserProfileSignOutRequest.new(api_token: self.token,
                                               user_token: user_token).execute
    end
  end
end
