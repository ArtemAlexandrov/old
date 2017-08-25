module Smartcore
  class UserProfilePasswordChangeRequest < TokenRequest

    attribute :user_token, String
    attribute :old_password, String
    attribute :new_password, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::SuccessResponse.new
      else
        process_error(response)
      end
    end

    def path
      router.user_password_change_path
    end
  end
end
