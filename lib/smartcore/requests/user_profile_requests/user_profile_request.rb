module Smartcore
  class UserProfileRequest < BaseRequest

    attribute :user_token, String


    def execute
      responce = execute_request_with_token
      if responce.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(responce.body)).profile
      else
        process_error(responce)
      end
    end

    def path
      router.user_sign_in_path
    end
  end
end
