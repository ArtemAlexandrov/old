module Smartcore
  class UserProfileSignOutRequest < TokenRequest

    attribute :user_token,    String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.user_sign_out_path
    end
  end
end
