module Smartcore
  class UserProfileOAuthSignInRequest < TokenRequest

    attribute :callback_url,      String
    attribute :confirm_email_url, String, default: ''
    attribute :failure_url,       String


    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileOAuthResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_oauth_sign_in_path
    end
  end
end
