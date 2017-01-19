module Smartcore
  class UserProfileSignOutRequest < BaseRequest

    attribute :user_token,    String

    def execute
      responce = execute_request_with_token
      if responce.status == success_status
        true
      else
        process_error(responce)
      end
    end

    def path
      router.user_sign_out_path
    end
  end
end
