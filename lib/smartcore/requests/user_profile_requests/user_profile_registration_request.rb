module Smartcore
  class UserProfileRegistrationRequest < BaseRequest

    include Smartcore::UserData


    def execute
      responce = execute_request_with_token
      if responce.status == success_status
        UserProfileResponse.new(JSON.parse(responce.body))
      else
        process_error(responce)
      end
    end

    def path
      router.user_create_path
    end
  end
end
