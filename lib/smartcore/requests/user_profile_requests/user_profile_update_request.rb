module Smartcore
  class UserProfileUpdateRequest < TokenRequest

    attribute :user_token, String
    include Smartcore::UserData

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body)).profile
      else
        process_error(response)
      end
    end

    def path
      router.user_update_path
    end
  end
end
