module Smartcore
  class Client
    # Login User Methods
    def user_session_sign_in(email, password)
      Smartcore::UserProfileSignInRequest.new(email: email, password: password).execute
    end

    def user_session_oauth_sign_in_url(provider, callback_url, failure_url)
      response = Smartcore::UserProfileOAuthSignInRequest.new(callback_url: callback_url, failure_url: failure_url).execute
      if response.success?
        "#{response.url}?provider=#{provider}"
      end
    end

    def user_session_sign_out(user_token)
      Smartcore::UserProfileSignOutRequest.new(user_token: user_token).execute
    end
  end
end
