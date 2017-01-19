module Smartcore
  class UserProfileOAuthSignInRequest < BaseRequest

    attribute :callback_url,      String
    attribute :confirm_email_url, String, default: ''
    attribute :failure_url,       String


    def execute
      responce = execute_request_with_token
      if responce.status == success_status
        Smartcore::UserProfileOAuthResponse.new(JSON.parse(responce.body))
      else
        process_error(responce)
      end
    end

    def path
      router.user_sign_in_path
    end
  end
end
