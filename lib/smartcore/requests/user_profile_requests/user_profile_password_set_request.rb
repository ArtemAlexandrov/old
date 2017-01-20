module Smartcore
  class UserProfilePasswordSetRequest < TokenRequest

    attribute :email,        String
    attribute :new_password, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        UserProfilePasswordSetResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_request_password_reset_path
    end
  end
end
