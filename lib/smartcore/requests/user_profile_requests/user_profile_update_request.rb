module Smartcore
  class UserProfileUpdateRequest < BaseRequest

    attribute :user_token, String
    include Smartcore::UserData

    def execute
      responce = execute_request_with_token
      if responce.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(responce.body)).profile
      else
        process_error(responce)
      end
    end

    def path
      router.user_update_path
    end
  end
end
