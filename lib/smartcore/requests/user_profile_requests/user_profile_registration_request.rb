module Smartcore
  class UserProfileRegistrationRequest < TokenRequest

    include Smartcore::UserData
    attribute :password, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_create_path
    end
  end
end
