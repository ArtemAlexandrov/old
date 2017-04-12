module Smartcore
  class UserProfileRequest < TokenRequest

    attribute :user_token, String


    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileWithDocumentsResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_profile_path
    end
  end
end
