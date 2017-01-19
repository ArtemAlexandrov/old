module Smartcore
  class UserProfileRequest < BaseRequest

    attribute :user_token, String


    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body)).profile
      else
        process_error(response)
      end
    end

    def path
      router.user_sign_in_path
    end
  end
end
