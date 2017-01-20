module Smartcore
  class UserProfilePasswordResetRequest < TokenRequest

    attribute :confirmation_token,    String
    attribute :password,              String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.user_password_reset_path
    end
  end
end
