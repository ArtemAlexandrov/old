module Smartcore
  class UserProfileSignInByIdRequest < TokenRequest

    attribute :profile_id, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      '/sessions/sign_in_by_id'
    end
  end
end
