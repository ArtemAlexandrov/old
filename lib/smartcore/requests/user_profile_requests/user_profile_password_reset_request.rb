module Smartcore
  class UserProfilePasswordResetRequest < TokenRequest

    attribute :confirmation_token,    String
    attribute :new_password,          String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_confirm_password_reset_path
    end
  end
end
